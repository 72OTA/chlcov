// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mundo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MundoModel _$MundoModelFromJson(Map<dynamic, dynamic> json) {
  return MundoModel(
    day: json['day'] as String,
    confirmed: json['confirmed'] as String,
    confirmedPer100K: json['confirmedPer100K'] as double,
    deaths: json['deaths'] as String,
    deathsPer100K: json['deathsPer100K'] as double,
  );
}

Map<String, dynamic> _$MundoModelToJson(MundoModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'confirmed': instance.confirmed,
      'confirmedPer100K': instance.confirmedPer100K,
      'deaths': instance.deaths,
      'deathsPer100K': instance.deathsPer100K,
    };
