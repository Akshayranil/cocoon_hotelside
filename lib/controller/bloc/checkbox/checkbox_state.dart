part of 'checkbox_bloc.dart';

sealed class CheckboxState extends Equatable {
  const CheckboxState();

  @override
  List<Object> get props => [];
}

final class CheckboxInitial extends CheckboxState {
  final List<bool> ischecked = List.filled(6, false);
  CheckboxInitial();
  @override
  List<Object> get props => [ischecked];
}

final class Ischecked extends CheckboxState {
  final List<bool> ischecked;

  const Ischecked(this.ischecked);

  @override
  List<Object> get props => [ischecked];
}
