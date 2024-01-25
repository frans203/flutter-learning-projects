import 'package:equatable/equatable.dart';
import 'package:master_class_travel_app/model/data_model.dart';

abstract class AppState extends Equatable {}

//IN THE PREVIOUS COURSE IT WAS USED ENUM TO SET THE VALUES OF CURRENT STATE
//ALONG WITH FACTORY AND OTHER PROPERTIES

class InitialState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends AppState {
  final List<DataModel> places;
  LoadedState(this.places);
  @override
  List<Object> get props => [places];
}

class DetailState extends AppState {
  final DataModel place;
  DetailState(this.place);
  @override
  List<Object> get props => [place];
}
