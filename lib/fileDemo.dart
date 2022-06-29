import 'dart:html';

import 'package:matcher/matcher.dart';
//创建文件
Future<File> get _localFile async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  return File('$path/content.text');
}

//写文件
Future<File> writeContent(String content) async {
  final file = await _localFile;
  return file.writeAsString(content)
}

//从文件读取字符串
Future<String> readContent() async{
  try {
    final file = await _localFile;
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    return '';
    
  }
}
