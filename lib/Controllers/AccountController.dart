import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:simplifyit/Login.dart'; // Ensure this import is correct for your project

import '../HomePage.dart'; // Ensure this import is correct for your project

class AccountController {
  // Method for Login
  void login(BuildContext context, String email, String password,
      GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      // Simulating login success for now
      _showSuccessModal(context);
    } else {
      _showErrorModal(context, 'Please fix the errors in the form.');
    }
  }

  // Method for Register
  void register(BuildContext context, String email, String password,
      String confirmpassword, GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      _showRegisterSuccessDialog(context); // Show registration success dialog
    } else {
      _showErrorModal(context, 'Please fix the errors in the form.');
    }
  }

  // Method for Change Password
  void changePassword(BuildContext context, String oldPassword,
      String newPassword, GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      // Simulating password change success for now
      _showSuccessModal(context);
    } else {
      _showErrorModal(context, 'Please fix the errors in the form.');
    }
  }

  // Method for Forgot Password
  void forgotPassword(
      BuildContext context, String email, GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      // Simulating password reset request success for now
      _showSuccessModal(context);
    } else {
      _showErrorModal(context, 'Please fix the errors in the form.');
    }
  }

  // Show success modal and navigate to HomePage
  void _showSuccessModal(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Success',
      desc: 'Operation Successful!',
      btnOkText: 'OK',
      btnOkColor: Colors.deepPurple,
      btnOkOnPress: () {
        // Navigate to HomePage after success
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      customHeader: Icon(
        Icons.check_circle_outline,
        color: Colors.green,
        size: 50,
      ),
    ).show();
  }

  // Show success modal for registration and navigate to LoginPage
  void _showRegisterSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: 'Success',
      desc: 'Registration Successful!',
      btnOkText: 'OK',
      btnOkColor: Colors.green,
      btnOkOnPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage()), // Navigate to LoginPage
        );
      },
    ).show();
  }

  // Show error modal
  void _showErrorModal(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: 'Error',
      desc: message,
      btnOkText: 'OK',
      btnOkColor: Colors.deepPurple,
      btnOkOnPress: () {},
      customHeader: Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 50,
      ),
    ).show();
  }
}
