import 'dart:math';

int recCounter = 0;
int recMergeCounter = 0;
int counter = 0;
main() {
  print("hello world");

  List<num> list = [5, 11, 10, 8, 2, 9, 0, -8.9];
  sortIterative(list);
  print(list);
}

sortIterative(List<num> list) {
  List<List<num>> toDo = [
    [0, list.length - 1]
  ];
  while (toDo.isNotEmpty) {
    var l = toDo.removeLast();

    if (l[1] - l[0] < 2) {
      continue;
    }

    var pivotPos = partiton(list, l[0], l[1]);
    toDo.insert(0, [l[0], pivotPos - 1]);
    toDo.insert(0, [pivotPos, l[1]]);
  }
  print(list);
}

// In place
sortRecursive(List<num> list, startIndex, lastIndex) {
  if (lastIndex - startIndex < 2) {
    return;
  }
  var pivotPos = partiton(list, startIndex, lastIndex);
  sortRecursive(list, startIndex, pivotPos - 1);
  sortRecursive(list, pivotPos, lastIndex);
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
