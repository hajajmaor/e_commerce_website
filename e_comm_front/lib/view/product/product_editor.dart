import 'package:e_comm_front/main.dart';
import 'package:e_comm_front/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductEditor extends StatefulWidget {
  final ProductModel before;

  const ProductEditor({Key? key, required this.before}) : super(key: key);
  @override
  _ProductEditorState createState() => _ProductEditorState();
}

class _ProductEditorState extends State<ProductEditor> {
  late final TextEditingController _priceController,
      _titleController,
      _descriptionController,
      _imageController;
  @override
  void initState() {
    super.initState();
    _priceController = TextEditingController(
      text: '${widget.before.price}',
    );
    _titleController = TextEditingController(
      text: widget.before.title,
    );
    _descriptionController = TextEditingController(
      text: widget.before.description,
    );
    _imageController = TextEditingController(
      text: widget.before.imageUrl,
    );
  }

  Widget _buildRow(
          {required String name,
          required TextEditingController controller,
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
              child: TextField(
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
      width: 300,
      color: Colors.grey[300],
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildRow(name: "Title", controller: _titleController),
            _buildRow(
                name: "Price", controller: _priceController, isPrice: true),
            _buildRow(name: "Description", controller: _descriptionController),
            _buildRow(
                name: "image", controller: _imageController, maxLines: null),
            const Divider(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    if ((_imageController.text != widget.before.imageUrl) ||
                        (_titleController.text != widget.before.title) ||
                        (double.parse(_priceController.text) !=
                            widget.before.price) ||
                        (_descriptionController.text !=
                            widget.before.description)) {
                      final _newProduct = widget.before.copyWith(
                        description: _descriptionController.text,
                        imageUrl: _imageController.text,
                        price: double.tryParse(_priceController.text),
                        title: _titleController.text,
                      );
                      context.read(productsProvider).updateProduct(_newProduct);
                    }
                  },
                  child: const Text('update'),
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
    );
  }
}
