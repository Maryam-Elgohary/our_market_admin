import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/cache_image.dart';
import 'package:our_market_admin/core/functions/build_custom_app_bar.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Edit Product"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Sale"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("10 %")
                  ],
                ),
                CacheImage(
                    url:
                        "https://img.freepik.com/free-photo/sale-with-special-discount-vr-glasses_23-2150040380.jpg?t=st=1739116086~exp=1739119686~hmac=50674df6ab1e31c30ae312456d3292a4b517ea9c9d913f8e4d1c0728052f310f&w=900",
                    height: 200,
                    width: 300)
              ],
            )
          ],
        ),
      ),
    );
  }
}
