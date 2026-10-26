import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _heartController;
  late final Animation<double> _heartScale;

  Post get post => widget.post;

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _heartScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 35),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 15),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 20),
    ]).animate(_heartController);
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      post.liked = !post.liked;
      post.likes += post.liked ? 1 : -1;
    });
  }

  void _doubleTapLike() {
    if (!post.liked) {
      setState(() {
        post.liked = true;
        post.likes += 1;
      });
    }
    _heartController.forward(from: 0);
  }

  void _toggleSave() {
    setState(() => post.saved = !post.saved);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          post.saved ? 'Post guardado' : 'Post quitado de guardados',
        ),
      ),
    );
  }

  void _share() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Enlace copiado para compartir'),
      ),
    );
  }

  void _openComments() {
    final controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SizedBox(
                height: 420,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    const Text(
                      'Comentarios',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Expanded(
                      child: post.comments.isEmpty
                          ? const Center(
                              child: Text('Se el primero en comentar'),
                            )
                          : ListView.builder(
                              itemCount: post.comments.length,
                              itemBuilder: (_, i) => ListTile(
                                leading: const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.grey,
                                  child: Icon(
                                    Icons.person,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(post.comments[i]),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: const InputDecoration(
                                hintText: 'Agrega un comentario...',
                                border: OutlineInputBorder(),
                                isDense: true,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send, color: Colors.blue),
                            onPressed: () {
                              final text = controller.text.trim();
                              if (text.isEmpty) return;
                              setSheetState(() => post.comments.add(text));
                              setState(() {});
                              controller.clear();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: post.colors.first,
                child: Icon(post.icon, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      post.user,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    if (post.verified) ...[
                      const SizedBox(width: 5),
                      const Icon(Icons.verified, color: Colors.blue, size: 16),
                    ],
                  ],
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),

        GestureDetector(
          onDoubleTap: _doubleTapLike,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  post.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stack) => Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.broken_image,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              ScaleTransition(
                scale: _heartScale,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 110,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: _toggleLike,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, anim) =>
                      ScaleTransition(scale: anim, child: child),
                  child: Icon(
                    post.liked ? Icons.favorite : Icons.favorite_border,
                    key: ValueKey(post.liked),
                    color: post.liked ? Colors.red : Colors.black,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: _openComments,
                child: const Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: _share,
                child: const Icon(
                  Icons.send_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: _toggleSave,
                child: Icon(
                  post.saved ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            '${post.likes} Me gusta',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: '${post.user} ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: post.caption),
            ],
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: _openComments,
          child: Text(
            post.comments.isEmpty
                ? 'Agregar un comentario...'
                : 'Ver los ${post.comments.length} comentarios',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          post.time,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
