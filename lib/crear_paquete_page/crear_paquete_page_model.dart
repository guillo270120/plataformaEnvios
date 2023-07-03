import '/alert_confirmaciones/paquete_guardado/paquete_guardado_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CrearPaquetePageModel extends FlutterFlowModel {
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

  // State field(s) for largo widget.
  TextEditingController? largoController;
  final largoMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? largoControllerValidator;
  String? _largoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for ancho widget.
  TextEditingController? anchoController;
  final anchoMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? anchoControllerValidator;
  String? _anchoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for alto widget.
  TextEditingController? altoController;
  final altoMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? altoControllerValidator;
  String? _altoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for peso widget.
  TextEditingController? pesoController;
  final pesoMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? pesoControllerValidator;
  String? _pesoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    headerModel = createModel(context, () => HeaderModel());
    aliasControllerValidator = _aliasControllerValidator;
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
    aliasController?.dispose();
    largoController?.dispose();
    anchoController?.dispose();
    altoController?.dispose();
    pesoController?.dispose();
    contenidoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
