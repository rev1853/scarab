class FileHelper {
  static String replaceContent(String content, Map<String, dynamic> replacer) {
    for (var key in replacer.keys) {
      content = content.replaceAll('<<$key>>', replacer[key].toString());
    }
    return content;
  }
}
