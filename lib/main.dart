import 'package:flutter/material.dart';
import 'models/datos_ejemplo.dart';
import 'models/post.dart';
import 'models/story.dart';
import 'widget/visor_historias.dart';
import 'widget/lista_historias.dart';
import 'widget/post_card.dart';

void main() {
  runApp(const MyApp(title: 'prueba de aplicacion'));
}

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
      home: const MyHomePage(title: 'Instagram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Story> _stories = crearHistorias();
  final List<Post> _posts = crearPosts();

  Future<void> _openStory(int index) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => StoryViewerPage(
          stories: _stories,
          initialIndex: index,
        ),
      ),
    );

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _posts.length + 1,
                      itemBuilder: (context, i) {
                        if (i == 0) {
                          return ListaHistorias(
                            stories: _stories,
                            onTap: _openStory,
                          );
                        }
                        return PostCard(post: _posts[i - 1]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}