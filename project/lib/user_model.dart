class User {
  final String email;
  final String firstname;
  final String lastname;
  final String address;
  final String contact;

  User({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.contact,
  });
  // User.empty()
  //     : email = '',
  //       firstname = '',
  //       lastname = '',
  //       address = '',
  //       contact = '';
  // Add other methods or factory constructors as needed

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      address: json['address'],
      contact: json['contact'],
    );
  }
}
