import 'dart:math';

int recCounter = 0;
int recMergeCounter = 0;
int counter = 0;
main() {
  print("hello world");

  List<num> l = [5, 11, 4, 8, 2, 9, 0, -8.9,5, 11, 4, 8, 2, 9, 0, -8.9];
  sortRecursive(l, 0, l.length - 1);
  print(l);

}

List<num> sortIterative(List<num> list) {
  return list;
}

// In place
sortRecursive(List<num> list, startIndex, lastIndex) {

  if (lastIndex - startIndex < 2){
    return;
  }
    var pivotPos = partiton(list, startIndex, lastIndex);
    sortRecursive(list, startIndex, pivotPos - 1);
    sortRecursive(list, pivotPos + 1, lastIndex);
}

int partiton(List<num> list, int low, high) {
  var pivot = list[high];

  for (int i = low; i < high; i++) {
    if (list[i] < pivot) {
      swap(list, i, low);
      low++;
    }
  }

  swap(list, high, low);

  return low;
}

void swap(list, i, lesser) {
  final val = list[i];
  list[i] = list[lesser];
  list[lesser] = val;
  lesser++;
}

// Not in place
// List<num> sortRecursive(List<num> list) {
//   if (list.isEmpty) {
//     return list;
//   }

//   final pivot = list.last;
//   list.remove(pivot);

//   var leftSide = list.where((x) => x < pivot).toList();
//   var rightSide = list.where((x) => !leftSide.contains(x)).toList();

//   print(leftSide);
//   print(rightSide);

//   return sortRecursive(leftSide) + [pivot] + sortRecursive(rightSide);
// }
