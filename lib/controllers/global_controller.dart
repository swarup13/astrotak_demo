import 'package:intl/intl.dart';

class Globals {
  static bool checkEmpty(mixedVar) {
    //print('checkEmpty in 1');
    if (mixedVar is List || mixedVar is Map) {
      if (mixedVar.isEmpty) {
        return true;
      }
    } else {
      //print('checkEmpty in 2');
      var undef;
      var undefined;
      var i;
      var emptyValues = [
        undef,
        null,
        'null',
        'Null',
        'NULL',
        false,
        0,
        '',
        '0',
        '0.00',
        '0.0',
        'empty',
        undefined,
        'undefined'
      ];
      var len = emptyValues.length;
      if (mixedVar is String) {
        mixedVar = mixedVar.trim();
      }

      for (i = 0; i < len; i++) {
        if (mixedVar == emptyValues[i]) {
          return true;
        }
      }
    }
    return false;
  }

  static final formattedDate = DateFormat("yyyy-MM-dd");
  static final formattedTime = DateFormat.Hm();
}
