// Strings Functions
String $getInitials(String name) {
  String initials = "";

  bool isMultipleNames = name.contains(" ");

  if (isMultipleNames) {
    List<String> names = name.split(" ");
    int numWords = 2;

    if (names.length < 3) {
      numWords = names.length;
    }

    for (var i = 0; i < numWords; i++) {
      initials += '${names[i][0]}';
    }
  } else {
    initials += '${name[0]}';
  }

  return initials;
}

// Sets the very first letter to uppercase
String $majuscule(String words) {
  return words.replaceFirst(words[0], words[0].toUpperCase());
}
