import 'dart:convert';

import 'package:github_search_app/core/remote_urls.dart';
import 'package:github_search_app/modules/search/model/response_body_model.dart';
import 'package:http/http.dart' as http;

abstract class GithubRepository {
  Future<List<Item>> searchRepos(
      String query, token, int page, int per_page, String sort, String order);
}

class GithubRepositoryImpl extends GithubRepository {
  @override
  Future<List<Item>> searchRepos(String query, token, int page, int per_page,
      String sort, String order) async {
    token = 'token';
    var response = await http.get(
        Uri.parse(RemoteUrls.searchList(query, page, per_page, sort, order)),
        headers: {
          "Accept": "application/vnd.github+json",
          "Authorization": "Berear $token",
        });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      print(response);
      var data = json.decode(response.body);

      List<Item>? items = ResponseBodyModel.fromJson(data).items!;
      return items;
    } else {
      print(Exception());
      throw Exception('Failed');
    }
  }
}

