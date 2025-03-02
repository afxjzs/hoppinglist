import '../database.dart';

class LocationsTable extends SupabaseTable<LocationsRow> {
  @override
  String get tableName => 'locations';

  @override
  LocationsRow createRow(Map<String, dynamic> data) => LocationsRow(data);
}

class LocationsRow extends SupabaseDataRow {
  LocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  int get groupId => getField<int>('group_id')!;
  set groupId(int value) => setField<int>('group_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
