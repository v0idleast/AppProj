import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_pass_widget.dart' show EditPassWidget;
import 'package:flutter/material.dart';

class EditPassModel extends FlutterFlowModel<EditPassWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обов\'язкове поле';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Невірна електронна пошта';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
