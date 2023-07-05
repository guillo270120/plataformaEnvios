import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/datos_pagos_mobile_widget.dart';
import '/components/header_widget.dart';
import '/components/side_menu_widget.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'crear_envio_page_model.dart';
export 'crear_envio_page_model.dart';

class CrearEnvioPageWidget extends StatefulWidget {
  const CrearEnvioPageWidget({Key? key}) : super(key: key);

  @override
  _CrearEnvioPageWidgetState createState() => _CrearEnvioPageWidgetState();
}

class _CrearEnvioPageWidgetState extends State<CrearEnvioPageWidget> {
  late CrearEnvioPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearEnvioPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'crearEnvioPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREAR_ENVIO_crearEnvioPage_ON_INIT_STATE');
      logFirebaseEvent('crearEnvioPage_update_app_state');
      setState(() {
        FFAppState().pagina = 'Crear envio';
      });
    });

    _model.origenNombreController ??= TextEditingController();
    _model.origenEmailController ??= TextEditingController();
    _model.origenTelefonoController ??= TextEditingController();
    _model.origenCompaiaController ??= TextEditingController();
    _model.origenCalleYNumeroController ??= TextEditingController();
    _model.origenCodigoPostalController ??= TextEditingController();
    _model.origenCiudadController ??= TextEditingController();
    _model.origenEstadoController ??= TextEditingController();
    _model.origenRefernciaController ??= TextEditingController();
    _model.destinoNombreController ??= TextEditingController();
    _model.destinoCorreoController ??= TextEditingController();
    _model.destinoTelefonoController ??= TextEditingController();
    _model.destinoCompaiaController ??= TextEditingController();
    _model.destinoCalleYumeroController ??= TextEditingController();
    _model.destinoCodigoPostalController ??= TextEditingController();
    _model.destinoCiudadController ??= TextEditingController();
    _model.destinoEstadoController ??= TextEditingController();
    _model.destinoReferenciaController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<DireccionesRecord>>(
      stream: queryDireccionesRecord(
        queryBuilder: (direccionesRecord) =>
            direccionesRecord.where('filtros', arrayContains: currentUserUid),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: Color(0xFFED3237),
                ),
              ),
            ),
          );
        }
        List<DireccionesRecord> crearEnvioPageDireccionesRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: AuthUserStreamWidget(
                  builder: (context) =>
                      StreamBuilder<List<ConfiguracionLocalRecord>>(
                    stream: queryConfiguracionLocalRecord(
                      queryBuilder: (configuracionLocalRecord) =>
                          configuracionLocalRecord.where('nombre_plataforma',
                              isEqualTo: valueOrDefault(
                                  currentUserDocument?.plataforma, '')),
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: Color(0xFFED3237),
                            ),
                          ),
                        );
                      }
                      List<ConfiguracionLocalRecord>
                          columnConfiguracionLocalRecordList = snapshot.data!;
                      final columnConfiguracionLocalRecord =
                          columnConfiguracionLocalRecordList.isNotEmpty
                              ? columnConfiguracionLocalRecordList.first
                              : null;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CREAR_ENVIO_Icon_gg7865k1_ON_TAP');
                                  logFirebaseEvent('Icon_drawer');
                                  if (scaffoldKey.currentState!.isDrawerOpen ||
                                      scaffoldKey
                                          .currentState!.isEndDrawerOpen) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              columnConfiguracionLocalRecord!.logo,
                              width: 300.0,
                              height: 200.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'CREAR_ENVIO_CREAR_ENVIO_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('crearEnvioPage');
                            },
                            text: 'Crear Envio',
                            icon: Icon(
                              Icons.add,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.truck,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Envios',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 13.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        collapsed: Container(),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Cotiizar',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CREAR_ENVIO_Row_u7ri6iqx_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Row_navigate_to');

                                                  context.pushNamed(
                                                      'historialDeEnviosPage');
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Historial de envios',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CREAR_ENVIO_Row_nufflnlh_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Row_navigate_to');

                                                  context.pushNamed(
                                                      'historialOrdenesPage');
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Historial de ordenes',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: Icons.keyboard_arrow_down,
                                          collapseIcon: Icons.keyboard_arrow_up,
                                          iconSize: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: ExpandableNotifier(
                                      initialExpanded: false,
                                      child: ExpandablePanel(
                                        header: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.settings,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Configuraciones',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 13.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        collapsed: Container(),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CREAR_ENVIO_Row_dgadzcy4_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Row_navigate_to');

                                                  context.pushNamed(
                                                      'direccionesPage');
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Direcciones',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CREAR_ENVIO_Row_ey2sk7qz_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Row_navigate_to');

                                                  context.pushNamed(
                                                      'paquetesPage');
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Paquetes',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          expandIcon: Icons.keyboard_arrow_down,
                                          collapseIcon: Icons.keyboard_arrow_up,
                                          iconSize: 25.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((valueOrDefault(
                                            currentUserDocument?.rol, '') ==
                                        'super') ||
                                    (valueOrDefault(
                                            currentUserDocument?.rol, '') ==
                                        'main') ||
                                    (valueOrDefault(
                                            currentUserDocument?.rol, '') ==
                                        'admin'))
                                  Expanded(
                                    child: FutureBuilder<int>(
                                      future: queryUsersRecordCount(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord
                                                .where('filtros',
                                                    arrayContains:
                                                        currentUserUid)
                                                .where('status',
                                                    isEqualTo: false),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color: Color(0xFFED3237),
                                              ),
                                            ),
                                          );
                                        }
                                        int expandableCount = snapshot.data!;
                                        return Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: ExpandableNotifier(
                                            initialExpanded: false,
                                            child: ExpandablePanel(
                                              header: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.settings,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Administracion',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.black,
                                                            fontSize: 13.0,
                                                          ),
                                                    ),
                                                  ),
                                                  if (((valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.rol,
                                                                  '') ==
                                                              'super') ||
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.rol,
                                                                  '') ==
                                                              'main') ||
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.rol,
                                                                  '') ==
                                                              'admin')) &&
                                                      (expandableCount > 0))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: badges.Badge(
                                                        badgeContent: Text(
                                                          expandableCount
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                        showBadge: true,
                                                        shape: badges
                                                            .BadgeShape.circle,
                                                        badgeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        elevation: 4.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        position:
                                                            badges.BadgePosition
                                                                .topEnd(),
                                                        animationType: badges
                                                            .BadgeAnimationType
                                                            .scale,
                                                        toAnimate: true,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              collapsed: Container(),
                                              expanded: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CREAR_ENVIO_Row_bxdcsvfr_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');

                                                        context.pushNamed(
                                                            'carriers');
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Carriers',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.chevron_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CREAR_ENVIO_Row_d9kpt1tv_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');

                                                        context
                                                            .pushNamed('users');
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Usuarios',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          if (((valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.rol,
                                                                          '') ==
                                                                      'super') ||
                                                                  (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.rol,
                                                                          '') ==
                                                                      'main') ||
                                                                  (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.rol,
                                                                          '') ==
                                                                      'admin')) &&
                                                              (expandableCount >
                                                                  0))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child:
                                                                  badges.Badge(
                                                                badgeContent:
                                                                    Text(
                                                                  expandableCount
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                ),
                                                                showBadge: true,
                                                                shape: badges
                                                                    .BadgeShape
                                                                    .circle,
                                                                badgeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                elevation: 4.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                position: badges
                                                                        .BadgePosition
                                                                    .topEnd(),
                                                                animationType:
                                                                    badges
                                                                        .BadgeAnimationType
                                                                        .scale,
                                                                toAnimate: true,
                                                              ),
                                                            ),
                                                          Icon(
                                                            Icons.chevron_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CREAR_ENVIO_Row_vajt8jmz_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Row_navigate_to');

                                                        context.pushNamed(
                                                            'configuracionPlataforma');
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'Configuracion Plataforma',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.chevron_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.rol,
                                                              '') ==
                                                          'super') ||
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.rol,
                                                              '') ==
                                                          'main'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'CREAR_ENVIO_Row_a7eu9717_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Row_navigate_to');

                                                          context.pushNamed(
                                                              'configuracionMain');
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                'Configuracion Main',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .chevron_right,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                                expandIcon:
                                                    Icons.keyboard_arrow_down,
                                                collapseIcon:
                                                    Icons.keyboard_arrow_up,
                                                iconSize: 25.0,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CREAR_ENVIO_Row_l9uw8vi8_ON_TAP');
                                logFirebaseEvent('Row_auth');
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    'loginPage', context.mounted);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.logout_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Cerrar Sesion',
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.black,
                                              fontSize: 13.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: AuthUserStreamWidget(
                builder: (context) =>
                    StreamBuilder<List<ConfiguracionLocalRecord>>(
                  stream: queryConfiguracionLocalRecord(
                    queryBuilder: (configuracionLocalRecord) =>
                        configuracionLocalRecord.where('nombre_plataforma',
                            isEqualTo: valueOrDefault(
                                currentUserDocument?.plataforma, '')),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: Color(0xFFED3237),
                          ),
                        ),
                      );
                    }
                    List<ConfiguracionLocalRecord>
                        rowConfiguracionLocalRecordList = snapshot.data!;
                    final rowConfiguracionLocalRecord =
                        rowConfiguracionLocalRecordList.isNotEmpty
                            ? rowConfiguracionLocalRecordList.first
                            : null;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                        ))
                          wrapWithModel(
                            model: _model.sideMenuModel,
                            updateCallback: () => setState(() {}),
                            child: SideMenuWidget(),
                          ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                wrapWithModel(
                                  model: _model.headerModel,
                                  updateCallback: () => setState(() {}),
                                  child: HeaderWidget(),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.95,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 20.0),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Form(
                                                    key: _model.formKey1,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Remitente',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Quien envia el paquete',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    'Remitentes guardados',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Borrar',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .origenSelectValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options:
                                                                  crearEnvioPageDireccionesRecordList
                                                                      .map((e) =>
                                                                          e.alias)
                                                                      .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() =>
                                                                    _model.origenSelectValue =
                                                                        val);
                                                                logFirebaseEvent(
                                                                    'CREAR_ENVIO_origenSelect_ON_FORM_WIDGET_');
                                                                logFirebaseEvent(
                                                                    'origenSelect_firestore_query');
                                                                _model.origen =
                                                                    await queryDireccionesRecordOnce(
                                                                  queryBuilder: (direccionesRecord) => direccionesRecord.where(
                                                                      'alias',
                                                                      isEqualTo:
                                                                          _model
                                                                              .origenSelectValue),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                logFirebaseEvent(
                                                                    'origenSelect_backend_call');
                                                                _model.origenResponseCP =
                                                                    await ConsultaCPCall
                                                                        .call(
                                                                  cp: _model
                                                                      .origen!
                                                                      .codigopostal,
                                                                );
                                                                logFirebaseEvent(
                                                                    'origenSelect_update_app_state');
                                                                setState(() {
                                                                  FFAppState()
                                                                      .coloniasOrigen = (ConsultaCPCall
                                                                          .colonias(
                                                                    (_model.origenResponseCP
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                      .map<String>(
                                                                          (s) => s
                                                                              .toString())
                                                                      .toList()!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenNombreController
                                                                          ?.text =
                                                                      _model
                                                                          .origen!
                                                                          .nombre;
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenEmailController
                                                                          ?.text =
                                                                      _model
                                                                          .origen!
                                                                          .correo;
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenTelefonoController
                                                                          ?.text =
                                                                      _model
                                                                          .origen!
                                                                          .telefono;
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenCompaiaController
                                                                          ?.text =
                                                                      _model
                                                                          .origen!
                                                                          .empresa;
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenColoniaValueController
                                                                          ?.value =
                                                                      _model
                                                                          .origen!
                                                                          .pais;
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenCalleYNumeroController
                                                                          ?.text =
                                                                      _model
                                                                          .origen!
                                                                          .calleynumero;
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenCodigoPostalController
                                                                          ?.text =
                                                                      _model
                                                                          .origen!
                                                                          .codigopostal;
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenColoniaValueController
                                                                          ?.value =
                                                                      _model
                                                                          .origen!
                                                                          .colonia;
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenEstadoController
                                                                          ?.text =
                                                                      ConsultaCPCall
                                                                          .estado(
                                                                    (_model.origenResponseCP
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString();
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenCiudadController
                                                                          ?.text =
                                                                      ConsultaCPCall
                                                                          .municipio(
                                                                    (_model.origenResponseCP
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString();
                                                                });
                                                                logFirebaseEvent(
                                                                    'origenSelect_set_form_field');
                                                                setState(() {
                                                                  _model.origenRefernciaController
                                                                          ?.text =
                                                                      _model
                                                                          .origen!
                                                                          .referencia;
                                                                });

                                                                setState(() {});
                                                              },
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 50.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                              hintText:
                                                                  'Busca o selecciona un remitente',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Datos personales',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenNombreController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Nombre  Completo',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenNombreControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenEmailController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Correo Electronico',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenEmailControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenTelefonoController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Telefono',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenTelefonoControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenCompaiaController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Compañia',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenCompaiaControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Direccion',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenCalleYNumeroController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Calle y numero',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenCalleYNumeroControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenCodigoPostalController,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.origenCodigoPostalController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                1000),
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'CREAR_ENVIO_OrigenCodigoPostal_ON_TEXTFI');
                                                                          logFirebaseEvent(
                                                                              'OrigenCodigoPostal_backend_call');
                                                                          _model.cpResponse =
                                                                              await ConsultaCPCall.call(
                                                                            cp: _model.origenCodigoPostalController.text,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'OrigenCodigoPostal_set_form_field');
                                                                          setState(
                                                                              () {
                                                                            _model.origenCiudadController?.text =
                                                                                ConsultaCPCall.municipio(
                                                                              (_model.cpResponse?.jsonBody ?? ''),
                                                                            ).toString();
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'OrigenCodigoPostal_set_form_field');
                                                                          setState(
                                                                              () {
                                                                            _model.origenEstadoController?.text =
                                                                                ConsultaCPCall.estado(
                                                                              (_model.cpResponse?.jsonBody ?? ''),
                                                                            ).toString();
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'OrigenCodigoPostal_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().coloniasOrigen = (ConsultaCPCall.colonias(
                                                                              (_model.cpResponse?.jsonBody ?? ''),
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .toList()
                                                                                .cast<String>();
                                                                          });

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Codigo Postal ',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenCodigoPostalControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                      inputFormatters: [
                                                                        _model
                                                                            .origenCodigoPostalMask
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                          .origenColoniaValueController ??= FormFieldController<
                                                                              String>(
                                                                          null),
                                                                      options:
                                                                          FFAppState()
                                                                              .coloniasOrigen,
                                                                      onChanged:
                                                                          (val) =>
                                                                              setState(() => _model.origenColoniaValue = val),
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          50.0,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMedium,
                                                                      hintText:
                                                                          'Seleccionar Colonia',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderWidth:
                                                                          1.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isSearchable:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenCiudadController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Ciudad',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenCiudadControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenEstadoController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Estado ',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenEstadoControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .origenPaisValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.origenPaisValue ??=
                                                                            'Mexico',
                                                                      ),
                                                                      options: [
                                                                        'Mexico'
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              setState(() => _model.origenPaisValue = val),
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          50.0,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMedium,
                                                                      hintText:
                                                                          'Please select...',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderWidth:
                                                                          1.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isSearchable:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .origenRefernciaController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Referencia',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .origenRefernciaControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        20.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                            .guardarOrigenValue ??=
                                                                        false,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      setState(() =>
                                                                          _model.guardarOrigenValue =
                                                                              newValue!);
                                                                    },
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Guardar Remitente',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 20.0),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 4.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Form(
                                                    key: _model.formKey2,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Destinatario',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Quien recibe el paquete',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    'Remitentes guardados',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Borrar',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .dropDownValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options:
                                                                  crearEnvioPageDireccionesRecordList
                                                                      .map((e) =>
                                                                          e.alias)
                                                                      .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() =>
                                                                    _model.dropDownValue =
                                                                        val);
                                                                logFirebaseEvent(
                                                                    'CREAR_ENVIO_DropDown_6uzat036_ON_FORM_WI');
                                                                logFirebaseEvent(
                                                                    'DropDown_firestore_query');
                                                                _model.destino =
                                                                    await queryDireccionesRecordOnce(
                                                                  queryBuilder: (direccionesRecord) => direccionesRecord.where(
                                                                      'alias',
                                                                      isEqualTo:
                                                                          _model
                                                                              .dropDownValue),
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                logFirebaseEvent(
                                                                    'DropDown_backend_call');
                                                                _model.destinoResponseCp =
                                                                    await ConsultaCPCall
                                                                        .call(
                                                                  cp: _model
                                                                      .destino!
                                                                      .codigopostal,
                                                                );
                                                                logFirebaseEvent(
                                                                    'DropDown_update_app_state');
                                                                setState(() {
                                                                  FFAppState()
                                                                      .coloniasDestino = (ConsultaCPCall
                                                                          .colonias(
                                                                    (_model.destinoResponseCp
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                      .map<String>(
                                                                          (s) => s
                                                                              .toString())
                                                                      .toList()!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoNombreController
                                                                          ?.text =
                                                                      _model
                                                                          .destino!
                                                                          .nombre;
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoCorreoController
                                                                          ?.text =
                                                                      _model
                                                                          .destino!
                                                                          .correo;
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoTelefonoController
                                                                          ?.text =
                                                                      _model
                                                                          .destino!
                                                                          .telefono;
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoCompaiaController
                                                                          ?.text =
                                                                      _model
                                                                          .destino!
                                                                          .empresa;
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoColoniaValueController
                                                                          ?.value =
                                                                      _model
                                                                          .destino!
                                                                          .pais;
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoCalleYumeroController
                                                                          ?.text =
                                                                      _model
                                                                          .destino!
                                                                          .calleynumero;
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoCodigoPostalController
                                                                          ?.text =
                                                                      _model
                                                                          .destino!
                                                                          .codigopostal;
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoColoniaValueController
                                                                          ?.value =
                                                                      _model
                                                                          .destino!
                                                                          .colonia;
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoEstadoController
                                                                          ?.text =
                                                                      ConsultaCPCall
                                                                          .estado(
                                                                    (_model.destinoResponseCp
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString();
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoCiudadController
                                                                          ?.text =
                                                                      ConsultaCPCall
                                                                          .municipio(
                                                                    (_model.destinoResponseCp
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ).toString();
                                                                });
                                                                logFirebaseEvent(
                                                                    'DropDown_set_form_field');
                                                                setState(() {
                                                                  _model.destinoReferenciaController
                                                                          ?.text =
                                                                      _model
                                                                          .destino!
                                                                          .referencia;
                                                                });

                                                                setState(() {});
                                                              },
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 50.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                              hintText:
                                                                  'Busca o selecciona un destinatario',
                                                              searchHintText:
                                                                  'Buscar direccion',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isSearchable:
                                                                  true,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Datos personales',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoNombreController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Nombre  Completo',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoNombreControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoCorreoController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Correo Electronico',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoCorreoControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoTelefonoController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Telefono',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoTelefonoControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoCompaiaController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Compañia',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoCompaiaControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Direccion',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoCalleYumeroController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Calle y numero',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoCalleYumeroControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoCodigoPostalController,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.destinoCodigoPostalController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () async {
                                                                          logFirebaseEvent(
                                                                              'CREAR_ENVIO_destinoCodigoPostal_ON_TEXTF');
                                                                          logFirebaseEvent(
                                                                              'destinoCodigoPostal_backend_call');
                                                                          _model.cpResponseDestino =
                                                                              await ConsultaCPCall.call(
                                                                            cp: _model.destinoCodigoPostalController.text,
                                                                          );
                                                                          logFirebaseEvent(
                                                                              'destinoCodigoPostal_set_form_field');
                                                                          setState(
                                                                              () {
                                                                            _model.destinoCiudadController?.text =
                                                                                ConsultaCPCall.municipio(
                                                                              (_model.cpResponseDestino?.jsonBody ?? ''),
                                                                            ).toString();
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'destinoCodigoPostal_set_form_field');
                                                                          setState(
                                                                              () {
                                                                            _model.destinoEstadoController?.text =
                                                                                ConsultaCPCall.estado(
                                                                              (_model.cpResponseDestino?.jsonBody ?? ''),
                                                                            ).toString();
                                                                          });
                                                                          logFirebaseEvent(
                                                                              'destinoCodigoPostal_update_app_state');
                                                                          setState(
                                                                              () {
                                                                            FFAppState().coloniasDestino = (ConsultaCPCall.colonias(
                                                                              (_model.cpResponseDestino?.jsonBody ?? ''),
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()!
                                                                                .toList()
                                                                                .cast<String>();
                                                                          });

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      ),
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Codigo Postal ',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoCodigoPostalControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                          .destinoColoniaValueController ??= FormFieldController<
                                                                              String>(
                                                                          null),
                                                                      options:
                                                                          FFAppState()
                                                                              .coloniasDestino,
                                                                      onChanged:
                                                                          (val) =>
                                                                              setState(() => _model.destinoColoniaValue = val),
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          50.0,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMedium,
                                                                      hintText:
                                                                          'Seleccionar colonia',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderWidth:
                                                                          1.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isSearchable:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoCiudadController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Ciudad',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoCiudadControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoEstadoController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Estado ',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoEstadoControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .destinoPaisValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.destinoPaisValue ??=
                                                                            'Mexico',
                                                                      ),
                                                                      options: [
                                                                        'Mexico'
                                                                      ],
                                                                      onChanged:
                                                                          (val) =>
                                                                              setState(() => _model.destinoPaisValue = val),
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          50.0,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMedium,
                                                                      hintText:
                                                                          'Please select...',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      borderWidth:
                                                                          1.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      isSearchable:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .destinoReferenciaController,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Referencia',
                                                                        labelStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        hintStyle:
                                                                            FlutterFlowTheme.of(context).labelMedium,
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      validator: _model
                                                                          .destinoReferenciaControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        20.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                            .guardarDestinoValue ??=
                                                                        false,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      setState(() =>
                                                                          _model.guardarDestinoValue =
                                                                              newValue!);
                                                                    },
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Guardar Destinatario',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'CREAR_ENVIO_SIGUIENTE_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_validate_form');
                                                  if (_model.formKey1
                                                              .currentState ==
                                                          null ||
                                                      !_model.formKey1
                                                          .currentState!
                                                          .validate()) {
                                                    return;
                                                  }
                                                  if (_model
                                                          .origenColoniaValue ==
                                                      null) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Error'),
                                                          content: Text(
                                                              'Debe Seleccionar un pais'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    return;
                                                  }
                                                  logFirebaseEvent(
                                                      'Button_validate_form');
                                                  if (_model.formKey2
                                                              .currentState ==
                                                          null ||
                                                      !_model.formKey2
                                                          .currentState!
                                                          .validate()) {
                                                    return;
                                                  }
                                                  if (_model
                                                          .destinoColoniaValue ==
                                                      null) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Error'),
                                                          content: Text(
                                                              'Debe seleccionar un pais'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    return;
                                                  }
                                                  logFirebaseEvent(
                                                      'Button_backend_call');

                                                  var enviosRecordReference =
                                                      EnviosRecord.collection
                                                          .doc();
                                                  await enviosRecordReference
                                                      .set({
                                                    ...createEnviosRecordData(
                                                      origen:
                                                          createOriginAttributesStruct(
                                                        name: _model
                                                            .origenNombreController
                                                            .text,
                                                        company: _model
                                                            .origenCompaiaController
                                                            .text,
                                                        street: _model
                                                            .origenCalleYNumeroController
                                                            .text,
                                                        neighborhood: _model
                                                            .origenColoniaValue,
                                                        city: _model
                                                            .origenCiudadController
                                                            .text,
                                                        state: _model
                                                            .origenEstadoController
                                                            .text,
                                                        postalCode: _model
                                                            .origenCodigoPostalController
                                                            .text,
                                                        email: _model
                                                            .origenEmailController
                                                            .text,
                                                        phone: _model
                                                            .origenTelefonoController
                                                            .text,
                                                        countryId: 248,
                                                        reference1: _model
                                                            .origenRefernciaController
                                                            .text,
                                                        callingCode: '52',
                                                        save: false,
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                      destino:
                                                          createDestinationAttributesStruct(
                                                        name: _model
                                                            .destinoNombreController
                                                            .text,
                                                        company: _model
                                                            .destinoCompaiaController
                                                            .text,
                                                        street: _model
                                                            .destinoCalleYumeroController
                                                            .text,
                                                        city: _model
                                                            .destinoCiudadController
                                                            .text,
                                                        state: _model
                                                            .destinoEstadoController
                                                            .text,
                                                        postalCode: _model
                                                            .destinoCodigoPostalController
                                                            .text,
                                                        email: _model
                                                            .destinoCorreoController
                                                            .text,
                                                        phone: _model
                                                            .destinoTelefonoController
                                                            .text,
                                                        countryId: 248,
                                                        reference1: _model
                                                            .destinoReferenciaController
                                                            .text,
                                                        callingCode: '52',
                                                        save: false,
                                                        neighborhood: _model
                                                            .destinoColoniaValue,
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                      status: 'pending',
                                                      userId: currentUserUid,
                                                      step: 'paquete',
                                                      createdAt:
                                                          getCurrentTimestamp,
                                                      plataforma: valueOrDefault(
                                                          currentUserDocument
                                                              ?.plataforma,
                                                          ''),
                                                    ),
                                                    'filtros':
                                                        rowConfiguracionLocalRecord!
                                                            .administradoresUuid,
                                                  });
                                                  _model.currentShip =
                                                      EnviosRecord
                                                          .getDocumentFromData({
                                                    ...createEnviosRecordData(
                                                      origen:
                                                          createOriginAttributesStruct(
                                                        name: _model
                                                            .origenNombreController
                                                            .text,
                                                        company: _model
                                                            .origenCompaiaController
                                                            .text,
                                                        street: _model
                                                            .origenCalleYNumeroController
                                                            .text,
                                                        neighborhood: _model
                                                            .origenColoniaValue,
                                                        city: _model
                                                            .origenCiudadController
                                                            .text,
                                                        state: _model
                                                            .origenEstadoController
                                                            .text,
                                                        postalCode: _model
                                                            .origenCodigoPostalController
                                                            .text,
                                                        email: _model
                                                            .origenEmailController
                                                            .text,
                                                        phone: _model
                                                            .origenTelefonoController
                                                            .text,
                                                        countryId: 248,
                                                        reference1: _model
                                                            .origenRefernciaController
                                                            .text,
                                                        callingCode: '52',
                                                        save: false,
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                      destino:
                                                          createDestinationAttributesStruct(
                                                        name: _model
                                                            .destinoNombreController
                                                            .text,
                                                        company: _model
                                                            .destinoCompaiaController
                                                            .text,
                                                        street: _model
                                                            .destinoCalleYumeroController
                                                            .text,
                                                        city: _model
                                                            .destinoCiudadController
                                                            .text,
                                                        state: _model
                                                            .destinoEstadoController
                                                            .text,
                                                        postalCode: _model
                                                            .destinoCodigoPostalController
                                                            .text,
                                                        email: _model
                                                            .destinoCorreoController
                                                            .text,
                                                        phone: _model
                                                            .destinoTelefonoController
                                                            .text,
                                                        countryId: 248,
                                                        reference1: _model
                                                            .destinoReferenciaController
                                                            .text,
                                                        callingCode: '52',
                                                        save: false,
                                                        neighborhood: _model
                                                            .destinoColoniaValue,
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                      status: 'pending',
                                                      userId: currentUserUid,
                                                      step: 'paquete',
                                                      createdAt:
                                                          getCurrentTimestamp,
                                                      plataforma: valueOrDefault(
                                                          currentUserDocument
                                                              ?.plataforma,
                                                          ''),
                                                    ),
                                                    'filtros':
                                                        rowConfiguracionLocalRecord!
                                                            .administradoresUuid,
                                                  }, enviosRecordReference);
                                                  if (_model
                                                      .guardarOrigenValue!) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await DireccionesRecord
                                                        .collection
                                                        .doc()
                                                        .set({
                                                      ...createDireccionesRecordData(
                                                        userId: currentUserUid,
                                                        alias: _model
                                                            .origenNombreController
                                                            .text,
                                                        nombre: _model
                                                            .origenNombreController
                                                            .text,
                                                        empresa: _model
                                                            .origenCompaiaController
                                                            .text,
                                                        correo: _model
                                                            .origenEmailController
                                                            .text,
                                                        telefono: _model
                                                            .origenTelefonoController
                                                            .text,
                                                        calleynumero: _model
                                                            .origenCalleYNumeroController
                                                            .text,
                                                        colonia: _model
                                                            .origenColoniaValue,
                                                        ciudad: _model
                                                            .origenCiudadController
                                                            .text,
                                                        codigopostal: _model
                                                            .origenCodigoPostalController
                                                            .text,
                                                        pais: _model
                                                            .origenColoniaValue,
                                                        estado: _model
                                                            .origenEstadoController
                                                            .text,
                                                        referencia: _model
                                                            .origenRefernciaController
                                                            .text,
                                                      ),
                                                      'filtros':
                                                          rowConfiguracionLocalRecord!
                                                              .administradoresUuid,
                                                    });
                                                  }
                                                  if (_model
                                                      .guardarDestinoValue!) {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await DireccionesRecord
                                                        .collection
                                                        .doc()
                                                        .set({
                                                      ...createDireccionesRecordData(
                                                        userId: currentUserUid,
                                                        alias: _model
                                                            .destinoNombreController
                                                            .text,
                                                        nombre: _model
                                                            .destinoNombreController
                                                            .text,
                                                        empresa: _model
                                                            .destinoCompaiaController
                                                            .text,
                                                        correo: _model
                                                            .destinoCorreoController
                                                            .text,
                                                        telefono: _model
                                                            .destinoTelefonoController
                                                            .text,
                                                        calleynumero: _model
                                                            .destinoCalleYumeroController
                                                            .text,
                                                        colonia: _model
                                                            .destinoColoniaValue,
                                                        ciudad: _model
                                                            .destinoCiudadController
                                                            .text,
                                                        codigopostal: _model
                                                            .destinoCodigoPostalController
                                                            .text,
                                                        pais: _model
                                                            .destinoColoniaValue,
                                                        estado: _model
                                                            .destinoEstadoController
                                                            .text,
                                                        referencia: _model
                                                            .destinoReferenciaController
                                                            .text,
                                                      ),
                                                      'filtros':
                                                          rowConfiguracionLocalRecord!
                                                              .administradoresUuid,
                                                    });
                                                  }
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');

                                                  context.pushNamed(
                                                    'dimensionesPage',
                                                    queryParameters: {
                                                      'currentShip':
                                                          serializeParam(
                                                        _model.currentShip,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'currentShip':
                                                          _model.currentShip,
                                                    },
                                                  );

                                                  setState(() {});
                                                },
                                                text: 'Siguiente',
                                                options: FFButtonOptions(
                                                  width: 300.0,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (responsiveVisibility(
                                context: context,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'CREAR_ENVIO_Icon_i4riht4z_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Icon_drawer');
                                                  scaffoldKey.currentState!
                                                      .openDrawer();
                                                },
                                                child: Icon(
                                                  Icons.menu,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    rowConfiguracionLocalRecord!
                                                        .logo,
                                                    width: 150.0,
                                                    height: 75.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'CREAR_ENVIO_Icon_m4viq1ur_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isDismissible: false,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => FocusScope
                                                                    .of(context)
                                                                .requestFocus(_model
                                                                    .unfocusNode),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  DatosPagosMobileWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      formatNumber(
                                                        valueOrDefault(
                                                            currentUserDocument
                                                                ?.saldo,
                                                            0.0),
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                        currency: '\$ ',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 15.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 10.0),
                                                child: Text(
                                                  'Crear envio',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 5.0, 16.0, 5.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CREAR_ENVIO_listContainer_ON_TAP');
                                                    logFirebaseEvent(
                                                        'listContainer_navigate_to');

                                                    context.pushNamed(
                                                        'origenMobile');
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 570.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Remitente',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  if (!FFAppState()
                                                                      .origenAgregado)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FaIcon(
                                                                            FontAwesomeIcons.addressBook,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Seleccionar/Ingresar Origen',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .origenAgregado)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.person,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    FFAppState().origen.name,
                                                                                    'Sin Informacion',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.addressBook,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      FFAppState().origen.street,
                                                                                      'Sin Informacion',
                                                                                    )}, ${valueOrDefault<String>(
                                                                                      FFAppState().origen.neighborhood,
                                                                                      'Sin Informacion',
                                                                                    )}, ${valueOrDefault<String>(
                                                                                      FFAppState().origen.city,
                                                                                      'Sin Informacion',
                                                                                    )}, ${valueOrDefault<String>(
                                                                                      FFAppState().origen.state,
                                                                                      'Sin Informacion',
                                                                                    )}, ${valueOrDefault<String>(
                                                                                      FFAppState().origen.postalCode,
                                                                                      'Sin Informacion',
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.chevron_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 35.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 5.0, 16.0, 5.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CREAR_ENVIO_listContainer_ON_TAP');
                                                    logFirebaseEvent(
                                                        'listContainer_navigate_to');

                                                    context.pushNamed(
                                                        'destinoMobile');
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 570.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Destinatario',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  if (!FFAppState()
                                                                      .destinoAgregado)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FaIcon(
                                                                            FontAwesomeIcons.addressBook,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Seleccionar/Ingresar Destino',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .destinoAgregado)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.person,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  FFAppState().destino.name,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.addressBook,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      FFAppState().destino.street,
                                                                                      'Sin Informacion',
                                                                                    )}, ${valueOrDefault<String>(
                                                                                      FFAppState().destino.neighborhood,
                                                                                      'Sin Informacion',
                                                                                    )}, ${valueOrDefault<String>(
                                                                                      FFAppState().destino.city,
                                                                                      'Sin Informacion',
                                                                                    )}, ${valueOrDefault<String>(
                                                                                      FFAppState().destino.state,
                                                                                      'Sin Informacion',
                                                                                    )}, ${valueOrDefault<String>(
                                                                                      FFAppState().destino.postalCode,
                                                                                      'Sin Informacion',
                                                                                    )}',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.chevron_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 35.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 5.0, 16.0, 5.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CREAR_ENVIO_listContainer_ON_TAP');
                                                    logFirebaseEvent(
                                                        'listContainer_navigate_to');

                                                    context.pushNamed(
                                                        'pesoMobile');
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 570.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Paquete',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  if (!FFAppState()
                                                                      .destinoAgregado)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          FaIcon(
                                                                            FontAwesomeIcons.addressBook,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Seleccionar/Ingresar Paquete',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                      .destinoAgregado)
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.expand_sharp,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '${valueOrDefault<String>(
                                                                                    FFAppState().paquete.length.toString(),
                                                                                    'Sin informacion',
                                                                                  )}cm X ${valueOrDefault<String>(
                                                                                    FFAppState().paquete.width.toString(),
                                                                                    'Sin informacion',
                                                                                  )}cm X ${valueOrDefault<String>(
                                                                                    FFAppState().paquete.height.toString(),
                                                                                    'Sin informacion',
                                                                                  )}cm',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FaIcon(
                                                                                FontAwesomeIcons.weightHanging,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      FFAppState().paquete.weight.toString(),
                                                                                      'Sin Informacion',
                                                                                    )} Kg.',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              5.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.content_paste_search_outlined,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      FFAppState().paquete.contents,
                                                                                      'Sin Informacion',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.chevron_right,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 35.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (FFAppState().origenAgregado &&
                                                  FFAppState()
                                                      .destinoAgregado &&
                                                  FFAppState().paqueteAgregado)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 20.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'CREAR_ENVIO_ButtonnextMobile_ON_TAP');
                                                          logFirebaseEvent(
                                                              'ButtonnextMobile_backend_call');

                                                          var enviosRecordReference =
                                                              EnviosRecord
                                                                  .collection
                                                                  .doc();
                                                          await enviosRecordReference
                                                              .set({
                                                            ...createEnviosRecordData(
                                                              origen:
                                                                  updateOriginAttributesStruct(
                                                                FFAppState()
                                                                    .origen,
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              destino:
                                                                  updateDestinationAttributesStruct(
                                                                FFAppState()
                                                                    .destino,
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              status: 'pending',
                                                              userId:
                                                                  currentUserUid,
                                                              step: 'tarifa',
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              plataforma: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.plataforma,
                                                                  ''),
                                                              paquete:
                                                                  updateParcelStruct(
                                                                FFAppState()
                                                                    .paquete,
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              cantidad: 1,
                                                            ),
                                                            'filtros':
                                                                rowConfiguracionLocalRecord!
                                                                    .administradoresUuid,
                                                          });
                                                          _model.currentShipMObile =
                                                              EnviosRecord
                                                                  .getDocumentFromData({
                                                            ...createEnviosRecordData(
                                                              origen:
                                                                  updateOriginAttributesStruct(
                                                                FFAppState()
                                                                    .origen,
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              destino:
                                                                  updateDestinationAttributesStruct(
                                                                FFAppState()
                                                                    .destino,
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              status: 'pending',
                                                              userId:
                                                                  currentUserUid,
                                                              step: 'tarifa',
                                                              createdAt:
                                                                  getCurrentTimestamp,
                                                              plataforma: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.plataforma,
                                                                  ''),
                                                              paquete:
                                                                  updateParcelStruct(
                                                                FFAppState()
                                                                    .paquete,
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              cantidad: 1,
                                                            ),
                                                            'filtros':
                                                                rowConfiguracionLocalRecord!
                                                                    .administradoresUuid,
                                                          }, enviosRecordReference);
                                                          logFirebaseEvent(
                                                              'ButtonnextMobile_update_app_state');
                                                          setState(() {
                                                            FFAppState()
                                                                .deleteOrigen();
                                                            FFAppState()
                                                                    .origen =
                                                                OriginAttributesStruct();

                                                            FFAppState()
                                                                .deleteDestino();
                                                            FFAppState()
                                                                    .destino =
                                                                DestinationAttributesStruct();

                                                            FFAppState()
                                                                .deletePaquete();
                                                            FFAppState()
                                                                    .paquete =
                                                                ParcelStruct();

                                                            FFAppState()
                                                                    .origenAgregado =
                                                                false;
                                                            FFAppState()
                                                                    .destinoAgregado =
                                                                false;
                                                            FFAppState()
                                                                    .paqueteAgregado =
                                                                false;
                                                          });
                                                          logFirebaseEvent(
                                                              'ButtonnextMobile_navigate_to');

                                                          context.pushNamed(
                                                            'tarifaPage',
                                                            queryParameters: {
                                                              'currentship':
                                                                  serializeParam(
                                                                _model
                                                                    .currentShipMObile,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'currentship': _model
                                                                  .currentShipMObile,
                                                            },
                                                          );

                                                          setState(() {});
                                                        },
                                                        text: 'Siguiente',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 300.0,
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
