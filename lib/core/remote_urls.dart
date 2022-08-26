

class RemoteUrls {
  static const String baseUrl = "https://api.github.com/";
  static const String getList = "${baseUrl}gists/starred";

  static String searchList(String query, int page, int per_page, String sort, String order) =>
      '${baseUrl}search/repositories?q=$query&page=$page,per_page=$per_page,sort=$sort,order=$order';
}
