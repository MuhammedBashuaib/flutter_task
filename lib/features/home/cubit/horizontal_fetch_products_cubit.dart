import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/core/errors/exceptions.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/home/data/services/product_services.dart';

part 'horizontal_fetch_products_state.dart';

class HorizontalFetchProductsCubit extends Cubit<HorizontalFetchProductsState> {
  HorizontalFetchProductsCubit(this.productServices)
    : super(HorizontalFetchProductsInitial());

  final ProductServices productServices;

  bool _isLoadingMore = false;

  /// جلب الصفحة الأولى (skip = 0) أو صفحة محددة.
  Future<void> fetchHorizontalProducts({
    required int limit,
    required int skip,
  }) async {
    if (skip == 0) emit(HorizontalFetchProductsLoading());

    try {
      log('horizontal: fetch start -> limit:$limit skip:$skip');
      final resp = await productServices.fetchProducts(
        limit: limit,
        skip: skip,
      );
      log('horizontal: fetch end -> received ${resp.products.length} items');
      emit(HorizontalFetchProductsSuccess(resp));
    } on AppException catch (e) {
      emit(HorizontalFetchProductsFailure(e.errorModel.message));
    } catch (e) {
      emit(
        HorizontalFetchProductsFailure(
          'Failed to fetch horizontal products: $e',
        ),
      );
    }
  }

  /// تحميل الصفحة التالية ودمجها مع الموجودة حالياً (مستقل عن الـ main cubit).
  Future<void> fetchMoreHorizontalProducts() async {
    if (_isLoadingMore) return;

    final current = state;
    ProductsResponse? previous;

    if (current is HorizontalFetchProductsSuccess) {
      previous = current.response;
    } else if (current is HorizontalFetchProductsLoadingMore) {
      return;
    } else if (current is HorizontalFetchProductsLoadMoreFailure) {
      previous = current.previousResponse;
    } else {
      return;
    }

    if (previous == null) return;
    final hasMore = (previous.skip + previous.limit) < previous.total;
    if (!hasMore) return;

    final nextSkip = previous.skip + previous.limit;

    _isLoadingMore = true;
    emit(HorizontalFetchProductsLoadingMore(previous));

    try {
      final nextResp = await productServices.fetchProducts(
        limit: previous.limit,
        skip: nextSkip,
      );

      // دمج القوائم مع تجنب التكرار حسب id
      final map = <int, ProductModel>{};
      for (final p in previous.products) map[p.id] = p;
      for (final p in nextResp.products) map[p.id] = p;
      final merged = map.values.toList();

      final combined = ProductsResponse(
        products: merged,
        total: nextResp.total,
        skip: nextSkip, // مهم: نحدث الـ skip إلى offset الحالي
        limit: previous.limit,
      );

      emit(HorizontalFetchProductsSuccess(combined));
    } on AppException catch (e) {
      emit(
        HorizontalFetchProductsLoadMoreFailure(e.errorModel.message, previous),
      );
    } catch (e) {
      emit(
        HorizontalFetchProductsLoadMoreFailure(
          'Failed to load more horizontal products: $e',
          previous,
        ),
      );
    } finally {
      _isLoadingMore = false;
    }
  }

  /// re-usable pagination helper (works for horizontal list too)
  void handlePagination({
    required ScrollController scrollController,
    required double loadMoreTirgger,
  }) {
    if (!scrollController.hasClients) return;
    final offset = scrollController.offset;
    final maxExtent = scrollController.position.maxScrollExtent;
    if (offset >= maxExtent - loadMoreTirgger) {
      fetchMoreHorizontalProducts();
    }
  }
}
