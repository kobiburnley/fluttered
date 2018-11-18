
class FetchState {
  static FetchState loading = new FetchState();
  static FetchState resolving = new FetchState();
  static FetchState resolved = new FetchState();
  static FetchState error = new FetchState();
  static FetchState noData = new FetchState();

  bool get isLoading => this == loading;

  bool get isNoData => this == noData;

  bool get isError => this == error;
}
