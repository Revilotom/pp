insertionSort(List<num> paramList){

  List<num> list = []..addAll(paramList);

  var j = 0;
  for (var i = 0; i < list.length; i++){
    j = i;
    while(j > 0 && list[j] < list[j-1]){
      swap(list, j, j-1);
      j--;
    }
  }
  return list;

}

swap(list, index1, index2){
  var temp = list[index1];
  list[index1] = list[index2];
  list[index2] = temp;
}