import 'package:bloc/bloc.dart';




class SelectionCubit extends Cubit<String?> {
  SelectionCubit() : super(null);

  void select(String option) {
    emit(option);
    
  }
}
