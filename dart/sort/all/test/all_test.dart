import 'package:all/bubble.dart';
import 'package:all/merge.dart';
import 'package:all/quick.dart';
import 'package:test/test.dart';

void main() {
  const list = [5, 11, 10, 8, 2, 9, 0, 1, 0, 8, 9];
  final correct = [...?list]..sort();

  test('mergeSort', () {
    expect(mergeSortRecursive(list), correct);
    expect(mergeSortIterative(list), correct);
  });

  test('quickSort', () {
    expect(quickSortRecursive(list), correct);
    expect(quickSortIterative(list), correct);
  });

  test('bubblesort', () {
    expect(bubbleSort(list), correct);
  });
}
