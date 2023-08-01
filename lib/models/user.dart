class User {
  const User(
      {this.id,
      required this.email,
      required this.gender,
      this.city,
      this.country,
      this.state,
      this.age,
      this.image,
      this.nationality,
      required this.name, this.picture});

  final String? id;
  final String email;
  final String gender;
  final String? city;
  final String? country;
  final String? state;
  final int? age;
  final String? image;
  final String? nationality;
  final UserName? name;
  final Picture? picture;
}

//userName is an object in the JSON so we must create a CLASS for it
class UserName {
  final String title;
  final String first;
  final String last;

  UserName({required this.title, required this.first, required this.last});
}

class Picture {
  final String? large;
  final String? medium;
  final String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});
}
