import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _CustomTextFieldState extends State<CustomTextField> {
  // Create a text controller. Later, use it to retrieve the
  // current value of the TextField.
  final myController = TextEditingController();

@override
void initState() {
  super.initState();

  // Start listening to changes.
}

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next step.
    return Column(
          children: [
            TextField(/*  */
              decoration: InputDecoration(
                hintText: 'Enter your question..',
                border: InputBorder.none,
              ),
              controller: myController,
              onChanged: (text) {
                print('First text field: $text');
              },
            ),
          ],
        );
  }


}
