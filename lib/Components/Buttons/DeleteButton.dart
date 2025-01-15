import 'package:flutter/material.dart';

// A reusable Delete Button component
class DeleteButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback function when the button is pressed
  final String? label; // Optional label for the button (if needed)

  const DeleteButton({
    Key? key,
    required this.onPressed, // Required: the function that will be called on button press
    this.label, // Optional: to provide a label under the icon if needed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed, // Trigger the passed callback on button press
      icon: const Icon(Icons.delete, color: Colors.white), // Icon to display
      label: Text(
        label ?? '', // Default text is 'Delete' if no label is provided
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Red background color
        foregroundColor: Colors.white, // Text color
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
