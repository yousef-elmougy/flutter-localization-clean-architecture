
import 'package:dartz/dartz.dart';

import '../../../error/exceptions.dart';
import '../../../error/failures.dart';
import '../../domain/repositories/locale_repository.dart';
import '../data_sources/locale_data_source.dart';

class LocaleRepositoryImpl implements LocaleRepository{
  final LocaleDataSource localeDataSource;

  LocaleRepositoryImpl({required this.localeDataSource});

  @override
  Future<Either<Failure, String>> getSaveLocale() async {
    try{
      final getSavedLocal =await localeDataSource.getSaveLocale();
      return Right(getSavedLocal);
    } on CacheException{
      return  Left(CacheFailure());
    }


  }

  @override
  Future<Either<Failure, bool>> saveLocale({required String codeLang}) async {
 try{
   final saveLocal =await localeDataSource.saveLocale(codeLang: codeLang);
 return Right(saveLocal);
 } on CacheException{
   return  Left(CacheFailure());
 }

  }
}