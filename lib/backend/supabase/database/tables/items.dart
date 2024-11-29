import '../database.dart';

class ItemsTable extends SupabaseTable<ItemsRow> {
  @override
  String get tableName => 'items';

  @override
  ItemsRow createRow(Map<String, dynamic> data) => ItemsRow(data);
}

class ItemsRow extends SupabaseDataRow {
  ItemsRow(super.data);

  @override
  SupabaseTable get table => ItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  List<String> get locations => getListField<String>('locations');
  set locations(List<String>? value) =>
      setListField<String>('locations', value);

  bool get needed => getField<bool>('needed')!;
  set needed(bool value) => setField<bool>('needed', value);

  DateTime? get lastNeededAt => getField<DateTime>('last_needed_at');
  set lastNeededAt(DateTime? value) =>
      setField<DateTime>('last_needed_at', value);
}
