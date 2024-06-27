class Validation{

  static String? validateEmail(String value){
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    // Regular expression for basic email validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String value){
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    // Additional validation can be added (e.g., minimum length)
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}

