import '/alert_confirmaciones/loader_generar_guia/loader_generar_guia_widget.dart';
import '/alert_confirmaciones/loader_generar_guia_mobile/loader_generar_guia_mobile_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/datos_pagos_mobile_widget.dart';
import '/components/header_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tarifa_page_model.dart';
export 'tarifa_page_model.dart';

class TarifaPageWidget extends StatefulWidget {
  const TarifaPageWidget({
    Key? key,
    required this.currentship,
  }) : super(key: key);

  final EnviosRecord? currentship;

  @override
  _TarifaPageWidgetState createState() => _TarifaPageWidgetState();
}

class _TarifaPageWidgetState extends State<TarifaPageWidget> {
  late TarifaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TarifaPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'tarifaPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TARIFA_tarifaPage_ON_INIT_STATE');
      logFirebaseEvent('tarifaPage_update_app_state');
      setState(() {
        FFAppState().pagina = 'Seleccionar Tarifa';
      });
    });

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
                                  'TARIFA_PAGE_PAGE_Icon_qtvnjjvp_ON_TAP');
                              logFirebaseEvent('Icon_drawer');
                              if (scaffoldKey.currentState!.isDrawerOpen ||
                                  scaffoldKey.currentState!.isEndDrawerOpen) {
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
                              'TARIFA_PAGE_PAGE_CREAR_ENVIO_BTN_ON_TAP');
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
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Envios',
                                            style: FlutterFlowTheme.of(context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Cotiizar',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                              Icon(
                                                Icons.chevron_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TARIFA_PAGE_PAGE_Row_rxnc5smq_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                  'historialDeEnviosPage');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Historial de envios',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
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
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TARIFA_PAGE_PAGE_Row_x7j2oljo_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed(
                                                  'historialOrdenesPage');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Historial de ordenes',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
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
                                        ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Configuraciones',
                                            style: FlutterFlowTheme.of(context)
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TARIFA_PAGE_PAGE_Row_sahgo8yb_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context
                                                  .pushNamed('direccionesPage');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Direcciones',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
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
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TARIFA_PAGE_PAGE_Row_cusp57cm_ON_TAP');
                                              logFirebaseEvent(
                                                  'Row_navigate_to');

                                              context.pushNamed('paquetesPage');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Paquetes',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
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
                                        ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((valueOrDefault(currentUserDocument?.rol, '') ==
                                    'super') ||
                                (valueOrDefault(currentUserDocument?.rol, '') ==
                                    'main') ||
                                (valueOrDefault(currentUserDocument?.rol, '') ==
                                    'admin'))
                              Expanded(
                                child: FutureBuilder<int>(
                                  future: queryUsersRecordCount(
                                    queryBuilder: (usersRecord) => usersRecord
                                        .where('filtros',
                                            arrayContains: currentUserUid)
                                        .where('status', isEqualTo: false),
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
                                                  'Administracion',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
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
                                                            color: Colors.white,
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
                                                            .fromSTEB(8.0, 8.0,
                                                                8.0, 8.0),
                                                    position: badges
                                                        .BadgePosition.topEnd(),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
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
                                                        'TARIFA_PAGE_PAGE_Row_t2q2ztne_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Row_navigate_to');

                                                    context
                                                        .pushNamed('carriers');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'Carriers',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                        'TARIFA_PAGE_PAGE_Row_dqgk77kz_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Row_navigate_to');

                                                    context.pushNamed('users');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'Usuarios',
                                                          textAlign:
                                                              TextAlign.start,
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
                                                            animationType: badges
                                                                .BadgeAnimationType
                                                                .scale,
                                                            toAnimate: true,
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
                                                        'TARIFA_PAGE_PAGE_Row_bvjavlwm_ON_TAP');
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
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
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
                                                          'TARIFA_PAGE_PAGE_Row_kebs5gah_ON_TAP');
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
                                                                TextAlign.start,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'TARIFA_PAGE_PAGE_Row_45ul30zz_ON_TAP');
                            logFirebaseEvent('Row_auth');
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth('loginPage', context.mounted);
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
            builder: (context) => StreamBuilder<List<ConfiguracionLocalRecord>>(
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
                List<ConfiguracionLocalRecord> rowConfiguracionLocalRecordList =
                    snapshot.data!;
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 0.0),
                              child: StreamBuilder<EnviosRecord>(
                                stream: EnviosRecord.getDocument(
                                    widget.currentship!.reference),
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
                                  final cardEnviosRecord = snapshot.data!;
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 10.0),
                                      child: StreamBuilder<
                                          List<ConfiguracionRecord>>(
                                        stream: queryConfiguracionRecord(
                                          queryBuilder: (configuracionRecord) =>
                                              configuracionRecord.where('uuid',
                                                  isEqualTo: '0'),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Color(0xFFED3237),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ConfiguracionRecord>
                                              containerConfiguracionRecordList =
                                              snapshot.data!;
                                          final containerConfiguracionRecord =
                                              containerConfiguracionRecordList
                                                      .isNotEmpty
                                                  ? containerConfiguracionRecordList
                                                      .first
                                                  : null;
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Paquetería',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Servicio',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Entrega Estimada\t',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Precio',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                StreamBuilder<
                                                    List<CarriersRecord>>(
                                                  stream: queryCarriersRecord(
                                                    queryBuilder: (carriersRecord) =>
                                                        carriersRecord
                                                            .where('status',
                                                                isEqualTo: true)
                                                            .where('plataforma',
                                                                isEqualTo: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.plataforma,
                                                                    '')),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Color(
                                                                0xFFED3237),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CarriersRecord>
                                                        listViewCarriersRecordList =
                                                        snapshot.data!;
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewCarriersRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewCarriersRecord =
                                                            listViewCarriersRecordList[
                                                                listViewIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PreciosRecord>>(
                                                            stream:
                                                                queryPreciosRecord(
                                                              queryBuilder: (preciosRecord) => preciosRecord
                                                                  .where(
                                                                      'carrierUuid',
                                                                      isEqualTo:
                                                                          listViewCarriersRecord
                                                                              .uuidCarrier)
                                                                  .where('lista',
                                                                      isEqualTo: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.precio,
                                                                          ''))
                                                                  .where(
                                                                      'pesoMin',
                                                                      isLessThanOrEqualTo: cardEnviosRecord
                                                                          .paquete
                                                                          .weight)
                                                                  .where(
                                                                      'plataforma',
                                                                      isEqualTo: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.plataforma,
                                                                          ''))
                                                                  .orderBy(
                                                                      'pesoMin',
                                                                      descending:
                                                                          true),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: Color(
                                                                          0xFFED3237),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<PreciosRecord>
                                                                  rowPreciosRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final rowPreciosRecord =
                                                                  rowPreciosRecordList
                                                                          .isNotEmpty
                                                                      ? rowPreciosRecordList
                                                                          .first
                                                                      : null;
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            listViewCarriersRecord.imagen,
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      listViewCarriersRecord
                                                                          .servicio,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'd/M/y',
                                                                          DateTime.fromMillisecondsSinceEpoch((listViewCarriersRecord.eta * 86400000) +
                                                                              getCurrentTimestamp.millisecondsSinceEpoch)),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
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
                                                                          formatNumber(
                                                                            rowPreciosRecord!.precio,
                                                                            formatType:
                                                                                FormatType.decimal,
                                                                            decimalType:
                                                                                DecimalType.automatic,
                                                                            currency:
                                                                                '\$ ',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 18.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('TARIFA_PAGE_PAGE_COMPRAR_BTN_ON_TAP');
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (rowConfiguracionLocalRecord!.transacciones <
                                                                                1) {
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            if (rowConfiguracionLocalRecord!.saldoPlataforma >
                                                                                rowPreciosRecord!.precio) {
                                                                              if (valueOrDefault(currentUserDocument?.saldo, 0.0) >= rowPreciosRecord!.precio) {
                                                                                logFirebaseEvent('Button_alert_dialog');
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Generar Guia'),
                                                                                          content: Text('Al hacer click en \"confirmar\" usted acepta generar la guia de envio y descontar de su saldo el valor de la misma¿Confirma generar la guia de envio ${listViewCarriersRecord.nombreCarrier}?'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('Cancelar'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('Confirmar'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (confirmDialogResponse) {
                                                                                  logFirebaseEvent('Button_bottom_sheet');
                                                                                  showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    isDismissible: false,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: LoaderGenerarGuiaWidget(),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                } else {
                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                              } else {
                                                                                logFirebaseEvent('Button_alert_dialog');
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: Text('Error'),
                                                                                      content: Text('No cuentas con el saldo necesario para realizar este envio.'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                            } else {
                                                                              logFirebaseEvent('Button_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Error'),
                                                                                    content: Text('El sistema no se encuentra disponible'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            logFirebaseEvent('Button_backend_call');
                                                                            _model.loginResponse =
                                                                                await GenerarGuiaGroup.loginCall.call(
                                                                              email: containerConfiguracionRecord!.userPlataforma,
                                                                              password: containerConfiguracionRecord!.passwordPlataforma,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (GenerarGuiaGroup.loginCall
                                                                                        .token(
                                                                                          (_model.loginResponse?.jsonBody ?? ''),
                                                                                        )
                                                                                        .toString() !=
                                                                                    null &&
                                                                                GenerarGuiaGroup.loginCall
                                                                                        .token(
                                                                                          (_model.loginResponse?.jsonBody ?? ''),
                                                                                        )
                                                                                        .toString() !=
                                                                                    '') {
                                                                              logFirebaseEvent('Button_backend_call');
                                                                              _model.shipmentresponse = await GenerarGuiaGroup.shipmentsCall.call(
                                                                                token: GenerarGuiaGroup.loginCall
                                                                                    .token(
                                                                                      (_model.loginResponse?.jsonBody ?? ''),
                                                                                    )
                                                                                    .toString(),
                                                                                email: containerConfiguracionRecord!.userPlataforma,
                                                                                opostalCode: cardEnviosRecord.origen.postalCode,
                                                                                oname: cardEnviosRecord.origen.name,
                                                                                ocompany: cardEnviosRecord.origen.company,
                                                                                ophone: cardEnviosRecord.origen.phone,
                                                                                ocallingCode: '52',
                                                                                ocountryId: 248,
                                                                                ostate: cardEnviosRecord.origen.state,
                                                                                ostreet: cardEnviosRecord.origen.street,
                                                                                oneighborhood: cardEnviosRecord.origen.neighborhood,
                                                                                ocity: cardEnviosRecord.origen.city,
                                                                                oreference: cardEnviosRecord.origen.reference1,
                                                                                dpostalCode: cardEnviosRecord.destino.postalCode,
                                                                                dname: cardEnviosRecord.destino.name,
                                                                                dcompany: cardEnviosRecord.destino.company,
                                                                                dcountryId: 248,
                                                                                dstate: cardEnviosRecord.destino.state,
                                                                                dstreet: cardEnviosRecord.destino.street,
                                                                                dneighborhood: cardEnviosRecord.destino.neighborhood,
                                                                                dcity: cardEnviosRecord.destino.city,
                                                                                dreference: cardEnviosRecord.destino.reference1,
                                                                                dphone: cardEnviosRecord.destino.phone,
                                                                                dcallingCode: '52',
                                                                              );
                                                                              _shouldSetState = true;
                                                                              if (GenerarGuiaGroup.shipmentsCall.id(
                                                                                    (_model.shipmentresponse?.jsonBody ?? ''),
                                                                                  ) !=
                                                                                  null) {
                                                                                logFirebaseEvent('Button_backend_call');
                                                                                _model.parcelResponse = await GenerarGuiaGroup.parcelCall.call(
                                                                                  token: GenerarGuiaGroup.loginCall
                                                                                      .token(
                                                                                        (_model.loginResponse?.jsonBody ?? ''),
                                                                                      )
                                                                                      .toString(),
                                                                                  email: containerConfiguracionRecord!.userPlataforma,
                                                                                  shipId: GenerarGuiaGroup.shipmentsCall.id(
                                                                                    (_model.shipmentresponse?.jsonBody ?? ''),
                                                                                  ),
                                                                                  weight: cardEnviosRecord.paquete.weight.toString(),
                                                                                  length: cardEnviosRecord.paquete.length.toString(),
                                                                                  height: cardEnviosRecord.paquete.height.toString(),
                                                                                  width: cardEnviosRecord.paquete.width.toString(),
                                                                                  contents: cardEnviosRecord.paquete.contents,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                if (GenerarGuiaGroup.parcelCall.shipmentid(
                                                                                      (_model.parcelResponse?.jsonBody ?? ''),
                                                                                    ) !=
                                                                                    null) {
                                                                                  logFirebaseEvent('Button_backend_call');
                                                                                  _model.confirmRateresponse = await GenerarGuiaGroup.confirmarTarifaCall.call(
                                                                                    token: GenerarGuiaGroup.loginCall
                                                                                        .token(
                                                                                          (_model.loginResponse?.jsonBody ?? ''),
                                                                                        )
                                                                                        .toString(),
                                                                                    email: containerConfiguracionRecord!.userPlataforma,
                                                                                    shipId: GenerarGuiaGroup.parcelCall.shipmentid(
                                                                                      (_model.parcelResponse?.jsonBody ?? ''),
                                                                                    ),
                                                                                    serviceId: listViewCarriersRecord.idPlataforma,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  if ((_model.confirmRateresponse?.succeeded ?? true)) {
                                                                                    logFirebaseEvent('Button_backend_call');

                                                                                    await cardEnviosRecord.reference.update(createEnviosRecordData(
                                                                                      labelUrl: GenerarGuiaGroup.confirmarTarifaCall
                                                                                          .labelurl(
                                                                                            (_model.confirmRateresponse?.jsonBody ?? ''),
                                                                                          )
                                                                                          .toString(),
                                                                                      shipId: GenerarGuiaGroup.confirmarTarifaCall.shipId(
                                                                                        (_model.confirmRateresponse?.jsonBody ?? ''),
                                                                                      ),
                                                                                      status: 'completed',
                                                                                      precio: rowPreciosRecord!.precio,
                                                                                    ));
                                                                                    logFirebaseEvent('Button_backend_call');

                                                                                    await currentUserReference!.update(createUsersRecordData(
                                                                                      saldo: valueOrDefault(currentUserDocument?.saldo, 0.0) - rowPreciosRecord!.precio,
                                                                                    ));
                                                                                    logFirebaseEvent('Button_backend_call');

                                                                                    await rowConfiguracionLocalRecord!.reference.update({
                                                                                      ...createConfiguracionLocalRecordData(
                                                                                        saldoPlataforma: rowConfiguracionLocalRecord!.saldoPlataforma - rowPreciosRecord!.precio,
                                                                                      ),
                                                                                      'transacciones': FieldValue.increment(-(1)),
                                                                                    });
                                                                                    logFirebaseEvent('Button_backend_call');

                                                                                    await TransaccionesRecord.collection.doc().set({
                                                                                      ...createTransaccionesRecordData(
                                                                                        tipo: 'compra',
                                                                                        cantidad: rowPreciosRecord!.precio,
                                                                                        plataforma: valueOrDefault(currentUserDocument?.plataforma, ''),
                                                                                        status: 'completed',
                                                                                        user: currentUserReference,
                                                                                        userId: currentUserUid,
                                                                                        createdAt: getCurrentTimestamp,
                                                                                        userRef: currentUserReference,
                                                                                      ),
                                                                                      'filtros': rowConfiguracionLocalRecord!.administradoresUuid,
                                                                                    });
                                                                                  } else {
                                                                                    logFirebaseEvent('Button_alert_dialog');
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('Error'),
                                                                                          content: Text('Algo salio mal (code:15)'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    logFirebaseEvent('Button_bottom_sheet');
                                                                                    Navigator.pop(context);
                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }

                                                                                  logFirebaseEvent('Button_wait__delay');
                                                                                  await Future.delayed(const Duration(milliseconds: 4000));
                                                                                } else {
                                                                                  logFirebaseEvent('Button_alert_dialog');
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Error'),
                                                                                        content: Text('Algo salio mal'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  logFirebaseEvent('Button_bottom_sheet');
                                                                                  Navigator.pop(context);
                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }

                                                                                logFirebaseEvent('Button_bottom_sheet');
                                                                                Navigator.pop(context);
                                                                              } else {
                                                                                logFirebaseEvent('Button_alert_dialog');
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: Text('Error'),
                                                                                      content: Text('Algo salio mal'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                logFirebaseEvent('Button_bottom_sheet');
                                                                                Navigator.pop(context);
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                            } else {
                                                                              logFirebaseEvent('Button_alert_dialog');
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Error'),
                                                                                    content: Text('Algo salio mal'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              logFirebaseEvent('Button_bottom_sheet');
                                                                              Navigator.pop(context);
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            logFirebaseEvent('Button_navigate_to');

                                                                            context.pushNamed(
                                                                              'generarGuia',
                                                                              queryParameters: {
                                                                                'envioReference': serializeParam(
                                                                                  widget.currentship!.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          text:
                                                                              'Comprar',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Expanded(
                              child: StreamBuilder<EnviosRecord>(
                                stream: EnviosRecord.getDocument(
                                    widget.currentship!.reference),
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
                                  final columnMobileEnviosRecord =
                                      snapshot.data!;
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
                                                      'TARIFA_PAGE_PAGE_Icon_wbri95an_ON_TAP');
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
                                                          'TARIFA_PAGE_PAGE_Icon_473wa6me_ON_TAP');
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
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: StreamBuilder<
                                              List<ConfiguracionRecord>>(
                                            stream: queryConfiguracionRecord(
                                              queryBuilder:
                                                  (configuracionRecord) =>
                                                      configuracionRecord.where(
                                                          'uuid',
                                                          isEqualTo: '0'),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Color(0xFFED3237),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ConfiguracionRecord>
                                                  columnConfiguracionRecordList =
                                                  snapshot.data!;
                                              final columnConfiguracionRecord =
                                                  columnConfiguracionRecordList
                                                          .isNotEmpty
                                                      ? columnConfiguracionRecordList
                                                          .first
                                                      : null;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Remitente',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    StreamBuilder<
                                                        List<CarriersRecord>>(
                                                      stream:
                                                          queryCarriersRecord(
                                                        queryBuilder: (carriersRecord) =>
                                                            carriersRecord
                                                                .where('status',
                                                                    isEqualTo:
                                                                        true)
                                                                .where(
                                                                    'plataforma',
                                                                    isEqualTo: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.plataforma,
                                                                        '')),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: Color(
                                                                    0xFFED3237),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<CarriersRecord>
                                                            listViewCarriersRecordList =
                                                            snapshot.data!;
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewCarriersRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewCarriersRecord =
                                                                listViewCarriersRecordList[
                                                                    listViewIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          5.0,
                                                                          16.0,
                                                                          5.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      PreciosRecord>>(
                                                                stream:
                                                                    queryPreciosRecord(
                                                                  queryBuilder: (preciosRecord) => preciosRecord
                                                                      .where(
                                                                          'carrierUuid',
                                                                          isEqualTo: listViewCarriersRecord
                                                                              .uuidCarrier)
                                                                      .where(
                                                                          'lista',
                                                                          isEqualTo: valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.precio,
                                                                              ''))
                                                                      .where(
                                                                          'pesoMin',
                                                                          isLessThanOrEqualTo: columnMobileEnviosRecord
                                                                              .paquete
                                                                              .weight)
                                                                      .where(
                                                                          'plataforma',
                                                                          isEqualTo: valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.plataforma,
                                                                              ''))
                                                                      .orderBy(
                                                                          'pesoMin',
                                                                          descending:
                                                                              true),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              Color(0xFFED3237),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<PreciosRecord>
                                                                      listContainerPreciosRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final listContainerPreciosRecord = listContainerPreciosRecordList
                                                                          .isNotEmpty
                                                                      ? listContainerPreciosRecordList
                                                                          .first
                                                                      : null;
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          570.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          12.0,
                                                                          16.0,
                                                                          12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      listViewCarriersRecord.imagen,
                                                                                      width: 100.0,
                                                                                      height: 50.0,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                  RichText(
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: 'Entrega Est.',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: dateTimeFormat('d/M/y', DateTime.fromMillisecondsSinceEpoch((listViewCarriersRecord.eta * 86400000) + getCurrentTimestamp.millisecondsSinceEpoch)),
                                                                                          style: TextStyle(),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  RichText(
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: 'Servicio: ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Readex Pro',
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: listViewCarriersRecord.servicio,
                                                                                          style: TextStyle(),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                  child: Text(
                                                                                    formatNumber(
                                                                                      listContainerPreciosRecord!.precio,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.automatic,
                                                                                      currency: '\$ ',
                                                                                    ),
                                                                                    textAlign: TextAlign.end,
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('TARIFA_PAGE_PAGE_COMPRAR_BTN_ON_TAP');
                                                                                    var _shouldSetState = false;
                                                                                    if (rowConfiguracionLocalRecord!.transacciones < 1) {
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    if (rowConfiguracionLocalRecord!.saldoPlataforma > listContainerPreciosRecord!.precio) {
                                                                                      if (valueOrDefault(currentUserDocument?.saldo, 0.0) >= listContainerPreciosRecord!.precio) {
                                                                                        logFirebaseEvent('Button_alert_dialog');
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: Text('Generar Guia'),
                                                                                                  content: Text('Al hacer click en \"confirmar\" usted acepta generar la guia de envio y descontar de su saldo el valor de la misma¿Confirma generar la guia de envio ${listViewCarriersRecord.nombreCarrier}?'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                      child: Text('Cancelar'),
                                                                                                    ),
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                      child: Text('Confirmar'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ) ??
                                                                                            false;
                                                                                        if (confirmDialogResponse) {
                                                                                          logFirebaseEvent('Button_bottom_sheet');
                                                                                          showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            isDismissible: false,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return GestureDetector(
                                                                                                onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                child: Padding(
                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                  child: LoaderGenerarGuiaMobileWidget(),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => setState(() {}));
                                                                                        } else {
                                                                                          if (_shouldSetState) setState(() {});
                                                                                          return;
                                                                                        }
                                                                                      } else {
                                                                                        logFirebaseEvent('Button_alert_dialog');
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('Error'),
                                                                                              content: Text('No cuentas con el saldo necesario para realizar este envio.'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                        if (_shouldSetState) setState(() {});
                                                                                        return;
                                                                                      }
                                                                                    } else {
                                                                                      logFirebaseEvent('Button_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('Error'),
                                                                                            content: Text('El sistema no se encuentra disponible'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    logFirebaseEvent('Button_backend_call');
                                                                                    _model.loginResponseCopy = await GenerarGuiaGroup.loginCall.call(
                                                                                      email: columnConfiguracionRecord!.userPlataforma,
                                                                                      password: columnConfiguracionRecord!.passwordPlataforma,
                                                                                    );
                                                                                    _shouldSetState = true;
                                                                                    if (GenerarGuiaGroup.loginCall
                                                                                                .token(
                                                                                                  (_model.loginResponse?.jsonBody ?? ''),
                                                                                                )
                                                                                                .toString() !=
                                                                                            null &&
                                                                                        GenerarGuiaGroup.loginCall
                                                                                                .token(
                                                                                                  (_model.loginResponse?.jsonBody ?? ''),
                                                                                                )
                                                                                                .toString() !=
                                                                                            '') {
                                                                                      logFirebaseEvent('Button_backend_call');
                                                                                      _model.shipmentresponseCopy = await GenerarGuiaGroup.shipmentsCall.call(
                                                                                        token: GenerarGuiaGroup.loginCall
                                                                                            .token(
                                                                                              (_model.loginResponse?.jsonBody ?? ''),
                                                                                            )
                                                                                            .toString(),
                                                                                        email: columnConfiguracionRecord!.userPlataforma,
                                                                                        opostalCode: columnMobileEnviosRecord.origen.postalCode,
                                                                                        oname: columnMobileEnviosRecord.origen.name,
                                                                                        ocompany: columnMobileEnviosRecord.origen.company,
                                                                                        ophone: columnMobileEnviosRecord.origen.phone,
                                                                                        ocallingCode: '52',
                                                                                        ocountryId: 248,
                                                                                        ostate: columnMobileEnviosRecord.origen.state,
                                                                                        ostreet: columnMobileEnviosRecord.origen.street,
                                                                                        oneighborhood: columnMobileEnviosRecord.origen.neighborhood,
                                                                                        ocity: columnMobileEnviosRecord.origen.city,
                                                                                        oreference: columnMobileEnviosRecord.origen.reference1,
                                                                                        dpostalCode: columnMobileEnviosRecord.destino.postalCode,
                                                                                        dname: columnMobileEnviosRecord.destino.name,
                                                                                        dcompany: columnMobileEnviosRecord.destino.company,
                                                                                        dcountryId: 248,
                                                                                        dstate: columnMobileEnviosRecord.destino.state,
                                                                                        dstreet: columnMobileEnviosRecord.destino.street,
                                                                                        dneighborhood: columnMobileEnviosRecord.destino.neighborhood,
                                                                                        dcity: columnMobileEnviosRecord.destino.city,
                                                                                        dreference: columnMobileEnviosRecord.destino.reference1,
                                                                                        dphone: columnMobileEnviosRecord.destino.phone,
                                                                                        dcallingCode: '52',
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if (GenerarGuiaGroup.shipmentsCall.id(
                                                                                            (_model.shipmentresponse?.jsonBody ?? ''),
                                                                                          ) !=
                                                                                          null) {
                                                                                        logFirebaseEvent('Button_backend_call');
                                                                                        _model.parcelResponseCopy = await GenerarGuiaGroup.parcelCall.call(
                                                                                          token: GenerarGuiaGroup.loginCall
                                                                                              .token(
                                                                                                (_model.loginResponse?.jsonBody ?? ''),
                                                                                              )
                                                                                              .toString(),
                                                                                          email: columnConfiguracionRecord!.userPlataforma,
                                                                                          shipId: GenerarGuiaGroup.shipmentsCall.id(
                                                                                            (_model.shipmentresponse?.jsonBody ?? ''),
                                                                                          ),
                                                                                          weight: columnMobileEnviosRecord.paquete.weight.toString(),
                                                                                          length: columnMobileEnviosRecord.paquete.length.toString(),
                                                                                          height: columnMobileEnviosRecord.paquete.height.toString(),
                                                                                          width: columnMobileEnviosRecord.paquete.width.toString(),
                                                                                          contents: columnMobileEnviosRecord.paquete.contents,
                                                                                        );
                                                                                        _shouldSetState = true;
                                                                                        if (GenerarGuiaGroup.parcelCall.shipmentid(
                                                                                              (_model.parcelResponse?.jsonBody ?? ''),
                                                                                            ) !=
                                                                                            null) {
                                                                                          logFirebaseEvent('Button_backend_call');
                                                                                          _model.confirmRateresponseCopy = await GenerarGuiaGroup.confirmarTarifaCall.call(
                                                                                            token: GenerarGuiaGroup.loginCall
                                                                                                .token(
                                                                                                  (_model.loginResponse?.jsonBody ?? ''),
                                                                                                )
                                                                                                .toString(),
                                                                                            email: columnConfiguracionRecord!.userPlataforma,
                                                                                            shipId: GenerarGuiaGroup.parcelCall.shipmentid(
                                                                                              (_model.parcelResponse?.jsonBody ?? ''),
                                                                                            ),
                                                                                            serviceId: listViewCarriersRecord.idPlataforma,
                                                                                          );
                                                                                          _shouldSetState = true;
                                                                                          if ((_model.confirmRateresponse?.succeeded ?? true)) {
                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                            await columnMobileEnviosRecord.reference.update(createEnviosRecordData(
                                                                                              labelUrl: GenerarGuiaGroup.confirmarTarifaCall
                                                                                                  .labelurl(
                                                                                                    (_model.confirmRateresponse?.jsonBody ?? ''),
                                                                                                  )
                                                                                                  .toString(),
                                                                                              shipId: GenerarGuiaGroup.confirmarTarifaCall.shipId(
                                                                                                (_model.confirmRateresponse?.jsonBody ?? ''),
                                                                                              ),
                                                                                              status: 'completed',
                                                                                              precio: listContainerPreciosRecord!.precio,
                                                                                            ));
                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                            await currentUserReference!.update(createUsersRecordData(
                                                                                              saldo: valueOrDefault(currentUserDocument?.saldo, 0.0) - listContainerPreciosRecord!.precio,
                                                                                            ));
                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                            await rowConfiguracionLocalRecord!.reference.update({
                                                                                              ...createConfiguracionLocalRecordData(
                                                                                                saldoPlataforma: rowConfiguracionLocalRecord!.saldoPlataforma - listContainerPreciosRecord!.precio,
                                                                                              ),
                                                                                              'transacciones': FieldValue.increment(-(1)),
                                                                                            });
                                                                                            logFirebaseEvent('Button_backend_call');

                                                                                            await TransaccionesRecord.collection.doc().set({
                                                                                              ...createTransaccionesRecordData(
                                                                                                tipo: 'compra',
                                                                                                cantidad: listContainerPreciosRecord!.precio,
                                                                                                plataforma: valueOrDefault(currentUserDocument?.plataforma, ''),
                                                                                                status: 'completed',
                                                                                                user: currentUserReference,
                                                                                                userId: currentUserUid,
                                                                                                createdAt: getCurrentTimestamp,
                                                                                                userRef: currentUserReference,
                                                                                              ),
                                                                                              'filtros': rowConfiguracionLocalRecord!.administradoresUuid,
                                                                                            });
                                                                                          } else {
                                                                                            logFirebaseEvent('Button_alert_dialog');
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: Text('Error'),
                                                                                                  content: Text('Algo salio mal (code:15)'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            logFirebaseEvent('Button_bottom_sheet');
                                                                                            Navigator.pop(context);
                                                                                            if (_shouldSetState) setState(() {});
                                                                                            return;
                                                                                          }

                                                                                          logFirebaseEvent('Button_wait__delay');
                                                                                          await Future.delayed(const Duration(milliseconds: 4000));
                                                                                        } else {
                                                                                          logFirebaseEvent('Button_alert_dialog');
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return AlertDialog(
                                                                                                title: Text('Error'),
                                                                                                content: Text('Algo salio mal'),
                                                                                                actions: [
                                                                                                  TextButton(
                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                    child: Text('Ok'),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                          logFirebaseEvent('Button_bottom_sheet');
                                                                                          Navigator.pop(context);
                                                                                          if (_shouldSetState) setState(() {});
                                                                                          return;
                                                                                        }

                                                                                        logFirebaseEvent('Button_bottom_sheet');
                                                                                        Navigator.pop(context);
                                                                                      } else {
                                                                                        logFirebaseEvent('Button_alert_dialog');
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('Error'),
                                                                                              content: Text('Algo salio mal'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                        logFirebaseEvent('Button_bottom_sheet');
                                                                                        Navigator.pop(context);
                                                                                        if (_shouldSetState) setState(() {});
                                                                                        return;
                                                                                      }
                                                                                    } else {
                                                                                      logFirebaseEvent('Button_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: Text('Error'),
                                                                                            content: Text('Algo salio mal'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      logFirebaseEvent('Button_bottom_sheet');
                                                                                      Navigator.pop(context);
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    logFirebaseEvent('Button_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'descargaGuia',
                                                                                      queryParameters: {
                                                                                        'guia': serializeParam(
                                                                                          GenerarGuiaGroup.confirmarTarifaCall
                                                                                              .labelurl(
                                                                                                (_model.confirmRateresponseCopy?.jsonBody ?? ''),
                                                                                              )
                                                                                              .toString(),
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );

                                                                                    if (_shouldSetState) setState(() {});
                                                                                  },
                                                                                  text: 'Comprar',
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: Colors.white,
                                                                                          fontSize: 12.0,
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
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
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
  }
}
