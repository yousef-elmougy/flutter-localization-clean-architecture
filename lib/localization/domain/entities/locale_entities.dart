import 'package:equatable/equatable.dart';

 class Language extends Equatable {
  final int id;
  final String flag, name, languageCode;

  const Language(this.id, this.flag, this.name, this.languageCode);

  @override
  List<Object?> get props => [id, flag, name, languageCode];
}
