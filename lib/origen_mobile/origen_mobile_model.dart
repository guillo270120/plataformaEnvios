import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/datos_pagos_mobile_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class OrigenMobileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  DireccionesRecord? origenCopy;
  // Stores action output result for [Backend Call - API (Consulta CP)] action in DropDown widget.
  ApiCallResponse? origenResponseCPCopy;
  // State field(s) for origenNombre widget.
  TextEditingController? origenNombreController;
  String? Function(BuildContext, String?)? origenNombreControllerValidator;
  String? _origenNombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for origenEmail widget.
  TextEditingController? origenEmailController;
  String? Function(BuildContext, String?)? origenEmailControllerValidator;
  String? _origenEmailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for origenTelefono widget.
  TextEditingController? origenTelefonoController;
  String? Function(BuildContext, String?)? origenTelefonoControllerValidator;
  String? _origenTelefonoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for origenCompaia widget.
  TextEditingController? origenCompaiaController;
  String? Function(BuildContext, String?)? origenCompaiaControllerValidator;
  String? _origenCompaiaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for origenCalleYNumero widget.
  TextEditingController? origenCalleYNumeroController;
  String? Function(BuildContext, String?)?
      origenCalleYNumeroControllerValidator;
  String? _origenCalleYNumeroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for OrigenCodigoPostal widget.
  TextEditingController? origenCodigoPostalController;
  final origenCodigoPostalMask = MaskTextInputFormatter(mask: '#####');
  String? Function(BuildContext, String?)?
      origenCodigoPostalControllerValidator;
  String? _origenCodigoPostalControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 5) {
      return 'Maximum 5 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Consulta CP)] action in OrigenCodigoPostal widget.
  ApiCallResponse? cpResponse;
  // State field(s) for origenColonia widget.
  String? origenColoniaValue;
  FormFieldController<String>? origenColoniaValueController;
  // State field(s) for origenCiudad widget.
  TextEditingController? origenCiudadController;
  String? Function(BuildContext, String?)? origenCiudadControllerValidator;
  String? _origenCiudadControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for origenEstado widget.
  TextEditingController? origenEstadoController;
  String? Function(BuildContext, String?)? origenEstadoControllerValidator;
  String? _origenEstadoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for origenPais widget.
  String? origenPaisValue;
  FormFieldController<String>? origenPaisValueController;
  // State field(s) for origenReferncia widget.
  TextEditingController? origenRefernciaController;
  String? Function(BuildContext, String?)? origenRefernciaControllerValidator;
  String? _origenRefernciaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for guardarOrigen widget.
  bool? guardarOrigenValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    origenNombreControllerValidator = _origenNombreControllerValidator;
    origenEmailControllerValidator = _origenEmailControllerValidator;
    origenTelefonoControllerValidator = _origenTelefonoControllerValidator;
    origenCompaiaControllerValidator = _origenCompaiaControllerValidator;
    origenCalleYNumeroControllerValidator =
        _origenCalleYNumeroControllerValidator;
    origenCodigoPostalControllerValidator =
        _origenCodigoPostalControllerValidator;
    origenCiudadControllerValidator = _origenCiudadControllerValidator;
    origenEstadoControllerValidator = _origenEstadoControllerValidator;
    origenRefernciaControllerValidator = _origenRefernciaControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    origenNombreController?.dispose();
    origenEmailController?.dispose();
    origenTelefonoController?.dispose();
    origenCompaiaController?.dispose();
    origenCalleYNumeroController?.dispose();
    origenCodigoPostalController?.dispose();
    origenCiudadController?.dispose();
    origenEstadoController?.dispose();
    origenRefernciaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
