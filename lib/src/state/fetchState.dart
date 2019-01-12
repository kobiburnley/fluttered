class FetchState {
  static FetchState fromIterable<T>(Iterable<T> iter) {
    return iter.isEmpty ? FetchState.noData : FetchState.resolved;
  }

  static FetchState loading = new FetchState("loading");
  static FetchState resolving = new FetchState("resolving");
  static FetchState resolved = new FetchState("resolved");
  static FetchState error = new FetchState("error");
  static FetchState noData = new FetchState("noData");

  String id;

  FetchState(this.id);

  bool get isLoading => this == loading;

  bool get isNoData => this == noData;

  bool get isError => this == error;
}
