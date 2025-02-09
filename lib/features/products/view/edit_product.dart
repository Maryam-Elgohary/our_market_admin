import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/cache_image.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_custom_app_bar.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({super.key});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  String selectedValue = "Collections";
  String sale = "10";
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _newPriceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
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
                DropdownMenu(
                  initialSelection: selectedValue,
                  onSelected: (String? value) {
                    setState(() {
                      selectedValue = value ?? "Collections";
                      print(selectedValue);
                    });
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: "Sports", label: "Sports"),
                    DropdownMenuEntry(
                        value: "Electronics", label: "Electronics"),
                    DropdownMenuEntry(
                        value: "Collections", label: "Collections"),
                    DropdownMenuEntry(value: "Books", label: "Books"),
                    DropdownMenuEntry(value: "Bikes", label: "Bikes")
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text("Sale"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("$sale %")
                  ],
                ),
                Column(
                  children: [
                    const CacheImage(
                        url:
                            "https://img.freepik.com/free-photo/sale-with-special-discount-vr-glasses_23-2150040380.jpg?t=st=1739116086~exp=1739119686~hmac=50674df6ab1e31c30ae312456d3292a4b517ea9c9d913f8e4d1c0728052f310f&w=900",
                        height: 200,
                        width: 300),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomElevatedButton(
                            child: const Icon(Icons.image), onPressed: () {}),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomElevatedButton(
                            child: const Icon(Icons.upload_file_rounded),
                            onPressed: () {})
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            CustomField(
              labelText: "Product Name",
              controller: _productNameController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomField(
              labelText: "New Price",
              controller: _newPriceController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomField(
              labelText: "Old Price",
              controller: _oldPriceController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomField(
              labelText: "Product Description",
              controller: _productDescriptionController,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text("Update"),
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _newPriceController.dispose();
    _oldPriceController.dispose();
    _productDescriptionController.dispose();
    super.dispose();
  }
}
