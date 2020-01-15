
bubbleSort(List<num> paramList){
  List<num> list = []..addAll(paramList);
  var changed = true;
    for (var i = list.length-1; i > 0 && changed; i--){
      for (var j = 0; j < i; j++){
        if (list[j] > list[j+1]){
          var temp = list[j];
          list[j] = list[j+1];
          list[j+1] = temp;
          changed = true;
        }
      }
    }
  return list;
}