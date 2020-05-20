import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chlcov/core/model/mundo/mundo_model.dart';
import 'package:chlcov/core/repository/repo_api.dart';
import './bloc.dart';

class MundoBloc extends Bloc<MundoEvent, MundoState> {
  final RepoApi repoApi;

  MundoBloc(this.repoApi);

  @override
  MundoState get initialState => InitialMundoState();

  @override
  Stream<MundoState> mapEventToState(
    MundoEvent event,
  ) async* {
    if (event is LoadMundoEvent) {
      yield* _mapLoadMundoEventToState();
    }
  }

  Stream<MundoState> _mapLoadMundoEventToState() async* {
    yield LoadingMundoState();
    String valuePositivosMundo;
    String valueRecuperadosMundo;
    String valueMuertosMundo;

    var responseRecuperadosMundo = await repoApi.getDataRecuperadosChile();
    var recuperadosMundo = responseRecuperadosMundo.fold(
      (error) => error,
      (data) => data,
    );
    if (recuperadosMundo is String) {
      yield FailureMundoState(recuperadosMundo);
      return;
    } else if (recuperadosMundo is MundoModel) {
      valueRecuperadosMundo = recuperadosMundo.day;
    }
    var responsePositivosMundo = await repoApi.getDatacasosPositivos();
    var positivosMundo = responsePositivosMundo.fold(
      (error) => error,
      (data) => data,
    );
    if (positivosMundo is String) {
      yield FailureMundoState(positivosMundo);
      return;
    } else if (positivosMundo is MundoModel) {
      valuePositivosMundo = positivosMundo.confirmed;
    }
    var responseMuertosMundo = await repoApi.getDatacasosMuertos();
    var muertosMundo = responseMuertosMundo.fold(
      (error) => error,
      (data) => data,
    );
    if (muertosMundo is String) {
      yield FailureMundoState(muertosMundo);
      return;
    } else if (muertosMundo is MundoModel) {
      valueMuertosMundo = muertosMundo.deaths;
    }
    List<MundoModel> listMundoModel = [
      MundoModel(confirmed: valuePositivosMundo, day: valueRecuperadosMundo, deaths: valueMuertosMundo),
    ];
    yield LoadedMundoState(listMundoModel);
  }
}
