class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? profilePicture;
  DateTime? dateOfBirth;
  String? gender;
  String? bio;
  DateTime? dateJoined;
  List<String>? socialLinks;
  String? languagePreference;
  Map<String, bool>? notificationSettings;
  bool? isVerified;
  bool? isEmailConfirmed;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.profilePicture,
    this.dateOfBirth,
    this.gender,
    this.bio,
    this.dateJoined,
    this.socialLinks,
    this.languagePreference,
    this.notificationSettings,
    this.isVerified,
    this.isEmailConfirmed,
  });

  // From JSON constructor
  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    profilePicture = json['profilePicture'];
    dateOfBirth = json['dateOfBirth'] != null
        ? DateTime.parse(json['dateOfBirth'])
        : null;
    gender = json['gender'];
    bio = json['bio'];
    dateJoined =
        json['dateJoined'] != null ? DateTime.parse(json['dateJoined']) : null;
    socialLinks = json['socialLinks'] != null
        ? List<String>.from(json['socialLinks'])
        : [];
    languagePreference = json['languagePreference'];
    notificationSettings = json['notificationSettings'] != null
        ? Map<String, bool>.from(json['notificationSettings'])
        : {};
    isVerified = json['isVerified'];
    isEmailConfirmed = json['isEmailConfirmed'] ?? false;
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'address': address,
      'profilePicture': profilePicture,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'bio': bio,
      'dateJoined': dateJoined?.toIso8601String(),
      'socialLinks': socialLinks,
      'languagePreference': languagePreference,
      'notificationSettings': notificationSettings,
      'isVerified': isVerified,
      'isEmailConfirmed': isEmailConfirmed,
    };
  }

  // Validation logic for the profile model
  bool isValid() {
    if (firstName == null || firstName!.isEmpty) {
      return false;
    }
    if (lastName == null || lastName!.isEmpty) {
      return false;
    }
    if (email == null || email!.isEmpty || !email!.contains('@')) {
      return false;
    }
    if (phone == null || phone!.isEmpty || phone!.length < 10) {
      return false;
    }
    if (bio != null && bio!.length > 500) {
      return false; // Validate the bio length (optional)
    }

    return true;
  }
}
