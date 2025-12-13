import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/core/errors/exceptions.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';

import 'package:flutter_tasck_app/features/home/data/services/product_services.dart';

part 'fetch_products_state.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  FetchProductsCubit(this.productServices) : super(FetchProductsInitial());

  final ProductServices productServices;

  // يمنع طلبات تحميل المزيد المتزامنة
  bool _isLoadingMore = false;

  /// جلب الصفحة الأولى أو صفحة محددة (skip, limit).
  /// يرسل حالة Loading فقط عندما يكون skip == 0 (تحميل أولي).
  Future<void> fetchProducts({required int limit, required int skip}) async {
    // إذا نحن بالفعل في حالة تحميل أولي فلا ننفذ طلب آخر
    if (skip == 0) {
      emit(FetchProductsLoading());
    }

    try {
      log('fetchProducts start -> limit:$limit skip:$skip');
      final productsResponse = await productServices.fetchProducts(
        limit: limit,
        skip: skip,
      );
      log(
        'fetchProducts end -> received ${productsResponse.products.length} items',
      );
      emit(FetchProductsSuccess(productsResponse));
    } on AppException catch (e) {
      emit(FetchProductsFailure(e.errorModel.message));
    } catch (e) {
      emit(FetchProductsFailure('Failed to fetch products: $e'));
    }
  }

  Future<void> fetchMoreProducts() async {
    if (_isLoadingMore) return;

    final current = state;
    ProductsResponse? previousResponse;

    if (current is FetchProductsSuccess) {
      previousResponse = current.response;
    } else if (current is FetchProductsLoadingMore) {
      // already loading more
      return;
    } else if (current is FetchProductsLoadMoreFailure) {
      previousResponse = current.previousResponse;
    } else {
      return;
    }

    if (previousResponse == null) return;

    final hasMore =
        (previousResponse.skip + previousResponse.limit) <
        previousResponse.total;
    if (!hasMore) return;

    final nextSkip = previousResponse.skip + previousResponse.limit;

    _isLoadingMore = true;
    emit(FetchProductsLoadingMore(previousResponse));

    try {
      final nextResponse = await productServices.fetchProducts(
        limit: previousResponse.limit,
        skip: nextSkip,
      );

      // دمج القوائم مع الحفاظ على الترتيب (ولإزالة التكرار حسب id إن لزم)
      final merged = <int, ProductModel>{};
      for (final p in previousResponse.products) {
        merged[p.id] = p;
      }
      for (final p in nextResponse.products) {
        merged[p.id] = p;
      }
      final mergedProducts = merged.values.toList();

      // مهم: تحديث skip ليعكس الـ offset بعد الدمج (nextSkip)
      final combined = ProductsResponse(
        products: mergedProducts,
        total: nextResponse.total,
        skip: nextSkip, // <-- هنا التغيير الأساسي
        limit: previousResponse.limit,
      );

      emit(FetchProductsSuccess(combined));
    } on AppException catch (e) {
      emit(
        FetchProductsLoadMoreFailure(e.errorModel.message, previousResponse),
      );
    } catch (e) {
      emit(
        FetchProductsLoadMoreFailure(
          'Failed to load more products: $e',
          previousResponse,
        ),
      );
    } finally {
      _isLoadingMore = false;
    }
  }

  /// استماع للتمرير لتحميل المزيد تلقائياً
  void handelpagination({
    required ScrollController scrollController,
    required double loadMoreTirgger,
  }) {
    if (!scrollController.hasClients) return;
    final offset = scrollController.offset;
    final maxScrollExtent = scrollController.position.maxScrollExtent;
    if (offset >= maxScrollExtent - loadMoreTirgger) {
      fetchMoreProducts();
    }
  }
}
