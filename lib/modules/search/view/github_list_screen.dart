import 'package:github_search_app/modules/search/controllers/list_bloc/github_list_bloc.dart';
import 'package:github_search_app/modules/search/controllers/list_bloc/github_list_event.dart';
import 'package:github_search_app/modules/search/controllers/list_bloc/github_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/error.dart';
import '../components/list.dart';
import '../components/loading.dart';
import '../controllers/search bloc/search_bloc.dart';


class GithubListScreen extends StatefulWidget {
  const GithubListScreen({Key? key}) : super(key: key);

  @override
  _GithubListScreenState createState() => _GithubListScreenState();
}

class _GithubListScreenState extends State<GithubListScreen> {

  @override
  Widget build(BuildContext context) {
    final githubListBloc =
        BlocProvider.of<GithubListBloc>(context).add(FetchGithubListEvent());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: GithubRepoSearch(
                        searchBloc: BlocProvider.of<SearchBloc>(context)));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<GithubListBloc, GithubListState>(
            builder: (context, state) {
          if (state is GithubListInitialState) {
            return buildLoading();
          } else if (state is GithubListLoadingState) {
            return buildLoading();
          } else if (state is GithubListLoadedState) {
            return buildGithubList(state.items);
          } else if (state is GithubListErrorState) {
            return buildError(state.message);
          }
          return Container();
        }),
      ),
    );
  }
}

class GithubRepoSearch extends SearchDelegate<List> {
  SearchBloc searchBloc;

  String order;

  int page;

  int perPage;

  String sort;
  
  String token;
  GithubRepoSearch(
      {required this.searchBloc,
      this.order = 'desc',
      this.page = 1,
      this.perPage = 10,
      this.token = '',
      this.sort = 'stars'});
  late String queryString;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, []);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc.add(SearchEventSearch(query, order, token, perPage, page, sort));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        if (state is SearchStateLoading) {
          return buildLeading(context);
        }
        if (state is SearchStateError) {
          return buildError(state.message);
        }
        if (state is SearchStateLoaded) {
          if (state.items!.isEmpty) {
            return const Center(
              child: Text('No Results'),
            );
          }
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.items![index].name!),
                      ],
                    ),
                  
                );

              },
              itemCount: state.items!.length);
        }
        return const Scaffold();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
