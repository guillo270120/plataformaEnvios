import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/acreditar_saldo_widget.dart';
import '/components/header_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'mis_transacciones_model.dart';
export 'mis_transacciones_model.dart';

class MisTransaccionesWidget extends StatefulWidget {
  const MisTransaccionesWidget({Key? key}) : super(key: key);

  @override
  _MisTransaccionesWidgetState createState() => _MisTransaccionesWidgetState();
}

class _MisTransaccionesWidgetState extends State<MisTransaccionesWidget> {
  late MisTransaccionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MisTransaccionesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'misTransacciones'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MIS_TRANSACCIONES_misTransacciones_ON_IN');
      if (!valueOrDefault<bool>(currentUserDocument?.status, false)) {
        logFirebaseEvent('misTransacciones_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Cuenta Inactiva'),
              content: Text('Tu cuenta  aun no esta activa '),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        logFirebaseEvent('misTransacciones_navigate_to');

        context.pushNamed('loginPage');

        return;
      }
      logFirebaseEvent('misTransacciones_update_app_state');
      setState(() {
        FFAppState().pagina = 'Usuarios';
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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<ConfiguracionLocalRecord>>(
        stream: queryConfiguracionLocalRecord(
          queryBuilder: (configuracionLocalRecord) =>
              configuracionLocalRecord.where('nombre_plataforma',
                  isEqualTo:
                      valueOrDefault(currentUserDocument?.plataforma, '')),
          singleRecord: true,
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
          List<ConfiguracionLocalRecord>
              misTransaccionesConfiguracionLocalRecordList = snapshot.data!;
          final misTransaccionesConfiguracionLocalRecord =
              misTransaccionesConfiguracionLocalRecordList.isNotEmpty
                  ? misTransaccionesConfiguracionLocalRecordList.first
                  : null;
          return GestureDetector(
            onTap: () =>
                FocusScope.of(context).requestFocus(_model.unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.sideMenuModel,
                      updateCallback: () => setState(() {}),
                      child: SideMenuWidget(),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.headerModel,
                            updateCallback: () => setState(() {}),
                            child: HeaderWidget(),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  50.0, 50.0, 50.0, 50.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Nombre',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Tipo',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Id Transaccion',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Cantidad',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Status',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                        'main') ||
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.rol,
                                                            '') ==
                                                        'admin'))
                                                  Expanded(
                                                    child: Text(
                                                      'Imagen Pago',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                                        'main') ||
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.rol,
                                                            '') ==
                                                        'admin'))
                                                  Expanded(
                                                    child: Text(
                                                      'Acciones',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 2.0,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          StreamBuilder<
                                              List<TransaccionesRecord>>(
                                            stream: queryTransaccionesRecord(
                                              queryBuilder: (transaccionesRecord) =>
                                                  transaccionesRecord
                                                      .where('filtros',
                                                          arrayContains:
                                                              currentUserUid)
                                                      .where('plataforma',
                                                          isEqualTo: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.plataforma,
                                                              ''))
                                                      .orderBy('createdAt',
                                                          descending: true),
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
                                              List<TransaccionesRecord>
                                                  listViewTransaccionesRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewTransaccionesRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewTransaccionesRecord =
                                                      listViewTransaccionesRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: StreamBuilder<
                                                              UsersRecord>(
                                                            stream: UsersRecord
                                                                .getDocument(
                                                                    listViewTransaccionesRecord
                                                                        .user!),
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
                                                              final textUsersRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Text(
                                                                textUsersRecord
                                                                    .displayName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            listViewTransaccionesRecord
                                                                .tipo,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  listViewTransaccionesRecord
                                                                      .idTransaccion,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  formatNumber(
                                                                    listViewTransaccionesRecord
                                                                        .cantidad,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .automatic,
                                                                    currency:
                                                                        '\$ ',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            listViewTransaccionesRecord
                                                                .status,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
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
                                                                'main') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.rol,
                                                                    '') ==
                                                                'admin'))
                                                          Expanded(
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'MIS_TRANSACCIONES_Image_unwu4sc5_ON_TAP');
                                                                logFirebaseEvent(
                                                                    'Image_expand_image');
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewTransaccionesRecord
                                                                              .imagenPago,
                                                                          'https://firebasestorage.googleapis.com/v0/b/plataforma-7f84e.appspot.com/o/defectoproducto.jpg?alt=media&token=14bf3c77-b82f-4dd3-81fd-969d2efba5e5',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag: valueOrDefault<
                                                                          String>(
                                                                        listViewTransaccionesRecord
                                                                            .imagenPago,
                                                                        'https://firebasestorage.googleapis.com/v0/b/plataforma-7f84e.appspot.com/o/defectoproducto.jpg?alt=media&token=14bf3c77-b82f-4dd3-81fd-969d2efba5e5' +
                                                                            '$listViewIndex',
                                                                      ),
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  listViewTransaccionesRecord
                                                                      .imagenPago,
                                                                  'https://firebasestorage.googleapis.com/v0/b/plataforma-7f84e.appspot.com/o/defectoproducto.jpg?alt=media&token=14bf3c77-b82f-4dd3-81fd-969d2efba5e5' +
                                                                      '$listViewIndex',
                                                                ),
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listViewTransaccionesRecord
                                                                          .imagenPago,
                                                                      'https://firebasestorage.googleapis.com/v0/b/plataforma-7f84e.appspot.com/o/defectoproducto.jpg?alt=media&token=14bf3c77-b82f-4dd3-81fd-969d2efba5e5',
                                                                    ),
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        50.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
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
                                                                'main') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.rol,
                                                                    '') ==
                                                                'admin'))
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (listViewTransaccionesRecord
                                                                        .status !=
                                                                    'completed')
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      borderRadius:
                                                                          5.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: Color(
                                                                            0xFFFF0A0A),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'MIS_TRANSACCIONES_PAGE_check_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_alert_dialog');
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Acreditar Pago'),
                                                                                  content: Text('Esta seguro de Acreditar el pago?'),
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
                                                                          logFirebaseEvent(
                                                                              'IconButton_alert_dialog');
                                                                          await showAlignedDialog(
                                                                            context:
                                                                                context,
                                                                            isGlobal:
                                                                                true,
                                                                            avoidOverflow:
                                                                                false,
                                                                            targetAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            followerAnchor:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Material(
                                                                                color: Colors.transparent,
                                                                                child: GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                  child: AcreditarSaldoWidget(
                                                                                    transaccionDocument: listViewTransaccionesRecord,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                if (listViewTransaccionesRecord
                                                                        .status ==
                                                                    'pending')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      borderRadius:
                                                                          5.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: Color(
                                                                            0xFFFF0A0A),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'MIS_TRANSACCIONES_PAGE_delete_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_alert_dialog');
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Eliminar Transaccion'),
                                                                                  content: Text('Esta seguro deEliminar la transaccion'),
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
                                                                          logFirebaseEvent(
                                                                              'IconButton_backend_call');
                                                                          await listViewTransaccionesRecord
                                                                              .reference
                                                                              .delete();
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
