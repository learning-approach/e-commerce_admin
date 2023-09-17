import 'package:ecommerce_admin/const/colors.dart';
import 'package:ecommerce_admin/widgets/custom_button.dart';
import 'package:ecommerce_admin/widgets/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: 30,
            itemBuilder: (_, index) {
              return Card();
            }),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AddNewProduct()));
              },
              label: Text('Add new product')),
        ),
      ],
    );
  }
}

class AddNewProduct extends StatefulWidget {
  AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final TextEditingController _idController = TextEditingController();

  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _categoryController = TextEditingController();

  final TextEditingController _brandController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _discountPriceController =
      TextEditingController();

  final TextEditingController _stockController = TextEditingController();

  final TextEditingController _ratingController = TextEditingController();

  Uint8List? thumb;
  List unit8ListToString = [];

  pickThumbnail() async {
    FilePickerResult? thumbnail = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (thumbnail != null) {
      thumb = thumbnail.files.single.bytes;

      setState(() {});
    } else {
      print('User canceled the picker');
    }
  }

  pickProductImages() async {
    FilePickerResult? listImages = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    if (listImages != null) {
      for (var i = 0; i < listImages.files.length; i++) {
        var a = listImages.files[i].bytes;
        unit8ListToString.add(String.fromCharCodes(a!));
      }
      // print(listImages.files.length);
      // print(unit8ListToString.length);

      setState(() {});
    } else {
      print('User canceled the picker');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fieldTitle('Product ID'),
              productFormField(
                _idController,
                context,
                'product id number',
              ),
              fieldTitle('Product Title'),
              productFormField(
                _titleController,
                context,
                'product name',
              ),
              fieldTitle('Product Description'),
              productFormField(_descriptionController, context, 'description',
                  minLines: 4,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldTitle('Product Category'),
                        productFormField(
                          _categoryController,
                          context,
                          'category name',
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldTitle('Brand'),
                        productFormField(
                          _brandController,
                          context,
                          'brand name',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldTitle('Price After Discount'),
                        productFormField(
                          _priceController,
                          context,
                          'price',
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldTitle('Discount Percentage'),
                        productFormField(
                          _discountPriceController,
                          context,
                          'discount',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldTitle('Total Stock'),
                        productFormField(
                          _stockController,
                          context,
                          'ex: 100',
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        fieldTitle('Product Rating'),
                        productFormField(
                          _ratingController,
                          context,
                          'ex: 5.00',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              fieldTitle('Upload Product Thumbnail'),
              thumb == null
                  ? IconButton(
                      onPressed: () => pickThumbnail(),
                      icon: Icon(Icons.add_circle_outline))
                  : Image.memory(
                      Uint8List.fromList(thumb!),
                      height: 200,
                      width: 200,
                    ),
              fieldTitle('Upload Product Images'),
              unit8ListToString.length < 1
                  ? IconButton(
                      onPressed: () => pickProductImages(),
                      icon: Icon(Icons.add_circle_outline))
                  : SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: unit8ListToString.length,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (_, i) {
                            final unit8List = Uint8List.fromList(
                                (unit8ListToString[i] as String).codeUnits);
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5, color: AppColors.mandarinColor),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.memory(
                                unit8List,
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
              SizedBox(height: 30),
              SizedBox(
                  width: 350,
                  child: customButton(
                    'Continue',
                    () {},
                  )),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

Widget fieldTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
    ),
  );
}
