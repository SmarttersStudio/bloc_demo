import 'package:blocdemo/data_models/post_model.dart';

///
/// Created By Guru (guru@smarttersstudio.com) on 11/07/20 8:21 PM
///
abstract class BaseState {

}

class UnLoadedState extends BaseState{

}

class LoadedState extends BaseState{
  List<Post> posts ;

  LoadedState(this.posts);
  
}

class LoadingState extends BaseState{

}

class ErrorState extends BaseState{
  Error error;

  ErrorState(this.error);
}




