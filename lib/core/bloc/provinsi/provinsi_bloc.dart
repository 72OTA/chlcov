import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chlcov/core/bloc/chile/bloc.dart';
import 'package:chlcov/core/bloc/provinsi/bloc.dart';
import 'package:chlcov/core/repository/repo_api.dart';

import './bloc.dart';

class ProvinsiBloc extends Bloc<ProvinsiEvent, ProvinsiState> {
  final RepoApi repoApi;
  ProvinsiBloc(this.repoApi);

  @override
  ProvinsiState get initialState => InitialProvinsiState();

  @override
  Stream<ProvinsiState> mapEventToState(ProvinsiEvent event) async* {
    if (event is LoadDataChileEvent) {
      yield* _mapLoadDataProvinsiEventToState();
    }
  }

  Stream<ProvinsiState> _mapLoadDataProvinsiEventToState() async* {
    yield LoadingProvinsiState();
    var response = await repoApi.getProvinsi();
    yield response.fold(
      (errorMessage) => FailureProvinsiState(errorMessage),
      (data) => LoadedProvinsiState(data),
    );
  }
}
