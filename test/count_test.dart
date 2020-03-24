
import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram2/screens/AddItem.dart';


void main () {
  test('Empty count returns error string',(){
    var result = CountValidator.validate('');
    expect(result, 'Number can\'t be empty');
  });

  test('NON-empty count returns null',(){
    var result = CountValidator.validate('count');
    expect(result, null);
  });

}