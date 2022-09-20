import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import '../repositories/locale_repository.dart';

class SaveLocaleUseCase {
  final LocaleRepository localeRepository;

  SaveLocaleUseCase({required this.localeRepository});

  Future<Either<Failure, bool>> call({required String codeLange}) async =>
      await localeRepository.saveLocale(codeLang:codeLange);

}