
bubbleSort(List<num> paramList){
  List<num> list = []..addAll(paramList);
  var changed = true;
  while(changed){
    changed = false;
    for (var i = 0; i < list.length-1; i++){
      if (list[i] > list[i+1]){
        var temp = list[i];
        list[i] = list[i+1];
        list[i+1] = temp;
        changed = true;
      }
    }
  }
  return list;
}