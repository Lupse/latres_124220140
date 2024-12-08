import 'package:flutter/material.dart';
import 'package:latres_prakmobile_124220140/auth/login.dart';
import 'package:latres_prakmobile_124220140/screen/blogs/blogs.dart';
import 'package:latres_prakmobile_124220140/screen/news/news.dart';
import 'package:latres_prakmobile_124220140/screen/reports/reports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;

  @override
  void initState() {
    super.initState();
    loadSession();
  }

  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
  }

  void logout() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Hi, $username'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(
          children: [
            Card(
              child: SizedBox(
                height: 150,
                child: Center(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewsListScreen()));
                    },
                    leading: const Icon(Icons.newspaper),
                    title: const Text('News'),
                    subtitle: const Text(
                        'Get an overview of the latest SpaceFlight news, from various sources!. Easily link your users to the right websites'),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                child: SizedBox(
                  height: 150,
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BlogListScreen()));
                      },
                      leading: const Icon(Icons.public_rounded),
                      title: const Text('Blogs'),
                      subtitle: const Text(
                          'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast'),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                child: SizedBox(
                  height: 150,
                  child: Center(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ReportListScreen()));
                      },
                      leading: const Icon(Icons.new_releases_outlined),
                      title: const Text('Reports'),
                      subtitle: const Text(
                          'Space stations and other missions often publish their data.'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: logout,
                style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
