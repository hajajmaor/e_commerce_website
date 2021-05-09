import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_comm_front/main.dart';
import 'package:e_comm_front/models/product_model.dart';
import 'package:regexpattern/regexpattern.dart';

class ProductEditor extends StatefulWidget {
  final ProductModel? before;
  final bool isNew;
  const ProductEditor({
    Key? key,
    this.before,
    this.isNew = false,
  })  : assert((isNew == false && before != null) || (isNew && before == null)),
        super(key: key);
  @override
  _ProductEditorState createState() => _ProductEditorState();
}

class _ProductEditorState extends State<ProductEditor> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _priceController,
      _titleController,
      _descriptionController,
      _imageController;
  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController(
      text: widget.isNew ? "" : '${widget.before!.price}',
    );
    _titleController = TextEditingController(
      text: widget.isNew ? "" : widget.before!.title,
    );
    _descriptionController = TextEditingController(
      text: widget.isNew ? "" : widget.before!.description,
    );
    _imageController = TextEditingController(
      text: widget.isNew ? "" : widget.before?.image ?? "",
    );
  }

  Widget _buildRow(
          {required String name,
          required TextEditingController controller,
          required String? Function(String?) validator,
          int? maxLines = 1,
          bool isPrice = false}) =>
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            Expanded(
              child: Container(),
            ),
            SizedBox(
              width: 160,
              child: TextFormField(
                  validator: validator,
                  maxLines: maxLines,
                  controller: controller,
                  inputFormatters: isPrice
                      ? [
                          FilteringTextInputFormatter.digitsOnly,
                        ]
                      : null),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(16),
      color: Colors.grey[300],
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              _buildRow(
                name: "Title",
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Please fill the field with a title with atleast 3 chars';
                  }
                  if (value.isNumeric()) {
                    return 'Please fill the field with chars not only digits';
                  }
                  return null;
                },
              ),
              _buildRow(
                name: "Price",
                controller: _priceController,
                isPrice: true,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.isNumeric()) {
                    return 'Please fill the field with numbers';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a positive number';
                  }
                  return null;
                },
              ),
              _buildRow(
                name: "Description",
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Please fill the field with a description with atleast 5 chars';
                  }
                  return null;
                },
              ),
              _buildRow(
                name: "image",
                controller: _imageController,
                maxLines: null,
                validator: (value) {
                  if (value == null || !value.isUrl()) {
                    return 'Please fill the field with a complete url';
                  }
                  return null;
                },
              ),
              const Divider(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        /// if updating
                        if (widget.isNew == false) {
                          final _newProduct = widget.before!.copyWith(
                            description: _descriptionController.text,
                            image: _imageController.text,
                            price: double.tryParse(_priceController.text),
                            title: _titleController.text,
                          );
                          try {
                            context
                                .read(productsProvider)
                                .updateProduct(_newProduct);
                            Navigator.pop(context);
                          } catch (e) {
                            // print(e);
                          }
                        }

                        /// if new product
                        else {
                          final newProduct = ProductModel(
                            description: _descriptionController.text,
                            title: _titleController.text,
                            image: _imageController.text,
                            price: double.parse(_priceController.text),
                          );
                          try {
                            context
                                .read(productsProvider)
                                .createNewProduct(newProduct);
                            Navigator.pop(context);
                          } catch (e) {
                            // print(e);
                          }
                        }
                      }
                    },
                    child: Text(widget.isNew ? 'create' : 'update'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
