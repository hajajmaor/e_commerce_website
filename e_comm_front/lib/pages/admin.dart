import 'package:e_comm_front/main.dart';
import 'package:e_comm_front/models/product_model.dart';
import 'package:e_comm_front/view/app_bar.dart';
import 'package:e_comm_front/view/cart_view.dart';
import 'package:e_comm_front/view/product/product_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminPage extends ConsumerWidget {
  static const name = 'admin';
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final proProvider = watch(productsProvider);
    final List<ProductModel> _products = proProvider.getCurrentCart;
    return Scaffold(
      endDrawer: CartView(),

      appBar: getAppBar(context),
      // appBar: ApplicationAppBar(),
      // appBar: AppBar(
      //   actions: [NavBar()],
      // ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(150),
              1: FixedColumnWidth(100),
              2: FixedColumnWidth(250),
              3: FixedColumnWidth(400),
              4: FixedColumnWidth(250),
            },
            border: TableBorder.all(
              width: 2,
            ),
            children: _products
                .map(
                  (ProductModel e) => TableRow(
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.title),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${e.price}\$'),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e.description),
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.imageUrl),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: ProductEditor(before: e),
                                    ),
                                  );
                                },
                                child: const Text('edit'),
                              ),
                              TextButton(
                                onPressed: () {
                                  proProvider.removeFromStore(e);
                                },
                                child: const Text('delete'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
