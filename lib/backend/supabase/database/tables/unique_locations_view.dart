import '../database.dart';

class UniqueLocationsViewTable extends SupabaseTable<UniqueLocationsViewRow> {
  @override
  String get tableName => 'unique_locations_view';

  @override
  UniqueLocationsViewRow createRow(Map<String, dynamic> data) =>
      UniqueLocationsViewRow(data);
}

class UniqueLocationsViewRow extends SupabaseDataRow {
  UniqueLocationsViewRow(super.data);

  @override
  SupabaseTable get table => UniqueLocationsViewTable();

  String? get uniqueLocation => getField<String>('unique_location');
  set uniqueLocation(String? value) =>
      setField<String>('unique_location', value);
}
