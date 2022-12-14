import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';

abstract class LocaleRepository {
  Future<Either<Failure,bool>> saveLocale({required String codeLang});
  Future<Either<Failure,String>> getSaveLocale();
}