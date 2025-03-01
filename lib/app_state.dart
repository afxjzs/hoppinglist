import 'package:flutter/material.dart';
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
      _groupid = prefs.getString('ff_groupid') ?? _groupid;
    });
    _safeInit(() {
      _groupcode = prefs.getString('ff_groupcode') ?? _groupcode;
    });
    _safeInit(() {
      _groupname = prefs.getString('ff_groupname') ?? _groupname;
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

  /// list of locations used for selection
  List<String> _locations = ['Safeway', 'Trader Joe\'s', 'CVS', 'Target'];
  List<String> get locations => _locations;
  set locations(List<String> value) {
    _locations = value;
  }

  void addToLocations(String value) {
    locations.add(value);
  }

  void removeFromLocations(String value) {
    locations.remove(value);
  }

  void removeAtIndexFromLocations(int index) {
    locations.removeAt(index);
  }

  void updateLocationsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    locations[index] = updateFn(_locations[index]);
  }

  void insertAtIndexInLocations(int index, String value) {
    locations.insert(index, value);
  }

  /// id of the group the user belongs to
  String _groupid = '';
  String get groupid => _groupid;
  set groupid(String value) {
    _groupid = value;
    prefs.setString('ff_groupid', value);
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
