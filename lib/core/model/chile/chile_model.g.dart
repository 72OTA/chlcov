// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChileModel _$ChileModelFromJson(Map<dynamic, dynamic> json) {
  return ChileModel(
    confirmed: json['confirmed'] as String,
    confirmedPer100K: json['confirmed_per_100k'] as double,
    day: json['day'] as String,
    deaths: json['deaths'] as String,
    deathsPer100K: json['deaths_per_100k'] as double,
  );
}

Map<String, dynamic> _$ChileModelToJson(ChileModel instance) =>
    <String, dynamic>{
      'confirmed': instance.confirmed,
      'confirmed_per_100k': instance.confirmedPer100K,
      'day': instance.day,
      'deaths': instance.deaths,
      'deaths_per_100K': instance.deathsPer100K,
    };
