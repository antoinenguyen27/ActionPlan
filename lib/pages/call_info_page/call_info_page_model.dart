import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'call_info_page_widget.dart' show CallInfoPageWidget;
import 'package:flutter/material.dart';

class CallInfoPageModel extends FlutterFlowModel<CallInfoPageWidget> {
  ///  Local state fields for this page.

  bool isGenerating3Words = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (whatthreewords)] action in Button widget.
  ApiCallResponse? what3words;
  // State field(s) for what3wordsfield widget.
  FocusNode? what3wordsfieldFocusNode;
  TextEditingController? what3wordsfieldTextController;
  String? Function(BuildContext, String?)?
      what3wordsfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    what3wordsfieldFocusNode?.dispose();
    what3wordsfieldTextController?.dispose();
  }
}
