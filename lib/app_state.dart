import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _darkmode = prefs.getBool('ff_darkmode') ?? _darkmode;
    });
    _safeInit(() {
      _groupcode = prefs.getString('ff_groupcode') ?? _groupcode;
    });
    _safeInit(() {
      _groupname = prefs.getString('ff_groupname') ?? _groupname;
    });
    _safeInit(() {
      _groupid = prefs.getInt('ff_groupid') ?? _groupid;
    });
    _safeInit(() {
      _currentLocationName =
          prefs.getString('ff_currentLocationName') ?? _currentLocationName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _darkmode = true;
  bool get darkmode => _darkmode;
  set darkmode(bool value) {
    _darkmode = value;
    prefs.setBool('ff_darkmode', value);
  }

  String _groupcode = '';
  String get groupcode => _groupcode;
  set groupcode(String value) {
    _groupcode = value;
    prefs.setString('ff_groupcode', value);
  }

  String _groupname = '';
  String get groupname => _groupname;
  set groupname(String value) {
    _groupname = value;
    prefs.setString('ff_groupname', value);
  }

  int _groupid = 0;
  int get groupid => _groupid;
  set groupid(int value) {
    _groupid = value;
    prefs.setInt('ff_groupid', value);
  }

  String _currentLocationName = '';
  String get currentLocationName => _currentLocationName;
  set currentLocationName(String value) {
    _currentLocationName = value;
    prefs.setString('ff_currentLocationName', value);
  }

  List<SingleItemStruct> _NotUsedItemsListDatatype = [];
  List<SingleItemStruct> get NotUsedItemsListDatatype =>
      _NotUsedItemsListDatatype;
  set NotUsedItemsListDatatype(List<SingleItemStruct> value) {
    _NotUsedItemsListDatatype = value;
  }

  void addToNotUsedItemsListDatatype(SingleItemStruct value) {
    NotUsedItemsListDatatype.add(value);
  }

  void removeFromNotUsedItemsListDatatype(SingleItemStruct value) {
    NotUsedItemsListDatatype.remove(value);
  }

  void removeAtIndexFromNotUsedItemsListDatatype(int index) {
    NotUsedItemsListDatatype.removeAt(index);
  }

  void updateNotUsedItemsListDatatypeAtIndex(
    int index,
    SingleItemStruct Function(SingleItemStruct) updateFn,
  ) {
    NotUsedItemsListDatatype[index] =
        updateFn(_NotUsedItemsListDatatype[index]);
  }

  void insertAtIndexInNotUsedItemsListDatatype(
      int index, SingleItemStruct value) {
    NotUsedItemsListDatatype.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
