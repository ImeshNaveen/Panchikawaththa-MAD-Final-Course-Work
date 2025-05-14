import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align content to the top
          children: [
            Row(
              children: [
                // First column with image
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo.png', // Your image path
                        height: 230,
                        width: 230,
                      ),
                    ],
                  ),
                ),
                // Second column with notification icon
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 130.0,
                          top: 0.0,
                        ), // Add padding for bell.png
                        child: Image.asset(
                          'assets/bell.png', // Your image path
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Add the search bar here, right after the images
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ), // Make hint text gray
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ), // Gray search icon
                  suffixIcon: IconButton(
                    icon: Icon(Icons.mic, color: Colors.grey), // Gray mic icon
                    onPressed: () {
                      // Add voice search logic here
                      print("Voice search tapped");
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.grey), // Gray border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ), // Gray border when enabled
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 197, 195, 195),
                    ), // Gray border when focused
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                style: TextStyle(color: Colors.grey), // Make input text gray
              ),
            ),
            // Add other widgets below if needed
          ],
        ),
      ),
    );
  }
}
