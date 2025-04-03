import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool isAvailable = false;
  List<XFile> files = [];
  String? selectedCategory;
  String? selectedTag;
  String? discountType = 'Percent';

  final ImagePicker picker = ImagePicker();

  List<String> categories = [];

  List<String> tags = [
    'None',
    'Veg',
    'Non Veg',
    'New Arrival',
    'Recommended',
    'Organic',
    'Custom',
  ];

  List<String> discountTypes = ['Percent', 'Amount'];

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          files.add(image);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: ${e.toString()}')),
      );
    }
  }

  void imagePickOption() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Colors.red.shade400,
                    ),
                    SizedBox(width: 10),
                    Text("Open Camera"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.photo_library,
                      size: 20,
                      color: Colors.red.shade400,
                    ),
                    SizedBox(width: 10),
                    Text("Select From Gallery"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Add Product",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: Colors.black12),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        commonTextBox(
                          hintText: "Enter Product Name",
                          helperText: "Product name cannot be empty",
                          labelText: "Product Name",
                        ),
                        SizedBox(height: 10),

                        // Category Dropdown
                        DropdownButtonFormField<String>(
                          borderRadius: BorderRadius.circular(10),
                          decoration: InputDecoration(
                            labelText: 'Category',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey.shade600,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 7),
                          ),
                          hint: Text('Select Category'),
                          value: selectedCategory,
                          items:
                              categories.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                          },
                        ),
                        SizedBox(height: 10),

                        commonTextBox(
                          maxLines: 5,
                          hintText: "Enter Description...",
                          labelText: "Description",
                        ),
                        SizedBox(height: 10),

                        // Tag Dropdown
                        DropdownButtonFormField<String>(
                          borderRadius: BorderRadius.circular(10),
                          decoration: InputDecoration(
                            labelText: 'Select Tag',
                            labelStyle: TextStyle(
                              color: Colors.blueGrey.shade600,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 7),
                          ),
                          value: selectedTag,
                          items:
                              tags.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedTag = newValue;
                            });
                          },
                        ),
                        SizedBox(height: 10),

                        commonTextBox(
                          hintText: "Enter keywords (with comma ',')",
                          helperText: "",
                          labelText: "Keywords",
                        ),
                        SizedBox(height: 2),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              "Add Product Image",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),

                        // Replace your current image display Row widget with this code:
                        SizedBox(
                          height:
                              110, // Fix height to match images & upload container
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              // "Upload Image" container (Always fixed on the left)
                              InkWell(
                                onTap: () {
                                  if (files.length < 4) {
                                    imagePickOption(); // Function to pick image
                                  } else {
                                    // Show notification if more than 4 images selected
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Total Image should not be more than 4",
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                },
                                child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  dashPattern: [4, 1],
                                  radius: Radius.circular(12),
                                  color:
                                      files.isEmpty
                                          ? Colors.red
                                          : Colors
                                              .black, // Change color based on images count
                                  child: Container(
                                    height: 110,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.drive_folder_upload_outlined,
                                          color:
                                              files.isEmpty
                                                  ? Colors.red
                                                  : Colors
                                                      .black, // Color changes based on image count
                                          weight: 5,
                                        ),
                                        Text(
                                          "Upload Images",
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                files.isEmpty
                                                    ? Colors.red
                                                    : Colors
                                                        .black, // Color changes based on image count
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Spacing between upload button and images
                              SizedBox(width: 10),

                              // Image list (Appears right to the upload button)
                              ...files
                                  .take(4)
                                  .map(
                                    (file) => Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            child: Image.network(
                                              file.path,
                                              width:
                                                  110, // Same as upload container
                                              height:
                                                  110, // Same as upload container
                                              fit: BoxFit.cover,
                                              errorBuilder: (
                                                context,
                                                error,
                                                stackTrace,
                                              ) {
                                                return Container(
                                                  width: 110,
                                                  height: 110,
                                                  color: Colors.grey[200],
                                                  child: Icon(
                                                    Icons.broken_image,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            top: 5,
                                            right: 5,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  files.remove(file);
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black54,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Availability Timing",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isAvailable,
                              onChanged: (value) {
                                setState(() {
                                  isAvailable = value!;
                                });
                              },
                            ),
                            Text(
                              "Always Available",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(child: commonTextBox()),
                            SizedBox(width: 5),
                            Expanded(child: commonTextBox()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: commonTextBox(
                                hintText: "Sort",
                                helperText: "Sort cannot be empty",
                                labelText: "Sort",
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: commonTextBox(
                                hintText: "Weight/No. of pieces/ml",
                                labelText: "Weight/No. of pieces/ml",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: commonTextBox(
                                hintText: "MRP",
                                labelText: "MRP",
                              ),
                            ),
                            SizedBox(width: 5),
                            // Discount Type Dropdown
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                borderRadius: BorderRadius.circular(10),
                                decoration: InputDecoration(
                                  labelText: 'Discount Type',
                                  labelStyle: TextStyle(
                                    color: Colors.blueGrey.shade600,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 7,
                                  ),
                                ),
                                value: discountType,
                                items:
                                    discountTypes.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    discountType = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: commonTextBox(
                                hintText: "Discount",
                                labelText: "Discount",
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: commonTextBox(
                                hintText: "Price",
                                labelText: "Price",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Checkbox(
                              value: isAvailable,
                              onChanged: (value) {
                                setState(() {
                                  isAvailable = value!;
                                });
                              },
                            ),
                            Text(
                              "Enter Variant Stocks",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // add more variant button
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.maxFinite, // Button Width
                      height: 45, // Button Height
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red.shade400, // Button color
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // Rounded Button
                      ),
                      child: Text(
                        "Add more Variant",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Save button
          SafeArea(
            child: Container(
              height: 75, // Fixed height
              padding: EdgeInsets.only(top: 0), // Padding on top
              decoration: BoxDecoration(
                color: Colors.white, // Background color
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Continue Button at Center
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 330, // Button Width
                        height: 50, // Button Height
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green, // Button color
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // Rounded Button
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget commonTextBox({
  String? hintText,
  TextInputType? keyboardType,
  String? labelText,
  String? helperText,
  int? maxLines = 1
}) {
  return TextFormField(
    maxLines: maxLines,
    keyboardType:
        keyboardType ?? TextInputType.text, // Default: TextInputType.text
    decoration: InputDecoration(
      labelText: labelText ?? '', // Default: Empty String
      labelStyle: TextStyle(
        color: Colors.blueGrey.shade600,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
      hintText: hintText ?? '',
      hintStyle: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      helperText: helperText,
      helperStyle: TextStyle(color: Colors.red.shade800),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black38),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 7),
    ),
  );
}
