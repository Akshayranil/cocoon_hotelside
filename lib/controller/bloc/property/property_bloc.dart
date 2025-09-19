import 'package:cocoon_hotelside/controller/bloc/property/property_event.dart';
import 'package:cocoon_hotelside/controller/bloc/property/property_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyState()) {
    on<PropertyOwnershipChanged>((event, emit) {
      emit(state.copyWith(ownership: event.ownership));
    });

    on<PropertyRegistrationChanged>((event, emit) {
      emit(state.copyWith(registration: event.registration));
    });

    on<RegistrationFilePicked>((event, emit) {
      emit(state.copyWith(filePath: event.filePath));
    });
  }
}
