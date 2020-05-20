import 'package:json_annotation/json_annotation.dart';

part 'chile_model.g.dart';

@JsonSerializable()
class ChileModel {
    String confirmed;
    double confirmedPer100K;
    String day;
    String deaths;
    double deathsPer100K;

  ChileModel({
        this.confirmed,
        this.confirmedPer100K,
        this.day,
        this.deaths,
        this.deathsPer100K,
  });


  factory ChileModel.fromJson(Map<String, dynamic> json) => _$ChileModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ChileModelToJson(this);

  @override
  String toString() {
    return 'ChileModel{day: $day, confirmed: $confirmed, confirmed_per_100k: $confirmedPer100K, deaths: $deaths, deaths_per_100k: $deathsPer100K';
  }
}
