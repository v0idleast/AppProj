import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_verify_code_widget.dart' show LoginVerifyCodeWidget;
import 'package:flutter/material.dart';

class LoginVerifyCodeModel extends FlutterFlowModel<LoginVerifyCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
