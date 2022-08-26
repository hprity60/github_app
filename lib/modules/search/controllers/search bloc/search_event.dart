part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchEventSearch extends SearchEvent {
  final String query;
  final int perPage;
  final int page;
  final String sort;
  final String order;
  final String token;
  const SearchEventSearch(
    this.token,
    this.query, this.order, this.page, this.perPage, this.sort);

  @override
  List<Object> get props => [query, page, perPage, sort, order, token];
}

class SearchEventLoadMore extends SearchEvent {
  const SearchEventLoadMore();
}
