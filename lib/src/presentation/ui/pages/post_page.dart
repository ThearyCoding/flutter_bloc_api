import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/post_bloc.dart';
import '../../blocs/post_event.dart';
import '../../blocs/post_state.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        state.posts[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      subtitle: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        state.posts[index].body,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                });
          } else if (state is PostError) {
            return Center(
              child: Text("error : ${state.error}"),
            );
          } else {
            return const Center(
              child: Text("No Posts loaded"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PostBloc>().add(FetchPostEvent());
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
