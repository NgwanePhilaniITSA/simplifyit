class RegisterModel {
  String? email;
  String? password;
  String? confirmPassword;

  RegisterModel({
    this.email,
    this.password,
    this.confirmPassword,
  });

  // From JSON constructor
  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  // Validation logic for the registration form
  bool isValid() {
    if (email == null || email!.isEmpty || !email!.contains('@')) {
      return false;
    }
    if (password == null || password!.length < 6) {
      return false;
    }
    if (password != confirmPassword) {
      return false;
    }
    return true;
  }
}
