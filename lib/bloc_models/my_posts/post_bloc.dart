import 'package:blocdemo/bloc_models/my_posts/post_event.dart';
import 'package:blocdemo/bloc_models/my_posts/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
/// Created By Guru (guru@smarttersstudio.com) on 11/07/20 8:20 PM
///
class BaseBloc extends Bloc<BaseEvent, BaseState> {
  
  static final BaseBloc _bloc = BaseBloc._internal();
  
  factory BaseBloc() {
    return _bloc;
  }
  BaseBloc._internal() : super(UnLoadedState());
  
  @override
  Future<void> close() async{
    _bloc.close();
    await super.close();
  }
  
  List<String> cities=[];
  @override
  Stream<BaseState> mapEventToState(
    BaseEvent event,
    ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      yield state;
    }
  }
}
