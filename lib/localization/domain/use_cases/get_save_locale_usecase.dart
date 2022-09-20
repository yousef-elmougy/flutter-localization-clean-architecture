import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import '../repositories/locale_repository.dart';

class GetSavedLocaleUseCase{
  final  LocaleRepository localeRepository;

  GetSavedLocaleUseCase({required this.localeRepository});

  Future<Either<Failure,String>> call()async => await localeRepository.getSaveLocale();

}