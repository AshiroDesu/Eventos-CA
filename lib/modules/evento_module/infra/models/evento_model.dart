import 'dart:convert';

import 'package:eventos_ca/modules/evento_module/domain/entities/evento_base.dart';

class EventoModel extends Evento {
  String id;
  String name;
  int amount;

  EventoModel({
    required this.id,
    required this.name,
    required this.amount,
  }) : super('', '', 0);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
    };
  }

  factory EventoModel.fromMap(Map<String, dynamic> map) {
    return EventoModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventoModel.fromJson(String source) =>
      EventoModel.fromMap(json.decode(source));
}
