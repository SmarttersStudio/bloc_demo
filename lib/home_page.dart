import 'package:blocdemo/bloc_models/my_posts/post_bloc.dart';
import 'package:blocdemo/bloc_models/my_posts/post_event.dart';
import 'package:blocdemo/bloc_models/my_posts/post_state.dart';
///
/// Created By Guru (guru@smarttersstudio.com) on 11/07/20 8:16 PM
///
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    BaseBloc().add(LoadEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: BlocBuilder<BaseBloc,BaseState>(
        builder: (BuildContext context, BaseState state) {
          
          if(state is UnLoadedState){
            return Container();
          }
          if(state is LoadingState)
            return Center(child: CircularProgressIndicator(),);
          
          if(state is ErrorState)
            return Center(child: Text(state.error.toString()),);
          
          LoadedState loadedState = state as LoadedState;
          
          return ListView.separated(
            itemBuilder: (context,position)=>ListTile(
              leading: CircleAvatar(),
              title: Text(loadedState.posts[position].name),
              subtitle: Text(loadedState.posts[position].title),
            ), separatorBuilder: (context,position)=> Divider(),
            itemCount: loadedState.posts.length
          );
        },
      ),
    );
  }
}
