import 'package:github_search_app/modules/search/model/response_body_model.dart';
import 'package:equatable/equatable.dart';

abstract class GithubListState extends Equatable {
  @override
  List<Object> get props => [];
}

class GithubListInitialState extends GithubListState {}

class GithubListLoadingState extends GithubListState {}

// ignore: must_be_immutable
class GithubListLoadedState extends GithubListState {
  List<Item> items;
  GithubListLoadedState({required this.items});
}

// ignore: must_be_immutable
class GithubListErrorState extends GithubListState {
  String message;
  GithubListErrorState({required this.message});
}
