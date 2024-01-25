import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String code;
  final String message;
  final String plugin;

  CustomError(
      {required this.code, required this.message, required this.plugin});
  factory CustomError.initial() {
    return CustomError(code: "", message: "", plugin: "");
  }
  @override
  String toString() {
    return 'CustomError{code: $code, message: $message, plugin: $plugin}';
  }

  @override
  List<Object> get props => [code, message, plugin];
}
