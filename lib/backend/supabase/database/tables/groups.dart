import '../database.dart';

class GroupsTable extends SupabaseTable<GroupsRow> {
  @override
  String get tableName => 'groups';

  @override
  GroupsRow createRow(Map<String, dynamic> data) => GroupsRow(data);
}

class GroupsRow extends SupabaseDataRow {
  GroupsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GroupsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get insertedAt => getField<DateTime>('inserted_at')!;
  set insertedAt(DateTime value) => setField<DateTime>('inserted_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String get pin => getField<String>('pin')!;
  set pin(String value) => setField<String>('pin', value);
}
