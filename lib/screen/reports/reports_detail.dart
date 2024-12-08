import 'package:flutter/material.dart';
import 'package:latres_prakmobile_124220140/model/articles.dart';
import 'package:latres_prakmobile_124220140/service/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportDetailScreen extends StatefulWidget {
  final String id;
  const ReportDetailScreen({super.key, required this.id});

  @override
  State<ReportDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<ReportDetailScreen> {
  ApiService apiService = ApiService();

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void goToUrl(String url) {
    launchURL(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Report Detail'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Articles>(
          future: apiService.fetchReportsDetail(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final articles = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image(
                        image: NetworkImage(articles.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      articles.title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      articles.newsSite,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(articles.publishedAt),
                    Text(
                      articles.summary,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          goToUrl(articles.url);
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.black)),
                        child: const SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Go to the website',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.public,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('No Data Found!'),
              );
            }
          },
        ),
      ),
    );
  }
}
