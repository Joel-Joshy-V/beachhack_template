import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:phishing_ui/screens/progress_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  File? _selectedFile;
  TextEditingController _controller = TextEditingController();
  String _searchResult = "";
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Allow only PDF files
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  void _performSearch() {
    setState(() {
      _searchResult = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SEARCH',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(171, 0, 0, 0), // Alert color
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Apply border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      0.2,
                    ), // Shadow color with opacity
                    spreadRadius: 2, // How much the shadow spreads
                    blurRadius: 4, // Softness of the shadow
                    offset: Offset(0, 2), // Offset in X and Y direction
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  8,
                ), // Ensure clipping follows the border radius
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Paste Your Link',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none, // Removes the default border
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ), // Search icon
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(onPressed: _performSearch, child: Text('Search')),
            SizedBox(height: 16),
            Text(
              'Link Status : SECURE',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(171, 0, 0, 0), // Alert color
              ),
            ),

            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: Icon(Icons.upload_file),
              label: Text("Select PDF"),
            ),
            SizedBox(height: 10),
            _selectedFile != null
                ? Text("Selected File: ${_selectedFile!.path.split('/').last}")
                : Text("No file selected"),
            SizedBox(
              width: 500,
              height: 500,
              child: ProgressScreen(percentage: 75),
            ),
          ],
        ),
      ),
    );
  }
}
