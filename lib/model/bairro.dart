import 'package:json_annotation/json_annotation.dart';

part 'bairro.g.dart';

@JsonSerializable()
class Bairro {
  final String id;
  final String nome;

  Bairro({
    required this.id,
    required this.nome,
  });

  factory Bairro.fromJson(Map<String, dynamic> json) => _$BairroFromJson(json);
}
