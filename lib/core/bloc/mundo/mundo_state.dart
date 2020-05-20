import 'package:chlcov/core/model/mundo/mundo_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MundoState {}

class InitialMundoState extends MundoState {}

class LoadingMundoState extends MundoState {}

class FailureMundoState extends MundoState {
  final String errorMessage;

  FailureMundoState(this.errorMessage);

}

class LoadedMundoState extends MundoState {
  final List<MundoModel> listMundoModel;

  LoadedMundoState(this.listMundoModel);
}
