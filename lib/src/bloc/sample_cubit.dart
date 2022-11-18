import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_base_framework/src/bloc/sample_state.dart';
import 'package:sample_base_framework/src/model/sample_model.dart';
import 'package:sample_base_framework/src/repository/sample_repository.dart';

class SampleCubit extends Cubit<SampleState> {
  late SampleRepository _repository;

  SampleCubit() : super(SampleTouristInitial()) {
    _repository = GetIt.I.get<SampleRepository>();
  }

  getTourist() async {
    try {
      emit(SampleTouristLoading());
      SampleModelResponse response = await _repository.getTouriestList();
      emit(SampleTouristSuccess(response));
    } catch (e, s) {
      SampleModelResponse response = SampleModelResponse();
      response.hasError = true;
      response.errorMessage = "Something went wrong, Please try again";
      emit(SampleTouristSuccess(response));
    }
  }

  postTourist(Map map) async {
    try {
      emit(SampleTouristLoading());
      TouristModel response = await _repository.addTouristPlace(map);
      emit(CreateTouristSuccess(response));
    } catch (e, s) {
      emit(const CreateTouristError("Something went wrong, Please try again"));
    }
  }
}