
import 'package:get_it/get_it.dart';
import 'package:sample_base_framework/src/model/sample_model.dart';
import 'package:sample_base_framework/src/provider/sample_provider.dart';


class SampleRepository {
  late SampleProvider _sampleProvider;
  SampleRepository() {
    _sampleProvider = GetIt.I.get<SampleProvider>();
  }

 Future<TouristModel> addTouristPlace(Map map) async {
    return _sampleProvider.addTouristPlace(map);

  }
  Future<SampleModelResponse>  getTouriestList() async {
    return _sampleProvider.getTouristList();

  }

}