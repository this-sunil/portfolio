
class Validators {

  validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required';
    }


    final usernameRegExp = RegExp(r'^[a-zA-Z]$');

    if (usernameRegExp.hasMatch(username)) {
      return 'Username must be characters';
    }


    if (username.startsWith('_') || username.endsWith('_')) {
      return 'Username cannot start or end with an underscore';
    }

    return null; // Return null if username is valid
  }

  validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }


  validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    return null;
  }

  // Mobile number validation
  validateMobile(String? mobile) {
    if (mobile == null || mobile.isEmpty) {
      return 'Mobile number is required';
    }
    final mobileRegExp = RegExp(r'^\d{10}$');
    if (!mobileRegExp.hasMatch(mobile)) {
      return 'Please enter a valid 10-digit mobile number';
    }
    return null;
  }
}
