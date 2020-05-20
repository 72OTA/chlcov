import 'package:json_annotation/json_annotation.dart';

part 'mundo_model.g.dart';

@JsonSerializable()
class MundoModel {
    String confirmed;
    double confirmedPer100K;
    String day;
    String deaths;
    double deathsPer100K;

  MundoModel({
        this.confirmed,
        this.confirmedPer100K,
        this.day,
        this.deaths,
        this.deathsPer100K,
  });


  factory MundoModel.fromJson(Map<String, dynamic> json) => _$MundoModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$MundoModelToJson(this);

  @override
  String toString() {
    return 'MundoModel{day: $day, confirmed: $confirmed, confirmedPer100K: $confirmedPer100K, deaths: $deaths, deathsPer100K: $deathsPer100K}';
  }
}
