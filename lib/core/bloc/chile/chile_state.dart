import 'package:chlcov/core/model/chile/chile_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ChileState {}

class InitialChileState extends ChileState {}

class LoadingChileState extends ChileState {}

class FailureChileState extends ChileState {
  final String errorMessage;

  FailureChileState(this.errorMessage);
}

class LoadedChileState extends ChileState {
  final ChileModel chileModel;
  
  LoadedChileState(this.chileModel);
 
  // final List<MundoModel> listMundoModel;
  // LoadedMundoState(this.listMundoModel);
}

