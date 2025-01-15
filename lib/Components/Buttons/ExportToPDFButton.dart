import 'package:flutter/material.dart';

// A reusable Export to PDF Button component
class ExportToPDFButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback function when the button is pressed
  final String? label; // Optional label for the button (if needed)

  const ExportToPDFButton({
    Key? key,
    required this.onPressed, // Required: the function that will be called on button press
    this.label, // Optional: to provide a label under the icon if needed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed, // Trigger the passed callback on button press
      icon: const Icon(Icons.download,
          color: Colors.white), // Download icon for exporting
      label: Text(
        label ??
            'PDF', // Default text is 'Export to PDF' if no label is provided
        style: const TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Blue background color for export action
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
