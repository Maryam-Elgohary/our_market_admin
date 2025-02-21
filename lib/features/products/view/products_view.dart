import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/components/custom_circle_pro_ind.dart';
import 'package:our_market_admin/core/components/custom_product_card.dart';
import 'package:our_market_admin/core/functions/build_custom_app_bar.dart';
import 'package:our_market_admin/core/functions/navigate_without_back.dart';
import 'package:our_market_admin/core/functions/show_msg.dart';
import 'package:our_market_admin/features/home/view/home_view.dart';
import 'package:our_market_admin/features/products/cubit/cubit/products_cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is DeleteProductSuccess) {
            showMsg(context, "Product Deleted Successfully");
            navigateWithoutBack(context, HomeView());
          }
        },
        builder: (context, state) {
          ProductsCubit cubit = context.read<ProductsCubit>();

          return Scaffold(
            appBar: buildCustomAppBar(context, "Products"),
            body: state is GetProductsLoading || state is DeleteProductLoading
                ? CustomCircleProgIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: cubit.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomProductCard(
                          deleteProduct: () {
                            cubit.deleteProduct(
                                productId: cubit.products[index].productId!);
                          },
                          product: cubit.products[index],
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
