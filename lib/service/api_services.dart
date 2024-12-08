import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latres_prakmobile_124220140/model/articles.dart';

const String articleUrl = 'https://api.spaceflightnewsapi.net/v4/articles/';
const String blogUrl = 'https://api.spaceflightnewsapi.net/v4/blogs/';
const String reportUrl = 'https://api.spaceflightnewsapi.net/v4/reports/';

class ApiService {
  // Article
  Future<List<Articles>> fetchArticles() async {
    final url = Uri.parse(articleUrl);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final List<dynamic> results = data['results'];

        return results.map((e) => Articles.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }

  Future<Articles> fetchArticleDetail(String id) async {
    final url = Uri.parse(articleUrl + id);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Articles.fromJson(data);
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }

  // Blogs
  Future<List<Articles>> fetchBlogs() async {
    final url = Uri.parse(blogUrl);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final List<dynamic> results = data['results'];

        return results.map((e) => Articles.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }

  Future<Articles> fetchBlogsDetail(String id) async {
    final url = Uri.parse(blogUrl + id);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Articles.fromJson(data);
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }

  // Reports
  Future<List<Articles>> fetchReports() async {
    final url = Uri.parse(reportUrl);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        final List<dynamic> results = data['results'];

        return results.map((e) => Articles.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }

  Future<Articles> fetchReportsDetail(String id) async {
    final url = Uri.parse(reportUrl + id);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Articles.fromJson(data);
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Failed to fetch articles: $e');
    }
  }
}
