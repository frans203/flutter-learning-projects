import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'store_page_info_state.dart';

class StorePageInfoCubits extends Cubit<List<StorePageInfoState>> {
  StorePageInfoCubits() : super([]);

  void addPageInfo(String? name, int? index) {
    StorePageInfoState newInfoState =
        StorePageInfoState(index: index, name: name);
    if (state.where((element) => element.name == name).isNotEmpty) {
      return;
    } else {
      state.add(newInfoState);
      print("New item: $state");
    }
  }

  void changeIndexStorePage(String name, int index) {
    StorePageInfoState findPage =
        state.firstWhere((element) => element.name == name);
    int pageIndex = state.indexOf(findPage);
    if (pageIndex != -1) {
      state[pageIndex].index = index;
    }
    print("Changed index: $state");
  }

  StorePageInfoState getCurrentPageData(String name) {
    StorePageInfoState findPage =
        state.firstWhere((element) => element.name == name);
    return findPage;
  }
}
