import 'package:flutter_bloc/flutter_bloc.dart';

///Suggested use case : Use when a local scope cubit/bloc maybe
///closed before the async operation is completed.
// Needed due to https://github.com/felangel/bloc/issues/3069
mixin CubitMaybeEmit<S> on Cubit<S> {
  @override
  void emit(state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
