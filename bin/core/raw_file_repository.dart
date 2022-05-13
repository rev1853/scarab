import 'dart:io';

class RawFile {
  final Map<String, String> _rawFiles = <String, String>{};

  void run() {
    print(File(Directory.current.path).path);
  }
}
