part of "store_page_info_cubit.dart";

class StorePageInfoState extends Equatable {
  int? index;
  final String? name;

  StorePageInfoState({this.index = -1, this.name = ""});

  @override
  List<Object?> get props => [index, name];

  StorePageInfoState copyWith(int? index, String? name) {
    return StorePageInfoState(
        index: index ?? this.index, name: name ?? this.name);
  }
}
