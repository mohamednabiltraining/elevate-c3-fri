class ValidationUtils{

  bool isValidEmail(String? email){
    if(email == null) {
      return false;
    }
    if(email.isEmpty) {
      return false;
    }

   return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email);
  }

  bool isValidPassword(String? password){
    if(password == null || password.isEmpty) {
      return false;
    }
    if(password.length < 6){
      return false;
    }
    return true;
  }

}