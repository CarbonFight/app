import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETOPTIONS
Future<List<GetOptionsRow>> performGetOptions(
  Database database,
) {
  const query = '''
SELECT option FROM calculation WHERE action="Entrée"
''';
  return _readQuery(database, query, (d) => GetOptionsRow(d));
}

class GetOptionsRow extends SqliteRow {
  GetOptionsRow(super.data);
}

/// END GETOPTIONS
