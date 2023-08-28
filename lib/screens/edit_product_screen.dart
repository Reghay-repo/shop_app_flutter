import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-product';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  Product _editedProduct =
      Product(id: '', description: '', imageUrl: '', price: 0, title: '');

  @override
  void initState() {
    _imageFocusNode.addListener(_updateImage);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.removeListener(_updateImage);
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateImage() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    _form.currentState!.save();
    print(_editedProduct.description);
    print(_editedProduct.title);
    print(_editedProduct.price);
    print(_editedProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _saveForm, icon: Icon(Icons.save))],
        title: const Text('Edit product'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  onSaved: (value) {
                    _editedProduct = Product(
                        id: '',
                        description: _editedProduct.description,
                        imageUrl: _editedProduct.imageUrl,
                        price: _editedProduct.price,
                        title: value.toString());
                  },
                  decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)))),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  onSaved: (value) {
                    _editedProduct = Product(
                        id: '',
                        description: _editedProduct.description,
                        imageUrl: _editedProduct.imageUrl,
                        price: double.parse(value.toString()),
                        title: _editedProduct.title);
                  },
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  onSaved: (value) {
                    _editedProduct = Product(
                        id: '',
                        description: value.toString(),
                        imageUrl: _editedProduct.imageUrl,
                        price: _editedProduct.price,
                        title: _editedProduct.title);
                  },
                  maxLines: 3,
                  focusNode: _descriptionFocusNode,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  // textInputAction: TextInputAction.next,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // image preview container
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 3, right: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? const Text('Enter Image URL')
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  // input here,
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      textInputAction: TextInputAction.done,
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: '',
                            description: _editedProduct.description,
                            imageUrl: value.toString(),
                            price: _editedProduct.price,
                            title: _editedProduct.title);
                      },
                      keyboardType: TextInputType.url,
                      controller: _imageUrlController,
                      focusNode: _imageFocusNode,
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
