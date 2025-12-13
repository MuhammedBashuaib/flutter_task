import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasck_app/features/home/cubit/fetch_products_cubit.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/custom_product_card.dart';
import 'package:flutter_tasck_app/features/home/presentation/widgets/popular_products_section_loding.dart';

class PopularProductsSection extends StatefulWidget {
  const PopularProductsSection({super.key});

  @override
  State<PopularProductsSection> createState() => _PopularProductsSectionState();
}

class _PopularProductsSectionState extends State<PopularProductsSection> {
  late final ScrollController _scrollController; // متحكم للتحكم في التمرير

  @override
  void initState() {
    super.initState();
    // تهيئة متحكم التمرير وإضافة مستمع له
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll); // عند التمرير، تنفيذ _onScroll
  }

  // دالة تستدعى عند التمرير في القائمة
  void _onScroll() {
    // تشغيل آلية التحميل التدريجي عندما يقترب المستخدم من نهاية القائمة
    context.read<FetchProductsCubit>().handelpagination(
      scrollController: _scrollController, // تمرير المتحكم للتحقق من الموضع
      loadMoreTirgger: 200.0, // مسافة 200 بكسل قبل النهاية لبدء التحميل
    );
  }

  @override
  void dispose() {
    // تنظيف الموارد عند تدمير الواجهة
    _scrollController.removeListener(_onScroll); // إزالة المستمع
    _scrollController.dispose(); // تحرير الذاكرة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // استخدام BlocConsumer للاستماع والتجاوب مع حالة المنتجات
    return BlocConsumer<FetchProductsCubit, FetchProductsState>(
      // المستمع: للتعامل مع الأحداث الجانبية مثل الأخطاء
      listener: (context, state) {
        if (state is FetchProductsFailure) {
          // عرض رسالة خطأ عند فشل التحميل الأولي
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is FetchProductsLoadMoreFailure) {
          // عرض رسالة خطأ عند فشل تحميل المزيد
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      // البناء: إعادة بناء الواجهة بناءً على الحالة
      builder: (context, state) {
        // المتغيرات المحلية لتخزين البيانات المؤقتة
        List<ProductModel> products = []; // قائمة المنتجات الحالية
        bool isInitialLoading = false; // هل التحميل الأولي جاري؟
        bool isLoadingMore = false; // هل تحميل المزيد جاري؟
        bool hasMore = false; // هل هناك المزيد من المنتجات لتحميلها؟

        // تحليل الحالة الحالية وتحديث المتغيرات بناءً عليها
        if (state is FetchProductsLoading) {
          // الحالة: التحميل الأولي للمنتجات
          isInitialLoading = true; // تمييز أن التحميل الأولي جاري
        } else if (state is FetchProductsSuccess) {
          // الحالة: نجاح تحميل المنتجات
          products = state.products; // الحصول على قائمة المنتجات
          hasMore = state.hasMore; // التحقق مما إذا كان هناك المزيد للتحميل
        } else if (state is FetchProductsLoadingMore) {
          // الحالة: جاري تحميل المزيد من المنتجات
          products =
              state.previousResponse.products; // الاحتفاظ بالمنتجات السابقة
          isLoadingMore = true; // تمييز أن تحميل المزيد جاري
          hasMore = state
              .previousHasMore; // التحقق من وجود المزيد بناءً على الاستجابة السابقة
        } else if (state is FetchProductsLoadMoreFailure) {
          // الحالة: فشل تحميل المزيد من المنتجات
          products =
              state.previousResponse.products; // الاحتفاظ بالمنتجات السابقة
          // حساب يدوي لما إذا كان هناك المزيد (لأن حالة الفشل لا تحتوي على hasMore)
          final prev = state.previousResponse;
          hasMore = (prev.skip + prev.limit) < prev.total;
        }

        // عرض مؤشر التحميل فقط أثناء التحميل الأولي وعندما تكون القائمة فارغة
        if (isInitialLoading && products.isEmpty) {
          return PopularProductsSectionLoding();
        }

        // البناء الرئيسي للواجهة
        return Column(
          children: [
            // قائمة المنتجات مع إمكانية التمرير
            ListView.separated(
              controller: _scrollController, // ربط المتحكم للكشف عن التمرير
              shrinkWrap: true, // يجعل القائمة تتكيف مع محتواها
              physics:
                  const NeverScrollableScrollPhysics(), // يمنع التمرير الداخلي (التمرير الخارجي فقط)
              itemBuilder: (context, index) {
                // بناء بطاقة لكل منتج
                final product = products[index];
                return CustomProductCard(
                  key: ValueKey(product.id), // مفتوح فريد لكل منتج
                  product: product, // تمرير بيانات المنتج
                );
              },
              separatorBuilder: (_, __) =>
                  const SizedBox(height: 12), // فاصل بين البطاقات
              itemCount: products.length, // عدد العناصر في القائمة
            ),

            // مؤشر تحميل إضافي أثناء جلب المزيد من البيانات
            if (isLoadingMore)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: CircularProgressIndicator(), // مؤشر تحميل أسفل القائمة
              ),

            // زر "تحميل المزيد" كبديل للتحميل التلقائي
            if (!isLoadingMore && hasMore)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  onPressed: () => context
                      .read<FetchProductsCubit>()
                      .fetchMoreProducts(), // طلب المزيد من المنتجات
                  child: const Text('تحميل المزيد'), // نص الزر
                ),
              ),

            // رسالة عندما لا يكون هناك المزيد من المنتجات للعرض
            if (!hasMore && products.isNotEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'تم عرض جميع المنتجات', // رسالة نهاية القائمة
                  style: TextStyle(
                    color: Colors.grey,
                  ), // لون رمادي للإشارة للمعلومات الثانوية
                ),
              ),

            // رسالة عندما تكون قائمة المنتجات فارغة (لا توجد منتجات)
            if (!isInitialLoading && products.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'لا توجد منتجات للعرض', // رسالة القائمة الفارغة
                  style: TextStyle(
                    color: Colors.grey,
                  ), // لون رمادي للإشارة للمعلومات الثانوية
                ),
              ),
          ],
        );
      },
    );
  }
}
