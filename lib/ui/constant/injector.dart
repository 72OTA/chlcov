import 'package:get_it/get_it.dart';
import 'package:chlcov/core/bloc/mundo/bloc.dart';
import 'package:chlcov/core/bloc/chile/bloc.dart';
import 'package:chlcov/core/bloc/provinsi/bloc.dart';
import 'package:chlcov/core/repository/repo_api.dart';

final sl = GetIt.instance;

void init() {
  // Repository
  sl.registerLazySingleton<RepoApi>(() => RepoApi());

  // BLoC
  sl.registerFactory(() => ChileBloc(sl()));
  sl.registerFactory(() => ProvinsiBloc(sl()));
  sl.registerFactory(() => MundoBloc(sl()));

}