// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActionPlanStruct extends BaseStruct {
  ActionPlanStruct({
    int? planIndex,
    String? planOwnerName,
    String? patientSpecialNotes,
    String? history,
    int? age,
    String? medication,
  })  : _planIndex = planIndex,
        _planOwnerName = planOwnerName,
        _patientSpecialNotes = patientSpecialNotes,
        _history = history,
        _age = age,
        _medication = medication;

  // "planIndex" field.
  int? _planIndex;
  int get planIndex => _planIndex ?? 0;
  set planIndex(int? val) => _planIndex = val;
  void incrementPlanIndex(int amount) => _planIndex = planIndex + amount;
  bool hasPlanIndex() => _planIndex != null;

  // "planOwnerName" field.
  String? _planOwnerName;
  String get planOwnerName => _planOwnerName ?? '';
  set planOwnerName(String? val) => _planOwnerName = val;
  bool hasPlanOwnerName() => _planOwnerName != null;

  // "patientSpecialNotes" field.
  String? _patientSpecialNotes;
  String get patientSpecialNotes => _patientSpecialNotes ?? '';
  set patientSpecialNotes(String? val) => _patientSpecialNotes = val;
  bool hasPatientSpecialNotes() => _patientSpecialNotes != null;

  // "history" field.
  String? _history;
  String get history => _history ?? '';
  set history(String? val) => _history = val;
  bool hasHistory() => _history != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;
  void incrementAge(int amount) => _age = age + amount;
  bool hasAge() => _age != null;

  // "medication" field.
  String? _medication;
  String get medication => _medication ?? '';
  set medication(String? val) => _medication = val;
  bool hasMedication() => _medication != null;

  static ActionPlanStruct fromMap(Map<String, dynamic> data) =>
      ActionPlanStruct(
        planIndex: castToType<int>(data['planIndex']),
        planOwnerName: data['planOwnerName'] as String?,
        patientSpecialNotes: data['patientSpecialNotes'] as String?,
        history: data['history'] as String?,
        age: castToType<int>(data['age']),
        medication: data['medication'] as String?,
      );

  static ActionPlanStruct? maybeFromMap(dynamic data) => data is Map
      ? ActionPlanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'planIndex': _planIndex,
        'planOwnerName': _planOwnerName,
        'patientSpecialNotes': _patientSpecialNotes,
        'history': _history,
        'age': _age,
        'medication': _medication,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'planIndex': serializeParam(
          _planIndex,
          ParamType.int,
        ),
        'planOwnerName': serializeParam(
          _planOwnerName,
          ParamType.String,
        ),
        'patientSpecialNotes': serializeParam(
          _patientSpecialNotes,
          ParamType.String,
        ),
        'history': serializeParam(
          _history,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'medication': serializeParam(
          _medication,
          ParamType.String,
        ),
      }.withoutNulls;

  static ActionPlanStruct fromSerializableMap(Map<String, dynamic> data) =>
      ActionPlanStruct(
        planIndex: deserializeParam(
          data['planIndex'],
          ParamType.int,
          false,
        ),
        planOwnerName: deserializeParam(
          data['planOwnerName'],
          ParamType.String,
          false,
        ),
        patientSpecialNotes: deserializeParam(
          data['patientSpecialNotes'],
          ParamType.String,
          false,
        ),
        history: deserializeParam(
          data['history'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        medication: deserializeParam(
          data['medication'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ActionPlanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActionPlanStruct &&
        planIndex == other.planIndex &&
        planOwnerName == other.planOwnerName &&
        patientSpecialNotes == other.patientSpecialNotes &&
        history == other.history &&
        age == other.age &&
        medication == other.medication;
  }

  @override
  int get hashCode => const ListEquality().hash([
        planIndex,
        planOwnerName,
        patientSpecialNotes,
        history,
        age,
        medication
      ]);
}

ActionPlanStruct createActionPlanStruct({
  int? planIndex,
  String? planOwnerName,
  String? patientSpecialNotes,
  String? history,
  int? age,
  String? medication,
}) =>
    ActionPlanStruct(
      planIndex: planIndex,
      planOwnerName: planOwnerName,
      patientSpecialNotes: patientSpecialNotes,
      history: history,
      age: age,
      medication: medication,
    );
