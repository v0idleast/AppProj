import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_phone_widget.dart' show SignUpPhoneWidget;
import 'package:flutter/material.dart';

class SignUpPhoneModel extends FlutterFlowModel<SignUpPhoneWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
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
    phoneTextControllerValidator = _phoneTextControllerValidator;
  }

  @override
  void dispose() {
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
