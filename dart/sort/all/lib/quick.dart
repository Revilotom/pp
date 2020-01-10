
List<num> quickSortIterative(List<num> paramList) {

  List<num> list = []..addAll(paramList);
  
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
  return list;
}

List<num> quickSortRecursive(list){
  List<num> l = []..addAll(list);
  quickSortRecursiveHelper(l, 0, l.length - 1);
  return l;
}
// In place
 quickSortRecursiveHelper(List<num> list, startIndex, lastIndex) {
  if (lastIndex - startIndex < 2) {
    return;
  }
  var pivotPos = partiton(list, startIndex, lastIndex);
  quickSortRecursiveHelper(list, startIndex, pivotPos - 1);
  quickSortRecursiveHelper(list, pivotPos, lastIndex);
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
