class LoginModel {
  String? email;
  String? password;

  LoginModel({
    this.email,
    this.password,
  });

  // From JSON constructor
  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  // Validation logic for the login form
  bool isValid() {
    if (email == null || email!.isEmpty || !email!.contains('@')) {
      return false;
    }
    if (password == null || password!.isEmpty || password!.length < 6) {
      return false;
    }
    return true;
  }
}
