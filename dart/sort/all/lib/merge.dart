

int recCounter = 0;
int recMergeCounter = 0;

//
//main() {
//  print("hello world");
//
//  List<num> l = [
//    5,
//    11,
//    4,
//    8,
//    2,
//    9,
//    0,
//    -8.9,
//    5,
//    11,
//    4,
//    8,
//    2,
//    9,
//    0,
//    -8.9,
//  ];
//  List<num> rec = sortRecursive(l);
//  print(rec);
//  print("rec counter " + recCounter.toString());
//  print("rec merge counter " + recMergeCounter.toString());
//  List<num> iter = sortIterative(l);
//
//  print(iter);
//
//  for (int i = 0; i < iter.length; i++){
//    assert(iter[i] == rec[i]);
//  }
//}

// Breadth first
List<num> mergeSortIterative(List<num> list) {
  List<List<num>> q = [list];
  List<List<num>> processed = [];

  int firstWhileCounter = 0;

  // This is O(n)
  while (q.isNotEmpty) {
    firstWhileCounter++;
    List<num> l = q.removeLast();
    if (l.length == 1) {
      processed.add(l);
    } else {
      final int midPoint = (l.length - 1) ~/ 2;
      final List<num> left = l.sublist(0, midPoint + 1);
      final List<num> right = l.sublist(midPoint + 1);
      q.insert(0, left);
      q.insert(0, right);
    }
  }

  int secondWhileCounter = 0;

  // this outer loop executes n times, with the average combined length of left and right being log(n)
  // e.g (16 + 2*8 + 4*4 + 8*2)/16 = 4. log(16) = 4.
  while (processed.length > 1) {
    secondWhileCounter++;
    List<num> left = processed.removeLast();
    List<num> right = processed.removeLast();
    processed.insert(0, merge(left, right));
  }

  print("First while counter " + firstWhileCounter.toString());
  print("Second while counter " + secondWhileCounter.toString());

  return processed[0];
}

// Depth first
List<num> mergeSortRecursive(List<num> list) {
  recCounter++;

  if (list.length == 1) {
    return list;
  }

  final int midPoint = (list.length - 1) ~/ 2;
  final List<num> left = list.sublist(0, midPoint + 1);
  final List<num> right = list.sublist(midPoint + 1);

  final List<num> compL = mergeSortRecursive(left);
  final List<num> compR = mergeSortRecursive(right);

  final List<num> merged = merge(compL, compR);
  recMergeCounter++;
  return merged;
}

int add(int index, List<num> list, List<num> n) {
  n.add(list[index]);
  return index + 1;
}

//O(n)
merge(List<num> left, List<num> right) {
  List<num> n = [];
  int lIndex = 0;
  int rIndex = 0;
  for (int i = 0; i < left.length + right.length; i++) {
    if (lIndex >= left.length) {
      rIndex = add(rIndex, right, n);
    } else if (rIndex >= right.length) {
      lIndex = add(lIndex, left, n);
    } else {
      if (left[lIndex] <= right[rIndex]) {
        lIndex = add(lIndex, left, n);
      } else {
        rIndex = add(rIndex, right, n);
      }
    }
  }
  print("merge loop: " +
      (left.length + right.length).toString() +
      " " +
      left.toString() +
      " " +
      right.toString());
  return n;
}
