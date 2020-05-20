import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chlcov/core/repository/repo_api.dart';
import './bloc.dart';

class ChileBloc extends Bloc<ChileEvent, ChileState> {
  final RepoApi repoApi;

  ChileBloc(this.repoApi);

  @override
  ChileState get initialState => InitialChileState();

  @override
  Stream<ChileState> mapEventToState(ChileEvent event) async* {
    if (event is LoadDataChileEvent) {
      yield* _mapLoadDataChileEventToState();
    }
  }

  Stream<ChileState> _mapLoadDataChileEventToState() async* {
    yield LoadingChileState();
    var response = await repoApi.getDataChile();
    yield response.fold(
      (errorMessage) => FailureChileState(errorMessage),
      (data) => LoadedChileState(data),
    );
  }
}
