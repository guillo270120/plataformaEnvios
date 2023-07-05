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
import 'destino_mobile_model.dart';
export 'destino_mobile_model.dart';

class DestinoMobileWidget extends StatefulWidget {
  const DestinoMobileWidget({Key? key}) : super(key: key);

  @override
  _DestinoMobileWidgetState createState() => _DestinoMobileWidgetState();
}

class _DestinoMobileWidgetState extends State<DestinoMobileWidget> {
  late DestinoMobileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DestinoMobileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'destinoMobile'});
    _model.origenNombreController ??= TextEditingController();
    _model.origenEmailController ??= TextEditingController();
    _model.origenTelefonoController ??= TextEditingController();
    _model.origenCompaiaController ??= TextEditingController();
    _model.origenCalleYNumeroController ??= TextEditingController();
    _model.origenCodigoPostalController ??= TextEditingController();
    _model.origenCiudadController ??= TextEditingController();
    _model.origenEstadoController ??= TextEditingController();
    _model.origenRefernciaController ??= TextEditingController();
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
        List<DireccionesRecord> destinoMobileDireccionesRecordList =
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
                                      'DESTINO_MOBILE_PAGE_Icon_8bgnqykn_ON_TAP');
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
                                  'DESTINO_MOBILE_CREAR_ENVIO_BTN_ON_TAP');
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
                                                      'DESTINO_MOBILE_PAGE_Row_gw8gqiio_ON_TAP');
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
                                                      'DESTINO_MOBILE_PAGE_Row_xf38fh0c_ON_TAP');
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
                                                      'DESTINO_MOBILE_PAGE_Row_3z3yfxzr_ON_TAP');
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
                                                      'DESTINO_MOBILE_PAGE_Row_1agbalfk_ON_TAP');
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
                                                            'DESTINO_MOBILE_PAGE_Row_crwqq3mj_ON_TAP');
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
                                                            'DESTINO_MOBILE_PAGE_Row_ekh9ja60_ON_TAP');
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
                                                            'DESTINO_MOBILE_PAGE_Row_fs29gdv1_ON_TAP');
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
                                                              'DESTINO_MOBILE_PAGE_Row_d6fkbier_ON_TAP');
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
                                    'DESTINO_MOBILE_PAGE_Row_pigorrh8_ON_TAP');
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
                        columnConfiguracionLocalRecordList = snapshot.data!;
                    final columnConfiguracionLocalRecord =
                        columnConfiguracionLocalRecordList.isNotEmpty
                            ? columnConfiguracionLocalRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'DESTINO_MOBILE_PAGE_Icon_al30vftq_ON_TAP');
                                    logFirebaseEvent('Icon_drawer');
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 30.0,
                                  ),
                                ),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      columnConfiguracionLocalRecord!.logo,
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
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DESTINO_MOBILE_PAGE_Icon_7iyvndib_ON_TAP');
                                        logFirebaseEvent('Icon_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: DatosPagosMobileWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 30.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Text(
                                        formatNumber(
                                          valueOrDefault(
                                              currentUserDocument?.saldo, 0.0),
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: '\$ ',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 15.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Remitente',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  'Quien envia el paquete',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Remitentes guardados',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Text(
                                        'Borrar',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(null),
                                  options: destinoMobileDireccionesRecordList
                                      .map((e) => e.alias)
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(() => _model.dropDownValue = val);
                                    logFirebaseEvent(
                                        'DESTINO_MOBILE_DropDown_1dq8ont8_ON_FORM');
                                    logFirebaseEvent(
                                        'DropDown_firestore_query');
                                    _model.origenCopy =
                                        await queryDireccionesRecordOnce(
                                      queryBuilder: (direccionesRecord) =>
                                          direccionesRecord.where('alias',
                                              isEqualTo: _model.dropDownValue),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    logFirebaseEvent('DropDown_backend_call');
                                    _model.origenResponseCPCopy =
                                        await ConsultaCPCall.call(
                                      cp: _model.origenCopy!.codigopostal,
                                    );
                                    logFirebaseEvent(
                                        'DropDown_update_app_state');
                                    setState(() {
                                      FFAppState().coloniasOrigen =
                                          (ConsultaCPCall.colonias(
                                        (_model.origenResponseCPCopy
                                                ?.jsonBody ??
                                            ''),
                                      ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()!
                                              .toList()
                                              .cast<String>();
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenNombreController?.text =
                                          _model.origenCopy!.nombre;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenEmailController?.text =
                                          _model.origenCopy!.correo;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenTelefonoController?.text =
                                          _model.origenCopy!.telefono;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenCompaiaController?.text =
                                          _model.origenCopy!.empresa;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenCalleYNumeroController
                                              ?.text =
                                          _model.origenCopy!.calleynumero;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenCodigoPostalController
                                              ?.text =
                                          _model.origenCopy!.codigopostal;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenColoniaValueController
                                          ?.value = _model.origenCopy!.colonia;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenPaisValueController?.value =
                                          _model.origenCopy!.pais;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenEstadoController?.text =
                                          _model.origenCopy!.estado;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenCiudadController?.text =
                                          _model.origenCopy!.ciudad;
                                    });
                                    logFirebaseEvent('DropDown_set_form_field');
                                    setState(() {
                                      _model.origenRefernciaController?.text =
                                          _model.origenCopy!.referencia;
                                    });

                                    setState(() {});
                                  },
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Seleccionar Direccion',
                                  searchHintText: 'Buscar Direccion',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: true,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'Datos personales',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.origenNombreController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Nombre  Completo',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenNombreControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.origenEmailController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Correo Electronico',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenEmailControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.origenTelefonoController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Telefono',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenTelefonoControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.origenCompaiaController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Compañia',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenCompaiaControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'Direccion',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .origenCalleYNumeroController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Calle y numero',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenCalleYNumeroControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .origenCodigoPostalController,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.origenCodigoPostalController',
                                              Duration(milliseconds: 1000),
                                              () async {
                                                logFirebaseEvent(
                                                    'DESTINO_MOBILE_OrigenCodigoPostal_ON_TEX');
                                                logFirebaseEvent(
                                                    'OrigenCodigoPostal_backend_call');
                                                _model.cpResponse =
                                                    await ConsultaCPCall.call(
                                                  cp: _model
                                                      .origenCodigoPostalController
                                                      .text,
                                                );
                                                logFirebaseEvent(
                                                    'OrigenCodigoPostal_set_form_field');
                                                setState(() {
                                                  _model.origenCiudadController
                                                          ?.text =
                                                      ConsultaCPCall.municipio(
                                                    (_model.cpResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString();
                                                });
                                                logFirebaseEvent(
                                                    'OrigenCodigoPostal_set_form_field');
                                                setState(() {
                                                  _model.origenEstadoController
                                                          ?.text =
                                                      ConsultaCPCall.estado(
                                                    (_model.cpResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString();
                                                });
                                                logFirebaseEvent(
                                                    'OrigenCodigoPostal_update_app_state');
                                                setState(() {
                                                  FFAppState().coloniasOrigen =
                                                      (ConsultaCPCall.colonias(
                                                    (_model.cpResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList()
                                                          .cast<String>();
                                                });

                                                setState(() {});
                                              },
                                            ),
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Codigo Postal ',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenCodigoPostalControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              _model.origenCodigoPostalMask
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .origenColoniaValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options:
                                                FFAppState().coloniasOrigen,
                                            onChanged: (val) => setState(() =>
                                                _model.origenColoniaValue =
                                                    val),
                                            width: 300.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 12.0,
                                                    ),
                                            hintText: 'Seleccionar Colonia',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.origenCiudadController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Ciudad',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenCiudadControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.origenEstadoController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Estado ',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenEstadoControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .origenPaisValueController ??=
                                                FormFieldController<String>(
                                              _model.origenPaisValue ??=
                                                  'Mexico',
                                            ),
                                            options: ['Mexico'],
                                            onChanged: (val) => setState(() =>
                                                _model.origenPaisValue = val),
                                            width: 300.0,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 12.0,
                                                    ),
                                            hintText: 'Please select...',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isSearchable: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .origenRefernciaController,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Referencia',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 12.0,
                                                ),
                                            validator: _model
                                                .origenRefernciaControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 20.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.guardarOrigenValue ??=
                                              false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.guardarOrigenValue =
                                                    newValue!);
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Text(
                                        'Guardar Remitente',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'DESTINO_MOBILE_PAGE_GUARDAR_BTN_ON_TAP');
                                  logFirebaseEvent('Button_validate_form');
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.guardarOrigenValue!) {
                                    logFirebaseEvent('Button_backend_call');

                                    await DireccionesRecord.collection
                                        .doc()
                                        .set({
                                      ...createDireccionesRecordData(
                                        userId: currentUserUid,
                                        alias:
                                            _model.origenNombreController.text,
                                        nombre:
                                            _model.origenNombreController.text,
                                        empresa:
                                            _model.origenCompaiaController.text,
                                        correo:
                                            _model.origenEmailController.text,
                                        telefono: _model
                                            .origenTelefonoController.text,
                                        calleynumero: _model
                                            .origenCalleYNumeroController.text,
                                        colonia: _model.origenColoniaValue,
                                        ciudad:
                                            _model.origenCiudadController.text,
                                        codigopostal: _model
                                            .origenCodigoPostalController.text,
                                        pais: _model.origenPaisValue,
                                        estado:
                                            _model.origenEstadoController.text,
                                        referencia: _model
                                            .origenRefernciaController.text,
                                        plataforma: valueOrDefault(
                                            currentUserDocument?.plataforma,
                                            ''),
                                      ),
                                      'filtros': columnConfiguracionLocalRecord!
                                          .administradoresUuid,
                                    });
                                    logFirebaseEvent('Button_update_app_state');
                                    setState(() {
                                      FFAppState().updateDestinoStruct(
                                        (e) => e
                                          ..name =
                                              _model.origenNombreController.text
                                          ..company = _model
                                              .origenCompaiaController.text
                                          ..street = _model
                                              .origenCalleYNumeroController.text
                                          ..city =
                                              _model.origenCiudadController.text
                                          ..state =
                                              _model.origenEstadoController.text
                                          ..neighborhood =
                                              _model.origenColoniaValue
                                          ..postalCode = _model
                                              .origenCodigoPostalController.text
                                          ..email =
                                              _model.origenEmailController.text
                                          ..phone = _model
                                              .origenTelefonoController.text
                                          ..reference1 = _model
                                              .origenRefernciaController.text,
                                      );
                                      FFAppState().destinoAgregado = true;
                                    });
                                    logFirebaseEvent('Button_navigate_back');
                                    context.safePop();
                                  } else {
                                    logFirebaseEvent('Button_update_app_state');
                                    setState(() {
                                      FFAppState().updateDestinoStruct(
                                        (e) => e
                                          ..name =
                                              _model.origenNombreController.text
                                          ..company = _model
                                              .origenCompaiaController.text
                                          ..street = _model
                                              .origenCalleYNumeroController.text
                                          ..city =
                                              _model.origenCiudadController.text
                                          ..state =
                                              _model.origenEstadoController.text
                                          ..neighborhood =
                                              _model.origenColoniaValue
                                          ..postalCode = _model
                                              .origenCodigoPostalController.text
                                          ..email =
                                              _model.origenEmailController.text
                                          ..phone = _model
                                              .origenTelefonoController.text
                                          ..reference1 = _model
                                              .origenRefernciaController.text,
                                      );
                                      FFAppState().destinoAgregado = true;
                                    });
                                    logFirebaseEvent('Button_navigate_back');
                                    context.safePop();
                                    return;
                                  }
                                },
                                text: 'Guardar',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
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
