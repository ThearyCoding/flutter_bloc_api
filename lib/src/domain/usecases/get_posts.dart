import '../../data/models/post_model.dart';
import '../repositories/post_repository.dart';

class GetPosts{
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<PostModel>> execute()async{
    return repository.getPosts();
  }
}