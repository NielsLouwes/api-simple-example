class User {
  const User(
      {this.id,
      required this.email,
      required this.gender,
      required this.location,
      this.age,
      this.image,
      this.nationality,
      required this.name,
      this.picture});

  final String? id;
  final String email;
  final String gender;
  final Location location;
  final int? age;
  final String? image;
  final String? nationality;
  final UserName? name;
  final Picture? picture;

  String get fullName {
    return '${name?.first} ${name?.last}';
  }
}

//userName is an object in the JSON so we must create a CLASS for it
class UserName {
  final String title;
  final String first;
  final String last;

  UserName({required this.title, required this.first, required this.last});
}

class Location {
  final String city;
  final String country;

  Location({required this.city, required this.country});
}

class Picture {
  final String? large;
  final String? medium;
  final String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});
}
