import '../../domain/repositories/post_repository.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';


class PostRepositoryImpl implements PostRepository{

  final ApiService apiService;

  PostRepositoryImpl(this.apiService);

  @override
  Future<List<PostModel>> getPosts() async{
    final postList = await apiService.fetchPosts();
    return postList.map((post) => PostModel.fromJson(post)).toList();
  }
}


