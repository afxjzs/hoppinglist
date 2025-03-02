import '../database.dart';

class LocationItemCountsTable extends SupabaseTable<LocationItemCountsRow> {
  @override
  String get tableName => 'location_item_counts';

  @override
  LocationItemCountsRow createRow(Map<String, dynamic> data) =>
      LocationItemCountsRow(data);
}

class LocationItemCountsRow extends SupabaseDataRow {
  LocationItemCountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationItemCountsTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  int? get groupId => getField<int>('group_id');
  set groupId(int? value) => setField<int>('group_id', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);
}
