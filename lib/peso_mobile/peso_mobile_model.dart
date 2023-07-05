import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/datos_pagos_mobile_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PesoMobileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
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
  // State field(s) for ancho widget.
  TextEditingController? anchoController;
  String? Function(BuildContext, String?)? anchoControllerValidator;
  // State field(s) for alto widget.
  TextEditingController? altoController;
  String? Function(BuildContext, String?)? altoControllerValidator;
  // State field(s) for peso widget.
  TextEditingController? pesoController;
  String? Function(BuildContext, String?)? pesoControllerValidator;
  // State field(s) for contenido widget.
  TextEditingController? contenidoController;
  String? Function(BuildContext, String?)? contenidoControllerValidator;
  // State field(s) for guardarPaquete widget.
  bool? guardarPaqueteValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    largoController?.dispose();
    anchoController?.dispose();
    altoController?.dispose();
    pesoController?.dispose();
    contenidoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
