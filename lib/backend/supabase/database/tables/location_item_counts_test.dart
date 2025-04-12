import '../database.dart';

class LocationItemCountsTestTable
    extends SupabaseTable<LocationItemCountsTestRow> {
  @override
  String get tableName => 'location_item_counts_test';

  @override
  LocationItemCountsTestRow createRow(Map<String, dynamic> data) =>
      LocationItemCountsTestRow(data);
}

class LocationItemCountsTestRow extends SupabaseDataRow {
  LocationItemCountsTestRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationItemCountsTestTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get groupId => getField<int>('group_id');
  set groupId(int? value) => setField<int>('group_id', value);

  int? get itemCount => getField<int>('item_count');
  set itemCount(int? value) => setField<int>('item_count', value);

  int? get neededCount => getField<int>('needed_count');
  set neededCount(int? value) => setField<int>('needed_count', value);
}
