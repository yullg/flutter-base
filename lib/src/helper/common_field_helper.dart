final _usernameRegExp = RegExp(r'^[a-zA-Z]\w{2,49}$');
final _passwordRegExp = RegExp(r'^\S{6,50}$');
final _phoneRegExp = RegExp(r'^\d{11}$');
final _emailRegExp = RegExp(r'^\S+@\S+\.\S+$');
final _verificationCodeRegExp = RegExp(r'^\d+$');

class CommonFieldHelper {
  static bool isValidUsername(String? username) {
    if (username != null) {
      return _usernameRegExp.hasMatch(username);
    }
    return false;
  }

  static bool isValidPassword(String? password) {
    if (password != null) {
      return _passwordRegExp.hasMatch(password);
    }
    return false;
  }

  static bool isValidPhone(String? phone) {
    if (phone != null) {
      return _phoneRegExp.hasMatch(phone);
    }
    return false;
  }

  static bool isValidEmail(String? email) {
    if (email != null) {
      return _emailRegExp.hasMatch(email);
    }
    return false;
  }

  static bool isValidVerificationCode(String? verificationCode) {
    if (verificationCode != null) {
      return _verificationCodeRegExp.hasMatch(verificationCode);
    }
    return false;
  }

  static String? securePhone(String? phone) {
    if (phone != null && isValidPhone(phone)) {
      return phone.replaceRange(3, 7, "****");
    }
    return phone;
  }

  static String? secureEmail(String? email) {
    if (email != null && isValidEmail(email)) {
      int index = email.lastIndexOf("@");
      if (index > 0) {
        if (index < 3) {
          return email.replaceRange(0, index, "***");
        } else {
          return email.replaceRange(1, index - 1, "***");
        }
      }
    }
    return email;
  }

  CommonFieldHelper._();
}
