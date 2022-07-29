import 'package:shared_preferences/shared_preferences.dart';

/// 集成的localStorage类
class LocalStorage {
  /// 传入需要获取的字段名field 以及回调cb（从channel 原生中获得数据）
  /// 然后判断当前的localStorage中是否有field字段的数据，有的话直接返回 没有的话需要set进去
  Future<dynamic> getFieldValueFromStorage(
      String field, Future<dynamic> cb) async {
    final storage = await SharedPreferences.getInstance();
    final String fieldValue = storage.getString(field) ?? '';
    if (fieldValue.isEmpty) {
      final String cbValue = await cb;
      storage.setString(field, cbValue);
      return cbValue;
    } else {
      return fieldValue;
    }
  }

  /// 根据传入的fieldValue的值判断当前需要set哪种类型的数据
  /// 接受传入的字段名以及对应的值信息
  setFieldValueToStorage(String field, dynamic fieldValue) async {
    final storage = await SharedPreferences.getInstance();
    final valueType = fieldValue.runtimeType;
    if (valueType == String) {
      storage.setString(field, fieldValue);
    }
    if (valueType == double) {
      storage.setDouble(field, fieldValue);
    }
    if (valueType == int) {
      storage.setInt(field, fieldValue);
    }
    if (valueType == bool) {
      storage.setBool(field, fieldValue);
    }
    if (valueType == List<String>) {
      storage.setStringList(field, fieldValue);
    }
  }
}
