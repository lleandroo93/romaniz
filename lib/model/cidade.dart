import 'package:json_annotation/json_annotation.dart';

part 'cidade.g.dart';

@JsonSerializable()
class Cidade {
  final String id;
  final String nome;

  Cidade({
    required this.id,
    required this.nome,
  });

  factory Cidade.fromJson(Map<String, dynamic> json) => _$CidadeFromJson(json);
}
