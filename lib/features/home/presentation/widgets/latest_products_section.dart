import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/features/home/cubit/horizontal_fetch_products_cubit.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/custom_product_cart_horiz.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/latest_products_section_loding.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class HorizontalPopularProductsSection extends StatefulWidget {
  const HorizontalPopularProductsSection({super.key});

  @override
  State<HorizontalPopularProductsSection> createState() =>
      _HorizontalPopularProductsSectionState();
}

class _HorizontalPopularProductsSectionState
    extends State<HorizontalPopularProductsSection> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // optional: trigger initial load if not loaded yet
    final cubit = context.read<HorizontalFetchProductsCubit>();
    if (cubit.state is HorizontalFetchProductsInitial) {
      cubit.fetchHorizontalProducts(limit: 10, skip: 0);
    }
  }

  void _onScroll() {
    // use the horizontal cubit's pagination helper
    context.read<HorizontalFetchProductsCubit>().handlePagination(
      scrollController: _scrollController,
      loadMoreTirgger: 150.0,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hScreen * .24,
      child:
          BlocConsumer<
            HorizontalFetchProductsCubit,
            HorizontalFetchProductsState
          >(
            listener: (context, state) {
              if (state is HorizontalFetchProductsFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is HorizontalFetchProductsLoadMoreFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              List<ProductModel> products = [];
              bool isInitialLoading = false;
              bool isLoadingMore = false;
              bool hasMore = false;

              if (state is HorizontalFetchProductsLoading) {
                isInitialLoading = true;
              } else if (state is HorizontalFetchProductsSuccess) {
                products = state.products;
                hasMore = state.hasMore;
              } else if (state is HorizontalFetchProductsLoadingMore) {
                products = state.previousResponse.products;
                isLoadingMore = true;
                hasMore = state.previousHasMore;
              } else if (state is HorizontalFetchProductsLoadMoreFailure) {
                products = state.previousResponse.products;
                final prev = state.previousResponse;
                hasMore = (prev.skip + prev.limit) < prev.total;
              }

              if (isInitialLoading && products.isEmpty) {
                // return const Center(child: CircularProgressIndicator());
                return LatestProductsSectionLoding();
              }

              if (products.isEmpty) {
                return const Center(
                  child: Text(
                    'لا توجد منتجات للعرض',
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              final itemCount = products.length + (isLoadingMore ? 1 : 0);

              return ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  if (index < products.length) {
                    final product = products[index];
                    return SizedBox(
                      width: 200,
                      child: CustomProductCartHoriz(
                        key: ValueKey('h-${product.id}'),
                        product: product,
                      ),
                    );
                  }

                  // loading-more indicator item
                  return SizedBox(
                    width: 120,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(strokeWidth: 2.5),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 12),
              );
            },
          ),
    );
  }
}
