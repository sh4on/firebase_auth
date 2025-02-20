String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Email cannot be empty";
  }
  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return "Enter a valid email address";
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Password cannot be empty";
  }
  if (value.length < 6) {
    return "Password must be at least 6 characters";
  }
  return null;
}