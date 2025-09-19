// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, overridden_fields

part of 'checkbox_bloc.dart';

sealed class CheckboxEvent extends Equatable {
  var index;

   CheckboxEvent();

  @override
  List<Object> get props => [];
}

class SelectCheckBox extends CheckboxEvent {
  @override
  final int index;
  SelectCheckBox(this.index);

  @override
  List<Object> get props => [index];
}
