part of 'aminities_bloc.dart';

sealed class AminitiesState {}

 class AminitiesInitial extends AminitiesState {}

 class LoadingAminityState extends AminitiesState{}

 class LoadedAminityState extends AminitiesState {
 final List<String> aminities;

  LoadedAminityState(this.aminities);

}

class ErrorAminityState extends AminitiesState{
  final String message;

  ErrorAminityState(this.message);

}
