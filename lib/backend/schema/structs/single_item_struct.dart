// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SingleItemStruct extends BaseStruct {
  SingleItemStruct({
    String? id,
    String? name,
    String? notes,
    int? groupId,
    bool? needed,
    List<String>? locations,
    DateTime? createdAt,
  })  : _id = id,
        _name = name,
        _notes = notes,
        _groupId = groupId,
        _needed = needed,
        _locations = locations,
        _createdAt = createdAt;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "group_id" field.
  int? _groupId;
  int get groupId => _groupId ?? 0;
  set groupId(int? val) => _groupId = val;

  void incrementGroupId(int amount) => groupId = groupId + amount;

  bool hasGroupId() => _groupId != null;

  // "needed" field.
  bool? _needed;
  bool get needed => _needed ?? false;
  set needed(bool? val) => _needed = val;

  bool hasNeeded() => _needed != null;

  // "locations" field.
  List<String>? _locations;
  List<String> get locations => _locations ?? const [];
  set locations(List<String>? val) => _locations = val;

  void updateLocations(Function(List<String>) updateFn) {
    updateFn(_locations ??= []);
  }

  bool hasLocations() => _locations != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static SingleItemStruct fromMap(Map<String, dynamic> data) =>
      SingleItemStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        notes: data['notes'] as String?,
        groupId: castToType<int>(data['group_id']),
        needed: data['needed'] as bool?,
        locations: getDataList(data['locations']),
        createdAt: data['created_at'] as DateTime?,
      );

  static SingleItemStruct? maybeFromMap(dynamic data) => data is Map
      ? SingleItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'notes': _notes,
        'group_id': _groupId,
        'needed': _needed,
        'locations': _locations,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'group_id': serializeParam(
          _groupId,
          ParamType.int,
        ),
        'needed': serializeParam(
          _needed,
          ParamType.bool,
        ),
        'locations': serializeParam(
          _locations,
          ParamType.String,
          isList: true,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SingleItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      SingleItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        groupId: deserializeParam(
          data['group_id'],
          ParamType.int,
          false,
        ),
        needed: deserializeParam(
          data['needed'],
          ParamType.bool,
          false,
        ),
        locations: deserializeParam<String>(
          data['locations'],
          ParamType.String,
          true,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SingleItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SingleItemStruct &&
        id == other.id &&
        name == other.name &&
        notes == other.notes &&
        groupId == other.groupId &&
        needed == other.needed &&
        listEquality.equals(locations, other.locations) &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, notes, groupId, needed, locations, createdAt]);
}

SingleItemStruct createSingleItemStruct({
  String? id,
  String? name,
  String? notes,
  int? groupId,
  bool? needed,
  DateTime? createdAt,
}) =>
    SingleItemStruct(
      id: id,
      name: name,
      notes: notes,
      groupId: groupId,
      needed: needed,
      createdAt: createdAt,
    );
