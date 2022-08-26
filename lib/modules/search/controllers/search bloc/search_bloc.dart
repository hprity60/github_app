import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/data/repositories/search_repository.dart';
import '../../../../utils/constants.dart';
import '../../model/response_body_model.dart';
import 'package:stream_transform/stream_transform.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GithubRepository _searchRepository;

  List<Item>? items = [];

  SearchBloc({
    required GithubRepository searchRepository,
  })  : _searchRepository = searchRepository,
        super(const SearchStateInitial()) {
    on<SearchEventSearch>(search, transformer: debounce());
  //  on<SearchEventLoadMore>(_loadMore);
  }

  void search(SearchEventSearch event, Emitter<SearchState> emit) async {
    emit(const SearchStateLoading());

    try {
      List<Item>? items = await _searchRepository.searchRepos(event.query, event.token, event.page, event.perPage, event.sort, event.order);
      emit(SearchStateLoaded(items: items));
    } catch (e) {
      print(e.toString());
      emit(SearchStateError(e.toString(), 404));
    }
  }

  
}

EventTransformer<Event> debounce<Event>() {
  return (events, mapper) => events.debounce(kDuration).switchMap(mapper);
}
