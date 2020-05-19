class User{

  String uid;
  String email;
  String password;

  User(this.uid, this.email, {this.password});

  @override
  String toString() {
    return 'User{uid: $uid, email: $email, password: $password}';
  }
}