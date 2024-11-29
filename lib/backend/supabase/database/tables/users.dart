import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get groupId => getField<int>('group_id')!;
  set groupId(int value) => setField<int>('group_id', value);

  DateTime? get latestUse => getField<DateTime>('latest_use');
  set latestUse(DateTime? value) => setField<DateTime>('latest_use', value);

  bool? get admin => getField<bool>('admin');
  set admin(bool? value) => setField<bool>('admin', value);
}
