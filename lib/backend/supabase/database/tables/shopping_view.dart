import '../database.dart';

class ShoppingViewTable extends SupabaseTable<ShoppingViewRow> {
  @override
  String get tableName => 'shopping_view';

  @override
  ShoppingViewRow createRow(Map<String, dynamic> data) => ShoppingViewRow(data);
}

class ShoppingViewRow extends SupabaseDataRow {
  ShoppingViewRow(super.data);

  @override
  SupabaseTable get table => ShoppingViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  bool? get acquired => getField<bool>('acquired');
  set acquired(bool? value) => setField<bool>('acquired', value);

  DateTime? get acquiredAt => getField<DateTime>('acquired_at');
  set acquiredAt(DateTime? value) => setField<DateTime>('acquired_at', value);

  int? get acquiredBy => getField<int>('acquired_by');
  set acquiredBy(int? value) => setField<int>('acquired_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  List<String> get locations => getListField<String>('locations');
  set locations(List<String>? value) =>
      setListField<String>('locations', value);
}
