part of 'browse_state.dart';

mixin _$BrowseState<T> on browse_state.BrowseState<T> {
  Atom _fetchState = new Atom();

  @override
  FetchState get fetchState {
    _fetchState.reportObserved();
    return super.fetchState;
  }

  @override
  set fetchState(FetchState fetchState) {
    super.fetchState = fetchState;
    _fetchState.reportChanged();
  }
}
