class User {
  String firstName, lastName;

  User({this.firstName, this.lastName});

  static List<User> getUsers() {
    return <User>[
      User(firstName: "Amirul", lastName: "Islam"),
      User(firstName: "Faizun", lastName: "Faria"),
      User(firstName: "Bagdad", lastName: "Ahmed"),
      User(firstName: "Samiul", lastName: "Islam"),
      User(firstName: "Afia", lastName: "Abedin"),
      User(firstName: "Rownak", lastName: "Jahan"),
      User(firstName: "Tashfiah", lastName: "Ali"),
    ];
  }
}