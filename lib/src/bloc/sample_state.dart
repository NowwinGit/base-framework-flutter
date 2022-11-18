import 'package:equatable/equatable.dart';
import 'package:sample_base_framework/src/model/sample_model.dart';

abstract class SampleState extends Equatable {
  const SampleState();

  @override
  List<Object> get props => [];
}

class SampleTouristInitial extends SampleState {}

class SampleTouristLoading extends SampleState {}

class SampleTouristSuccess extends SampleState {
  final SampleModelResponse response;

  const SampleTouristSuccess(this.response);
}

class CreateTouristSuccess extends SampleState {
  final TouristModel response;

  const CreateTouristSuccess(this.response);
}
class CreateTouristError extends SampleState {
  final String error;

  const CreateTouristError(this.error);
}