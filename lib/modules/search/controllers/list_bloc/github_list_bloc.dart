import 'package:github_search_app/modules/search/model/response_body_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/repositories/github_list_repositories.dart';
import 'github_list_event.dart';
import 'github_list_state.dart';



class GithubListBloc extends Bloc<GithubListEvent, GithubListState> {
  GithubListRepository githubListRepository;
  GithubListBloc({required this.githubListRepository})
      : super(GithubListInitialState()) {
    on<FetchGithubListEvent>(_onfetchGithubLists);
    add(FetchGithubListEvent());
  }

  Future<void> _onfetchGithubLists(
      FetchGithubListEvent event, Emitter<GithubListState> emit) async {
    // try {
    emit(GithubListLoadingState());

    List<Item> items = await githubListRepository.getGithubLists();

    emit(GithubListLoadedState(items: items));
    // } catch (e) {
    //   emit(BannerFailedState(message: e.toString()));
    // }
  }
}
