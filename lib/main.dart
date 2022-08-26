import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/data/repositories/github_list_repositories.dart';
import 'core/data/repositories/search_repository.dart';
import 'core/router_name.dart';
import 'modules/search/controllers/list_bloc/github_list_bloc.dart';
import 'modules/search/controllers/search bloc/search_bloc.dart';
import 'utils/k_strings.dart';
import 'utils/my_theme.dart';

//late final SharedPreferences _sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

 // _sharedPreferences = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider<SearchBloc>(
              create: (context) => SearchBloc(
                searchRepository: GithubRepositoryImpl(),
              ),
            ),

            BlocProvider<GithubListBloc>(
              create: (context) => GithubListBloc(
                githubListRepository: GithubListRepositoryIml(),
              ),
            ),
        ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Kstrings.appName,
            theme: MyTheme.theme,
            onGenerateRoute: RouteNames.generateRoute,
            initialRoute: RouteNames.githubListScreen,
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ),
              );
            },
            builder: (context, child) {
              return MediaQuery(
                child: child!,
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              );
            },
          )
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:flutter/foundation.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         // Remove the debug banner
// //         debugShowCheckedModeBanner: false,
// //         title: 'Kindacode.com',
// //         theme: ThemeData(
// //           primarySwatch: Colors.pink,
// //         ),
// //         home: const HomePage());
// //   }
// // }

// // class HomePage extends StatefulWidget {
// //   const HomePage({Key? key}) : super(key: key);

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   // We will fetch data from this Rest api
// //   final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

// //   // At the beginning, we fetch the first 20 posts
// //   int _page = 0;
// //   // you can change this value to fetch more or less posts per page (10, 15, 5, etc)
// //   final int _limit = 20;

// //   // There is next page or not
// //   bool _hasNextPage = true;

// //   // Used to display loading indicators when _firstLoad function is running
// //   bool _isFirstLoadRunning = false;

// //   // Used to display loading indicators when _loadMore function is running
// //   bool _isLoadMoreRunning = false;

// //   // This holds the posts fetched from the server
// //   List _posts = [];

// //   // This function will be called when the app launches (see the initState function)
// //   void _firstLoad() async {
// //     setState(() {
// //       _isFirstLoadRunning = true;
// //     });
// //     try {
// //       final res =
// //           await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
// //       setState(() {
// //         _posts = json.decode(res.body);
// //       });
// //     } catch (err) {
// //       if (kDebugMode) {
// //         print('Something went wrong');
// //       }
// //     }

// //     setState(() {
// //       _isFirstLoadRunning = false;
// //     });
// //   }

// //   // This function will be triggered whenver the user scroll
// //   // to near the bottom of the list view
// //   void _loadMore() async {
// //     if (_hasNextPage == true &&
// //         _isFirstLoadRunning == false &&
// //         _isLoadMoreRunning == false &&
// //         _controller.position.extentAfter < 300) {
// //       setState(() {
// //         _isLoadMoreRunning = true; // Display a progress indicator at the bottom
// //       });
// //       _page += 1; // Increase _page by 1
// //       try {
// //         final res =
// //             await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));

// //         final List fetchedPosts = json.decode(res.body);
// //         if (fetchedPosts.isNotEmpty) {
// //           setState(() {
// //             _posts.addAll(fetchedPosts);
// //           });
// //         } else {
// //           // This means there is no more data
// //           // and therefore, we will not send another GET request
// //           setState(() {
// //             _hasNextPage = false;
// //           });
// //         }
// //       } catch (err) {
// //         if (kDebugMode) {
// //           print('Something went wrong!');
// //         }
// //       }

// //       setState(() {
// //         _isLoadMoreRunning = false;
// //       });
// //     }
// //   }

// //   // The controller for the ListView
// //   late ScrollController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _firstLoad();
// //     _controller = ScrollController()..addListener(_loadMore);
// //   }

// //   @override
// //   void dispose() {
// //     _controller.removeListener(_loadMore);
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Kindacode.com'),
// //       ),
// //       body: _isFirstLoadRunning
// //           ? const Center(
// //               child: const CircularProgressIndicator(),
// //             )
// //           : Column(
// //               children: [
// //                 Expanded(
// //                   child: ListView.builder(
// //                     controller: _controller,
// //                     itemCount: _posts.length,
// //                     itemBuilder: (_, index) => Card(
// //                       margin: const EdgeInsets.symmetric(
// //                           vertical: 8, horizontal: 10),
// //                       child: ListTile(
// //                         title: Text(_posts[index]['title']),
// //                         subtitle: Text(_posts[index]['body']),
// //                       ),
// //                     ),
// //                   ),
// //                 ),

// //                 // when the _loadMore function is running
// //                 if (_isLoadMoreRunning == true)
// //                   const Padding(
// //                     padding: EdgeInsets.only(top: 10, bottom: 40),
// //                     child: Center(
// //                       child: CircularProgressIndicator(),
// //                     ),
// //                   ),

// //                 // When nothing else to load
// //                 if (_hasNextPage == false)
// //                   Container(
// //                     padding: const EdgeInsets.only(top: 30, bottom: 40),
// //                     color: Colors.amber,
// //                     child: const Center(
// //                       child: Text('You have fetched all of the content'),
// //                     ),
// //                   ),
// //               ],
// //             ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'core/data/cache/github_cache.dart';
// import 'core/data/cache/github_client.dart';
// import 'core/data/repositories/github_repository.dart';
// import 'modules/search/controllers/github_search_bloc/github_search_bloc.dart';
// import 'search_form.dart';

// void main() {
//   final githubRepository = GithubRepository(
//     GithubCache(),
//     GithubClient(),
//   );

//   runApp(App(githubRepository: githubRepository));
// }

// class App extends StatelessWidget {
//   const App({super.key, required this.githubRepository});

//   final GithubRepository githubRepository;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Github Search',
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Github Search')),
//         body: BlocProvider(
//           create: (_) => GithubSearchBloc(githubRepository: githubRepository),
//           child: const SearchForm(),
//         ),
//       ),
//     );
//   }
// }

