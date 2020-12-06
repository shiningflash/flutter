import 'package:firebase_database/firebase_database.dart';

class User {
  String key;
  String name;
  String dob;
  String occupation;
  String location;

  User(this.key, this.name, this.dob, this.occupation, this.location);

  User.fromSnapshot(DataSnapshot snapshot)
    : key = snapshot.value['key'],
      name = snapshot.value['name'],
      dob = snapshot.value['dob'],
      occupation = snapshot.value['occupation'],
      location = snapshot.value['location'];

  toJson() {
    return {
      'name': name,
      'dob': dob,
      'occupation': occupation,
      'location': location,
    };
  }
}