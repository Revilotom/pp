class BTArray {
  List<num> array = List.filled(1000, -1);

  BTArray(num value) {
    array[1] = (value);
  }

  insert(num value) {
    _insertHelper(1, value);
  }

  _insertHelper(num index, num value) {
    if (value < array[index]) {
      if (array[_getLeft(index)] != -1) {
        _insertHelper(_getLeft(index), value);
      } else {
        array[_getLeft(index)] = value;
      }
    } else {
      if (array[_getRight(index)] != -1) {
        _insertHelper(_getRight(index), value);
      } else {
        array[_getRight(index)] = value;
      }
    }
  }

  List<num> get sortedList {
    var list = List<num>();
    _getSortedListHelper(1, list);
    return list;
  }

  _getSortedListHelper(num index, List<num> list) {
    if (array[_getLeft(index)] != -1) {
      _getSortedListHelper(_getLeft(index), list);
    }
    list.add(array[index]);
    if (array[_getRight(index)] != -1) {
      _getSortedListHelper(_getRight(index), list);
    }
  }

  _getLeft(num index) {
    return index * 2;
  }

  _getRight(num index) {
    return (index * 2) + 1;
  }
}

class BTDynamic {
  Node root;

  BTDynamic(num value) {
    root = Node(value);
  }

  void insert(num value) {
    _insertHelper(Node(value), root);
  }

  void _insertHelper(Node node, Node current) {
    if (node.value < current.value) {
      if (current.left != null) {
        _insertHelper(node, current.left);
      } else {
        current.left = node;
      }
    } else {
      if (current.right != null) {
        _insertHelper(node, current.right);
      } else {
        current.right = node;
      }
    }
  }

  List<num> get sortedList {
    var list = List<num>();
    _getSortedListHelper(root, list);
    return list;
  }

  _getSortedListHelper(Node node, List<num> list) {
    if (node.left != null) {
      _getSortedListHelper(node.left, list);
    }
    list.add(node.value);
    if (node.right != null) {
      _getSortedListHelper(node.right, list);
    }
  }
}

class Node {
  num value;
  Node left;
  Node right;

  Node(value) {
    this.value = value;
  }
}
