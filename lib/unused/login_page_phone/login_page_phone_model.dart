import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_page_phone_widget.dart' show LoginPagePhoneWidget;
import 'package:flutter/material.dart';

class LoginPagePhoneModel extends FlutterFlowModel<LoginPagePhoneWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Поле обов\'язкове';
    }

    if (!RegExp('').hasMatch(val)) {
      return 'Невірний номер телефону';
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
