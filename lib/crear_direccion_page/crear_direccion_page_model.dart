import '/alert_confirmaciones/direccion_guardada/direccion_guardada_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/header_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CrearDireccionPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for alias widget.
  TextEditingController? aliasController;
  String? Function(BuildContext, String?)? aliasControllerValidator;
  String? _aliasControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for nombre widget.
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  String? _nombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for empresa widget.
  TextEditingController? empresaController;
  String? Function(BuildContext, String?)? empresaControllerValidator;
  String? _empresaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for correo widget.
  TextEditingController? correoController;
  String? Function(BuildContext, String?)? correoControllerValidator;
  String? _correoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for telefono widget.
  TextEditingController? telefonoController;
  String? Function(BuildContext, String?)? telefonoControllerValidator;
  String? _telefonoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for calleYNumero widget.
  TextEditingController? calleYNumeroController;
  String? Function(BuildContext, String?)? calleYNumeroControllerValidator;
  String? _calleYNumeroControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for codigoPostal widget.
  TextEditingController? codigoPostalController;
  String? Function(BuildContext, String?)? codigoPostalControllerValidator;
  String? _codigoPostalControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Consulta CP)] action in codigoPostal widget.
  ApiCallResponse? cpResponse;
  // State field(s) for colonia widget.
  String? coloniaValue;
  FormFieldController<String>? coloniaValueController;
  // State field(s) for ciudad widget.
  TextEditingController? ciudadController;
  String? Function(BuildContext, String?)? ciudadControllerValidator;
  String? _ciudadControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for estado widget.
  TextEditingController? estadoController;
  String? Function(BuildContext, String?)? estadoControllerValidator;
  // State field(s) for pais widget.
  String? paisValue;
  FormFieldController<String>? paisValueController;
  // State field(s) for referencia widget.
  TextEditingController? referenciaController;
  String? Function(BuildContext, String?)? referenciaControllerValidator;
  String? _referenciaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    headerModel = createModel(context, () => HeaderModel());
    aliasControllerValidator = _aliasControllerValidator;
    nombreControllerValidator = _nombreControllerValidator;
    empresaControllerValidator = _empresaControllerValidator;
    correoControllerValidator = _correoControllerValidator;
    telefonoControllerValidator = _telefonoControllerValidator;
    calleYNumeroControllerValidator = _calleYNumeroControllerValidator;
    codigoPostalControllerValidator = _codigoPostalControllerValidator;
    ciudadControllerValidator = _ciudadControllerValidator;
    referenciaControllerValidator = _referenciaControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    sideMenuModel.dispose();
    headerModel.dispose();
    aliasController?.dispose();
    nombreController?.dispose();
    empresaController?.dispose();
    correoController?.dispose();
    telefonoController?.dispose();
    calleYNumeroController?.dispose();
    codigoPostalController?.dispose();
    ciudadController?.dispose();
    estadoController?.dispose();
    referenciaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
