import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkbox_event.dart';
part 'checkbox_state.dart';

class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  CheckboxBloc() : super(CheckboxInitial()) {
    on<CheckboxEvent>((event, emit) {
      final List<bool> updatedlist = List.of(
        state is CheckboxInitial
            ? (state as CheckboxInitial).ischecked
            : (state as Ischecked).ischecked,
      );

      updatedlist[event.index] = !updatedlist[event.index];
      emit(Ischecked(updatedlist));
    });
  }
}
