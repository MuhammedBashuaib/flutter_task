import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/core/errors/exceptions.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/home/data/services/product_services.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final ProductServices productServices;

  static const int _pageSize = 10;
  int _currentSkip = 0;
  bool _hasReachedMax = false;

  GetProductsCubit({required this.productServices})
    : super(GetProductsInitial());

  /// 🔥 جلب الدفعة الأولى من المنتجات
  Future<void> loadFirstPage() async {
    if (state is GetProductsLoading) return;

    emit(GetProductsLoading());
    _currentSkip = 0;
    _hasReachedMax = false;

    try {
      final ProductsResponse response = await productServices.getProducts(
        limit: _pageSize,
        skip: _currentSkip,
      );

      _hasReachedMax = response.products.length < _pageSize;

      emit(
        GetProductsLoaded(
          products: response.products,
          hasMore: !_hasReachedMax,
        ),
      );

      log('✅ First page loaded: ${response.products.length} products');
    } on ServerException catch (e) {
      log('❌ Failed to load first page: ${e.errorModel.message}');
      emit(GetProductsError(message: e.errorModel.message));
    } catch (e) {
      log('❌ Unexpected error loading first page: $e');
      emit(GetProductsError(message: 'Failed to load products'));
    }
  }

  /// 🔥 جلب الدفعة التالية (Infinite Scroll)
  Future<void> loadNextPage() async {
    if (_hasReachedMax || state is GetProductsLoading) return;

    final currentState = state;
    if (currentState is GetProductsLoaded) {
      try {
        _currentSkip += _pageSize;

        final ProductsResponse response = await productServices.getProducts(
          limit: _pageSize,
          skip: _currentSkip,
        );

        _hasReachedMax = response.products.length < _pageSize;

        final allProducts = [...currentState.products, ...response.products];

        emit(
          GetProductsLoaded(products: allProducts, hasMore: !_hasReachedMax),
        );

        log(
          '✅ Next page loaded: ${response.products.length} products, total: ${allProducts.length}',
        );
      } on ServerException catch (e) {
        log('❌ Failed to load next page: ${e.errorModel.message}');
        _currentSkip -= _pageSize; // الرجوع للقيمة السابقة
      } catch (e) {
        log('❌ Unexpected error loading next page: $e');
        _currentSkip -= _pageSize; // الرجوع للقيمة السابقة
      }
    }
  }

  /// 🔥 إعادة تحميل البيانات من البداية
  Future<void> refresh() async {
    await loadFirstPage();
  }

  // 🔥 دوال مساعدة
  bool get isLoading => state is GetProductsLoading;
  bool get hasMore =>
      (state is GetProductsLoaded) && (state as GetProductsLoaded).hasMore;
  List<ProductModel> get currentProducts {
    return state is GetProductsLoaded
        ? (state as GetProductsLoaded).products
        : [];
  }
}
