import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:chlcov/core/model/chile/chile_model.dart';
import 'package:chlcov/core/model/provinsi_model.dart';

/// Ini Adalah Class Repo
/// getDataIndonesia() ,
/// getProvinsi()
/// @return Map

class RepoApi {
  // API 1
  static String mainUrl = "https://chile-coronapi.herokuapp.com";
  var chile = '$mainUrl/api/v3/latest/nation';


  Dio _dio = Dio();


  Future<Either<String, ProvinsiModel>> getProvinsi() async {
    try {
      Response response = await _dio.get(chile);
      return Right(ProvinsiModel.fromJson(response.data));
    } on DioError catch (error) {
      return Left(error.message);
    }
  }

  Future<Either<String, ChileModel>> getDataChile() async {
    try {
      Response response = await _dio.get(chile);
      return Right(ChileModel.fromJson(response.data));
    } on DioError catch (error) {
      return Left(error.message);
    }
  }

  /// @return map
  /// get Data Chile
  Future<Either<String, ChileModel>> getChile() async {
    try {
      Response response = await _dio.get(chile);
      return Right(ChileModel.fromJson(response.data));
    } on DioError catch (error) {
      return Left(error.message);
    }
  }


  // Get Data Sembuh Chile
  Future<Either<String, ChileModel>> getDataRecuperadosChile() async {
    try {
      Response response = await _dio.get(chile);
      return Right(ChileModel.fromJson(response.data));
    } on DioError catch (error) {
      return Left(error.message);
    }
  }

  // Get data Positf Chile
  Future<Either<String, ChileModel>> getDatacasosPositivos() async {
    try {
      Response response = await _dio.get(chile);
      return Right(ChileModel.fromJson(response.data));
    } on DioError catch (error) {
      return Left(error.message);
    }
  }

  Future<Either<String, ChileModel>> getDatacasosMuertos() async {
    try {
      Response response = await _dio.get(chile);
      return Right(ChileModel.fromJson(response.data));
    } on DioError catch (error) {
      return Left(error.message);
    }
  }

}
