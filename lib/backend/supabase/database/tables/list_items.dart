import '../database.dart';

class ListItemsTable extends SupabaseTable<ListItemsRow> {
  @override
  String get tableName => 'list_items';

  @override
  ListItemsRow createRow(Map<String, dynamic> data) => ListItemsRow(data);
}

class ListItemsRow extends SupabaseDataRow {
  ListItemsRow(super.data);

  @override
  SupabaseTable get table => ListItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get itemId => getField<int>('item_id')!;
  set itemId(int value) => setField<int>('item_id', value);

  double get quantity => getField<double>('quantity')!;
  set quantity(double value) => setField<double>('quantity', value);

  bool get acquired => getField<bool>('acquired')!;
  set acquired(bool value) => setField<bool>('acquired', value);

  int? get acquiredBy => getField<int>('acquired_by');
  set acquiredBy(int? value) => setField<int>('acquired_by', value);

  DateTime? get acquiredAt => getField<DateTime>('acquired_at');
  set acquiredAt(DateTime? value) => setField<DateTime>('acquired_at', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get createdBy => getField<int>('created_by')!;
  set createdBy(int value) => setField<int>('created_by', value);
}
