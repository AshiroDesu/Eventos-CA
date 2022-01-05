import 'package:eventos_ca/modules/evento_module/external/datasources/database/utils/create_table.dart';
import 'package:eventos_ca/modules/evento_module/infra/datasources/evento_datasource.dart';
import 'package:eventos_ca/modules/evento_module/infra/models/evento_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseDatasource implements EventoDatasource {
  @override
  Future<List<EventoModel>> getSearch(String? searchText) async {
    final db = await getDatabase();

    final List<Map<String, dynamic>> maps = await db.query('eventos');

    return List.generate(maps.length, (i) {
      return EventoModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        amount: maps[i]['amount'],
      );
    });
  }

  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'eventos.db');

    return openDatabase(path, onCreate: (db, version) {
      db.execute(createTable);
    }, version: 1);
  }

  Future<void> updateEvento(EventoModel evento) async {
    final db = await getDatabase();

    await db.update(
      'eventos',
      evento.toMap(),
      where: 'id = ?',
      whereArgs: [evento.id],
    );
  }

  @override
  Future<void> deleteSucess(String id) async {
    final db = await getDatabase();

    await db.delete(
      'evento',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> createSucess(EventoModel model) async {
    final db = await getDatabase();

    await db.insert(
      'eventos',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteAllEvento(String id) async {
    final db = await getDatabase();

    await db.delete('evento');
  }
}
