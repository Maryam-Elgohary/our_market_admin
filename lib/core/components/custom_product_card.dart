import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/cache_image.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/functions/navigate_to.dart';
import 'package:our_market_admin/features/products/view/comments_view.dart';
import 'package:our_market_admin/features/products/view/edit_product.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CacheImage(
              height: 150,
              width: 200,
              url:
                  "https://img.freepik.com/free-photo/sale-with-special-discount-vr-glasses_23-2150040380.jpg?t=st=1739116086~exp=1739119686~hmac=50674df6ab1e31c30ae312456d3292a4b517ea9c9d913f8e4d1c0728052f310f&w=900",
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const Text(
                  "Product Name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Product Description",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                    child: const Icon(Icons.edit),
                    onPressed: () {
                      navigateTo(context, EditProductView());
                    })
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                const Text(
                  "Product Price",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Product Sale",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                    child: const Icon(Icons.comment),
                    onPressed: () {
                      navigateTo(context, CommentsView());
                    })
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomElevatedButton(
                  child: const Row(
                    children: [Icon(Icons.delete), Text("Delete")],
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
