class ResetPasswordModel {
  String? email;
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  ResetPasswordModel({
    this.email,
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });

  // From JSON constructor
  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
    confirmPassword = json['confirmPassword'];
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }

  // Validation logic for the reset password form
  bool isValid() {
    if (email == null || email!.isEmpty || !email!.contains('@')) {
      return false;
    }
    if (oldPassword == null ||
        oldPassword!.isEmpty ||
        oldPassword!.length < 6) {
      return false;
    }
    if (newPassword == null || newPassword!.length < 6) {
      return false;
    }
    if (newPassword != confirmPassword) {
      return false;
    }
    return true;
  }
}
