class Info {
  String key;
  String val;
  Info(this.key, this.val);
  @override
  String toString() {
    return '{ ${this.key}, ${this.val} }';
  }
}

List convToList(Map mapToBeConverted) {
  var list = [];
  mapToBeConverted.forEach(
    (k, v) => {
      list.add(
        Info(k, v),
      ),
    },
  );
  return list;
}

Map convToMap(List listToBeConverted) {
  Map map;
  map = Map.fromIterable(
    listToBeConverted,
    key: (k) => k.key,
    value: (v) => v.val,
  );
  return map;
}
