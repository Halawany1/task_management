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
    if (value.length < 7) {
      return 'Password must be at least 7 characters';
    }
    return null;
  }
    static String? validateName(String value){
      if (value.isEmpty) {
        return 'Please enter your name';
      }
    // Additional validation can be added (e.g., minimum length)
    if (value.length < 5) {
      return 'Name must be at least 5 characters';
    }
    return null;
  }

  static String? validateTitle(String title) {
    if (title.isEmpty) {
      return 'Title cannot be empty.';
    }
    if (title.length > 100) {
      return 'Title cannot be more than 100 characters.';
    }
    return null;
  }

  static String? validateDescription(String description) {
    if (description.isEmpty) {
      return 'Description cannot be empty.';
    }
    if (description.length > 500) {
      return 'Description cannot be more than 500 characters.';
    }
    return null;
  }
}

