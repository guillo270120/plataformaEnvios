import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? passwordTextController1;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for crearEmail widget.
  TextEditingController? crearEmailController;
  String? Function(BuildContext, String?)? crearEmailControllerValidator;
  // State field(s) for crearPass widget.
  TextEditingController? crearPassController;
  late bool crearPassVisibility;
  String? Function(BuildContext, String?)? crearPassControllerValidator;
  // State field(s) for crearPassCon widget.
  TextEditingController? crearPassConController;
  late bool crearPassConVisibility;
  String? Function(BuildContext, String?)? crearPassConControllerValidator;
  // State field(s) for crearNom widget.
  TextEditingController? crearNomController;
  String? Function(BuildContext, String?)? crearNomControllerValidator;
  // State field(s) for crearTel widget.
  TextEditingController? crearTelController;
  String? Function(BuildContext, String?)? crearTelControllerValidator;
  // State field(s) for emailAddress_Login_mobile widget.
  TextEditingController? emailAddressLoginMobileController;
  String? Function(BuildContext, String?)?
      emailAddressLoginMobileControllerValidator;
  // State field(s) for password_Login_mobile widget.
  TextEditingController? passwordLoginMobileController;
  late bool passwordLoginMobileVisibility;
  String? Function(BuildContext, String?)?
      passwordLoginMobileControllerValidator;
  // State field(s) for email_registermobile widget.
  TextEditingController? emailRegistermobileController;
  String? Function(BuildContext, String?)?
      emailRegistermobileControllerValidator;
  String? _emailRegistermobileControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for password_Loginregistermobile widget.
  TextEditingController? passwordLoginregistermobileController;
  late bool passwordLoginregistermobileVisibility;
  String? Function(BuildContext, String?)?
      passwordLoginregistermobileControllerValidator;
  String? _passwordLoginregistermobileControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    return null;
  }

  // State field(s) for password_ConfirmMonbile widget.
  TextEditingController? passwordConfirmMonbileController;
  late bool passwordConfirmMonbileVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmMonbileControllerValidator;
  String? _passwordConfirmMonbileControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    return null;
  }

  // State field(s) for nombre_registermobile widget.
  TextEditingController? nombreRegistermobileController;
  String? Function(BuildContext, String?)?
      nombreRegistermobileControllerValidator;
  String? _nombreRegistermobileControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for telefono_registermobile widget.
  TextEditingController? telefonoRegistermobileController;
  String? Function(BuildContext, String?)?
      telefonoRegistermobileControllerValidator;
  String? _telefonoRegistermobileControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    crearPassVisibility = false;
    crearPassConVisibility = false;
    passwordLoginMobileVisibility = false;
    emailRegistermobileControllerValidator =
        _emailRegistermobileControllerValidator;
    passwordLoginregistermobileVisibility = false;
    passwordLoginregistermobileControllerValidator =
        _passwordLoginregistermobileControllerValidator;
    passwordConfirmMonbileVisibility = false;
    passwordConfirmMonbileControllerValidator =
        _passwordConfirmMonbileControllerValidator;
    nombreRegistermobileControllerValidator =
        _nombreRegistermobileControllerValidator;
    telefonoRegistermobileControllerValidator =
        _telefonoRegistermobileControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailTextController1?.dispose();
    passwordTextController1?.dispose();
    crearEmailController?.dispose();
    crearPassController?.dispose();
    crearPassConController?.dispose();
    crearNomController?.dispose();
    crearTelController?.dispose();
    emailAddressLoginMobileController?.dispose();
    passwordLoginMobileController?.dispose();
    emailRegistermobileController?.dispose();
    passwordLoginregistermobileController?.dispose();
    passwordConfirmMonbileController?.dispose();
    nombreRegistermobileController?.dispose();
    telefonoRegistermobileController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
