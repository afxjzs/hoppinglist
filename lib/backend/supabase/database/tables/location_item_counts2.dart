import '../database.dart';

class LocationItemCounts2Table extends SupabaseTable<LocationItemCounts2Row> {
  @override
  String get tableName => 'location_item_counts2';

  @override
  LocationItemCounts2Row createRow(Map<String, dynamic> data) =>
      LocationItemCounts2Row(data);
}

class LocationItemCounts2Row extends SupabaseDataRow {
  LocationItemCounts2Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationItemCounts2Table();

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

  int? get neededCount => getField<int>('needed_count');
  set neededCount(int? value) => setField<int>('needed_count', value);
}
