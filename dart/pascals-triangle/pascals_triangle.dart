class PascalsTriangle {
  List<List<int>> rows(int x){
    if(x==0){
      return [];
    }
    if(x==1){
      return [[1]];
    }
    List<List<int>> prev = rows(x-1);
    List<int> nxt = [1,1];
    for (int i = 0; i < x-2; i++) {
        nxt.insert(i+1,prev.last[i]+prev.last[i+1]);
    };
    prev.add(nxt);
    return prev;
  }
}
