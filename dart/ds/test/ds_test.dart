import 'package:ds/ds.dart';
import 'package:ds/binaryTree.dart';
import 'package:test/test.dart';

void main() {

  test('dynamicBT', () {

    const list = [11, 10, 8, 2, 9, 0, 1, 0, 8, 9];
    var bt = new BTDynamic(5);
    list.forEach((f) => bt.insert(f));

    expect(bt.sortedList, [0, 0, 1, 2, 5, 8, 8, 9, 9, 10, 11]);

  });
  test('arrayBT', () {

    const list = [11, 10, 8, 2, 9, 0, 1, 0, 8, 9];
    var bt = new BTArray(5);
    list.forEach((f) => bt.insert(f));

    expect(bt.sortedList, [0, 0, 1, 2, 5, 8, 8, 9, 9, 10, 11]);
    
  });
}
