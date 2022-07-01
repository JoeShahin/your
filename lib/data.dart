class User {
  String? username;
  String? email;
  String? nationalty;
  String? rank;

  User({this.username, this.email, this.nationalty, this.rank});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    nationalty = json['nationalty'];
    rank = json['rank'];
  }
}
