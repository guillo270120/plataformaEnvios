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
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class CrearEnvioPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for sideMenu component.
  late SideMenuModel sideMenuModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for origenSelect widget.
  String? origenSelectValue;
  FormFieldController<String>? origenSelectValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in origenSelect widget.
  DireccionesRecord? origen;
  // Stores action output result for [Backend Call - API (Consulta CP)] action in origenSelect widget.
  ApiCallResponse? origenResponseCP;
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

    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
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
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  DireccionesRecord? destino;
  // Stores action output result for [Backend Call - API (Consulta CP)] action in DropDown widget.
  ApiCallResponse? destinoResponseCp;
  // State field(s) for destinoNombre widget.
  TextEditingController? destinoNombreController;
  String? Function(BuildContext, String?)? destinoNombreControllerValidator;
  String? _destinoNombreControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for destinoCorreo widget.
  TextEditingController? destinoCorreoController;
  String? Function(BuildContext, String?)? destinoCorreoControllerValidator;
  String? _destinoCorreoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for destinoTelefono widget.
  TextEditingController? destinoTelefonoController;
  String? Function(BuildContext, String?)? destinoTelefonoControllerValidator;
  String? _destinoTelefonoControllerValidator(
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

  // State field(s) for destinoCompaia widget.
  TextEditingController? destinoCompaiaController;
  String? Function(BuildContext, String?)? destinoCompaiaControllerValidator;
  String? _destinoCompaiaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for destinoCalleYumero widget.
  TextEditingController? destinoCalleYumeroController;
  String? Function(BuildContext, String?)?
      destinoCalleYumeroControllerValidator;
  String? _destinoCalleYumeroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for destinoCodigoPostal widget.
  TextEditingController? destinoCodigoPostalController;
  String? Function(BuildContext, String?)?
      destinoCodigoPostalControllerValidator;
  String? _destinoCodigoPostalControllerValidator(
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

  // Stores action output result for [Backend Call - API (Consulta CP)] action in destinoCodigoPostal widget.
  ApiCallResponse? cpResponseDestino;
  // State field(s) for destinoColonia widget.
  String? destinoColoniaValue;
  FormFieldController<String>? destinoColoniaValueController;
  // State field(s) for destinoCiudad widget.
  TextEditingController? destinoCiudadController;
  String? Function(BuildContext, String?)? destinoCiudadControllerValidator;
  String? _destinoCiudadControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for destinoEstado widget.
  TextEditingController? destinoEstadoController;
  String? Function(BuildContext, String?)? destinoEstadoControllerValidator;
  String? _destinoEstadoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for destinoPais widget.
  String? destinoPaisValue;
  FormFieldController<String>? destinoPaisValueController;
  // State field(s) for destinoReferencia widget.
  TextEditingController? destinoReferenciaController;
  String? Function(BuildContext, String?)? destinoReferenciaControllerValidator;
  String? _destinoReferenciaControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obligatorio';
    }

    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for guardarDestino widget.
  bool? guardarDestinoValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EnviosRecord? currentShip;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    sideMenuModel = createModel(context, () => SideMenuModel());
    headerModel = createModel(context, () => HeaderModel());
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
    destinoNombreControllerValidator = _destinoNombreControllerValidator;
    destinoCorreoControllerValidator = _destinoCorreoControllerValidator;
    destinoTelefonoControllerValidator = _destinoTelefonoControllerValidator;
    destinoCompaiaControllerValidator = _destinoCompaiaControllerValidator;
    destinoCalleYumeroControllerValidator =
        _destinoCalleYumeroControllerValidator;
    destinoCodigoPostalControllerValidator =
        _destinoCodigoPostalControllerValidator;
    destinoCiudadControllerValidator = _destinoCiudadControllerValidator;
    destinoEstadoControllerValidator = _destinoEstadoControllerValidator;
    destinoReferenciaControllerValidator =
        _destinoReferenciaControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    sideMenuModel.dispose();
    headerModel.dispose();
    origenNombreController?.dispose();
    origenEmailController?.dispose();
    origenTelefonoController?.dispose();
    origenCompaiaController?.dispose();
    origenCalleYNumeroController?.dispose();
    origenCodigoPostalController?.dispose();
    origenCiudadController?.dispose();
    origenEstadoController?.dispose();
    origenRefernciaController?.dispose();
    destinoNombreController?.dispose();
    destinoCorreoController?.dispose();
    destinoTelefonoController?.dispose();
    destinoCompaiaController?.dispose();
    destinoCalleYumeroController?.dispose();
    destinoCodigoPostalController?.dispose();
    destinoCiudadController?.dispose();
    destinoEstadoController?.dispose();
    destinoReferenciaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
