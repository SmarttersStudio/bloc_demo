import 'package:blocdemo/bloc_models/my_posts/post_bloc.dart';
import 'package:blocdemo/bloc_models/my_posts/post_state.dart';
import 'package:blocdemo/data_models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///
/// Created By Guru (guru@smarttersstudio.com) on 11/07/20 8:20 PM
///

@immutable
abstract class BaseEvent {
  
  Stream<BaseState> applyAsync({BaseState currentState, BaseBloc bloc});
  
}

class LoadEvent extends BaseEvent{
  @override
  Stream<BaseState> applyAsync({BaseState currentState, BaseBloc bloc}) async*{
  
    yield LoadingState();
    
    try {
      var data = await http.get(
        'https://flutter.smarttersstudio.com/test/getAllPosts.php?id=116');
      
      yield LoadedState(postFromJson(data.body));
      
    }catch(error){
      yield ErrorState(error);
    }
    
    
  }
  
}


