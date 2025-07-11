class User{
  String name;
  User._(this.name);

  static User? _instance;
  static User getInstance(){
    if(_instance == null){
      _instance = User._("Mohamed");
    }
    return _instance!;
  }
}

void main(){
 User.getInstance();
}