class NavState {
  String route;
  Map<String, String> data;

  NavState({this.route = "", this.data = const {}});

  String get(String key) {
    return data[key] ?? "";
  }

  void changeData(Map<String, String> newData, bool inherit) {
    if (inherit) {
      data.addAll(newData);
    } else {
      data = newData;
    }
  }
}
