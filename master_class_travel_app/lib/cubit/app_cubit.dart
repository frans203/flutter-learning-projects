import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_travel_app/cubit/app_state.dart';
import 'package:master_class_travel_app/model/data_model.dart';
import 'package:master_class_travel_app/services/data_services.dart';

class AppCubit extends Cubit<AppState> {
  final DataServices data;
  AppCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  late final places;
  void getData() async {
    emit(LoadingState());
    try {
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  void getSingleDataDetailPage(DataModel place) async {
    emit(DetailState(place));
  }

  void goHomePage() {
    emit(LoadedState(places));
  }
}
