import 'dart:convert';
import 'package:github_search_app/core/remote_urls.dart';
import 'package:github_search_app/modules/search/model/response_body_model.dart';
import 'package:http/http.dart' as http;

abstract class GithubListRepository {
  Future<List<Item>> getGithubLists();
}

class GithubListRepositoryIml extends GithubListRepository {
  @override
  Future<List<Item>> getGithubLists() async {
    final response = await http.get(Uri.parse(RemoteUrls.getList));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(response.statusCode);
      print(response.body);
      print(response);
      List<Item>? items = ResponseBodyModel.fromJson(data).items;
      return items!;
    } else {
      print(Exception());
      throw Exception('Failed');
    }
  }
}
