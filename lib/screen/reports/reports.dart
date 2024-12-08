import 'package:flutter/material.dart';
import 'package:latres_prakmobile_124220140/model/articles.dart';
import 'package:latres_prakmobile_124220140/screen/blogs/blogs_detail.dart';
import 'package:latres_prakmobile_124220140/screen/reports/reports_detail.dart';
import 'package:latres_prakmobile_124220140/service/api_services.dart';

class ReportListScreen extends StatefulWidget {
  const ReportListScreen({super.key});

  @override
  State<ReportListScreen> createState() => _ReportListScreenState();
}

class _ReportListScreenState extends State<ReportListScreen> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Report List'),
      ),
      body: FutureBuilder<List<Articles>>(
        future: apiService.fetchReports(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ReportDetailScreen(id: article.id)));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image(
                                image: NetworkImage(article.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              article.title,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              article.newsSite,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(article.publishedAt),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Data Found!'),
            );
          }
        },
      ),
    );
  }
}
