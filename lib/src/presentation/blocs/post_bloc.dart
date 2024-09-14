import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_posts.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent,PostState> {

  final GetPosts getPosts;

  PostBloc(this.getPosts) : super(PostInitial()){
    on<FetchPostEvent>((event,emit)async{
      emit(PostLoading());
      try{
        final posts = await getPosts.execute();
        emit(PostLoaded(posts));
      }catch(e){
        emit(PostError(e.toString()));
      }
    });
  }

}