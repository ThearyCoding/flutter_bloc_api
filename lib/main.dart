import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/src/data/repositories/post_repository.dart';
import 'package:untitled3/src/data/services/api_service.dart';
import 'package:untitled3/src/domain/usecases/get_posts.dart';
import 'package:untitled3/src/presentation/blocs/post_bloc.dart';
import 'package:untitled3/src/presentation/ui/pages/post_page.dart';

void main() {
  final  postRepositoryImpl = PostRepositoryImpl(ApiService());
  runApp(MultiBlocProvider(
    providers: [
    BlocProvider(create: (context) => PostBloc(GetPosts(postRepositoryImpl)))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PostPage()
    );
  }
}
