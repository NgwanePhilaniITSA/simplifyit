import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AuthMethods {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Method to show success dialog
  void _showSuccessModal(
      BuildContext context, String title, String description) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: title,
      desc: description,
      btnOkText: 'OK',
      btnOkColor: Colors.deepPurple,
      btnOkOnPress: () {
        // Close the dialog or perform additional navigation
      },
      customHeader: const Icon(
        Icons.check_circle_outline,
        color: Colors.green,
        size: 50,
      ),
    ).show();
  }

  // Method to show error dialog
  void _showErrorModal(BuildContext context, String title, String description) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: title,
      desc: description,
      btnOkText: 'Close',
      btnOkColor: Colors.red,
      btnOkOnPress: () {
        // Simply close the dialog
      },
      customHeader: const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 50,
      ),
    ).show();
  }

  // Method to handle Google Sign-In
  Future<GoogleSignInAccount?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        return googleUser;
      }
    } catch (e) {
      _showErrorModal(context, "Google Sign-In Error", e.toString());
    }
    return null;
  }

  // Google Registration Handler
  Future<void> registerWithGoogle(
    BuildContext context,
    String email,
    String name,
    String googleId,
  ) async {
    // Simulate registration with Google details (e.g., send data to backend)
    _showSuccessModal(context, 'Registration Successful!',
        'You have been successfully registered with Google');
  }

  // Register with Google - Moved here from RegisterPage.dart
  void registerWithGoogleFromPage(
    BuildContext context,
    void Function() onSuccess,
    void Function(String) onError,
  ) {
    signInWithGoogle(context).then((googleUser) {
      if (googleUser != null) {
        // User signed in with Google, proceed with registration
        registerWithGoogle(
          context,
          googleUser.email,
          googleUser.displayName ?? 'No Name',
          googleUser.id,
        );
        onSuccess(); // Call the success callback
      } else {
        onError("Google Sign-In failed."); // Call the error callback
      }
    });
  }

  // Email Registration Handler
  Future<void> registerWithEmail(
    BuildContext context,
    String email,
    String password,
    GlobalKey<FormState> formKey,
  ) async {
    // Implement your backend registration logic for email-based registration here
    _showSuccessModal(context, 'Registration Successful!',
        'You have been successfully registered with email');
  }
}
