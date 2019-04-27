class Pagination {
  int limit;
  int page;

  Pagination({this.limit, this.page});

  Pagination nextPage() {
    return this..page += 1;
  }
}
