import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _actionPlans = (await secureStorage.getStringList('ff_actionPlans'))
              ?.map((x) {
                try {
                  return ActionPlanStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _actionPlans;
    });
    await _safeInitAsync(() async {
      _isDisclaimer001Signed =
          await secureStorage.getBool('ff_isDisclaimer001Signed') ??
              _isDisclaimer001Signed;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<ActionPlanStruct> _actionPlans = [];
  List<ActionPlanStruct> get actionPlans => _actionPlans;
  set actionPlans(List<ActionPlanStruct> value) {
    _actionPlans = value;
    secureStorage.setStringList(
        'ff_actionPlans', value.map((x) => x.serialize()).toList());
  }

  void deleteActionPlans() {
    secureStorage.delete(key: 'ff_actionPlans');
  }

  void addToActionPlans(ActionPlanStruct value) {
    _actionPlans.add(value);
    secureStorage.setStringList(
        'ff_actionPlans', _actionPlans.map((x) => x.serialize()).toList());
  }

  void removeFromActionPlans(ActionPlanStruct value) {
    _actionPlans.remove(value);
    secureStorage.setStringList(
        'ff_actionPlans', _actionPlans.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromActionPlans(int index) {
    _actionPlans.removeAt(index);
    secureStorage.setStringList(
        'ff_actionPlans', _actionPlans.map((x) => x.serialize()).toList());
  }

  void updateActionPlansAtIndex(
    int index,
    ActionPlanStruct Function(ActionPlanStruct) updateFn,
  ) {
    _actionPlans[index] = updateFn(_actionPlans[index]);
    secureStorage.setStringList(
        'ff_actionPlans', _actionPlans.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInActionPlans(int index, ActionPlanStruct value) {
    _actionPlans.insert(index, value);
    secureStorage.setStringList(
        'ff_actionPlans', _actionPlans.map((x) => x.serialize()).toList());
  }

  bool _isDisclaimer001Signed = false;
  bool get isDisclaimer001Signed => _isDisclaimer001Signed;
  set isDisclaimer001Signed(bool value) {
    _isDisclaimer001Signed = value;
    secureStorage.setBool('ff_isDisclaimer001Signed', value);
  }

  void deleteIsDisclaimer001Signed() {
    secureStorage.delete(key: 'ff_isDisclaimer001Signed');
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
