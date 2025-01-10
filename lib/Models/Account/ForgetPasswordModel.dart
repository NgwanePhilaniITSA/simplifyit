class ForgotPasswordModel {
  String? email;

  ForgotPasswordModel({
    this.email,
  });

  // From JSON constructor
  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }

  // Validation logic for the forgot password form
  bool isValid() {
    if (email == null || email!.isEmpty || !email!.contains('@')) {
      return false;
    }
    return true;
  }
}
