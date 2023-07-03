import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DimensionesPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  PaquetesRecord? paquete;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for largo widget.
  TextEditingController? largoController;
  String? Function(BuildContext, String?)? largoControllerValidator;
  String? _largoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ancho widget.
  TextEditingController? anchoController;
  String? Function(BuildContext, String?)? anchoControllerValidator;
  String? _anchoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for alto widget.
  TextEditingController? altoController;
  String? Function(BuildContext, String?)? altoControllerValidator;
  String? _altoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for peso widget.
  TextEditingController? pesoController;
  String? Function(BuildContext, String?)? pesoControllerValidator;
  String? _pesoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for cantidad widget.
  TextEditingController? cantidadController;
  String? Function(BuildContext, String?)? cantidadControllerValidator;
  // State field(s) for contenido widget.
  TextEditingController? contenidoController;
  String? Function(BuildContext, String?)? contenidoControllerValidator;
  String? _contenidoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    headerModel = createModel(context, () => HeaderModel());
    largoControllerValidator = _largoControllerValidator;
    anchoControllerValidator = _anchoControllerValidator;
    altoControllerValidator = _altoControllerValidator;
    pesoControllerValidator = _pesoControllerValidator;
    contenidoControllerValidator = _contenidoControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    sideMenuModel.dispose();
    headerModel.dispose();
    largoController?.dispose();
    anchoController?.dispose();
    altoController?.dispose();
    pesoController?.dispose();
    cantidadController?.dispose();
    contenidoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
