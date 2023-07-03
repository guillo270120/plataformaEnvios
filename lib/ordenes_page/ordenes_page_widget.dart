import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list_widget.dart';
import '/components/header_widget.dart';
import '/components/side_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ordenes_page_model.dart';
export 'ordenes_page_model.dart';

class OrdenesPageWidget extends StatefulWidget {
  const OrdenesPageWidget({Key? key}) : super(key: key);

  @override
  _OrdenesPageWidgetState createState() => _OrdenesPageWidgetState();
}

class _OrdenesPageWidgetState extends State<OrdenesPageWidget> {
  late OrdenesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrdenesPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ordenesPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ORDENES_ordenesPage_ON_INIT_STATE');
      if (!valueOrDefault<bool>(currentUserDocument?.status, false)) {
        logFirebaseEvent('ordenesPage_alert_dialog');
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
        logFirebaseEvent('ordenesPage_navigate_to');

        context.pushNamed('loginPage');

        return;
      }
      logFirebaseEvent('ordenesPage_update_app_state');
      setState(() {
        FFAppState().pagina = 'Ordenes';
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
              ordenesPageConfiguracionLocalRecordList = snapshot.data!;
          final ordenesPageConfiguracionLocalRecord =
              ordenesPageConfiguracionLocalRecordList.isNotEmpty
                  ? ordenesPageConfiguracionLocalRecordList.first
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
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
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
                                                    'Cliente',
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
                                                    'Origen',
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
                                                    'Destino',
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
                                                    'Enviado',
                                                    textAlign: TextAlign.center,
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
                                                    'Fecha',
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
                                                        'main'))
                                                  Expanded(
                                                    child: Text(
                                                      'Plataforma',
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
                                                Expanded(
                                                  child: Text(
                                                    'Acciones',
                                                    textAlign: TextAlign.center,
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
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 20.0),
                                            child: StreamBuilder<
                                                List<EnviosRecord>>(
                                              stream: queryEnviosRecord(
                                                queryBuilder: (enviosRecord) =>
                                                    enviosRecord.where(
                                                        'filtros',
                                                        arrayContains:
                                                            currentUserUid),
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
                                                        color:
                                                            Color(0xFFED3237),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<EnviosRecord>
                                                    listViewEnviosRecordList =
                                                    snapshot.data!;
                                                if (listViewEnviosRecordList
                                                    .isEmpty) {
                                                  return EmptyListWidget();
                                                }
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewEnviosRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewEnviosRecord =
                                                        listViewEnviosRecordList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  listViewEnviosRecord
                                                                      .destino
                                                                      .name,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${listViewEnviosRecord.origen.street}, ${listViewEnviosRecord.origen.neighborhood}, ${listViewEnviosRecord.origen.city}, ${listViewEnviosRecord.origen.state}, ${listViewEnviosRecord.origen.postalCode}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${listViewEnviosRecord.destino.street}, ${listViewEnviosRecord.destino.neighborhood}, ${listViewEnviosRecord.destino.city}, ${listViewEnviosRecord.destino.state}, ${listViewEnviosRecord.destino.postalCode}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if (listViewEnviosRecord
                                                                        .status ==
                                                                    'completed')
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xFF34A500),
                                                                    size: 24.0,
                                                                  ),
                                                                if (listViewEnviosRecord
                                                                        .status !=
                                                                    'completed')
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 24.0,
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  dateTimeFormat(
                                                                      'd/M/y',
                                                                      listViewEnviosRecord
                                                                          .createdAt!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
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
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    listViewEnviosRecord
                                                                        .plataforma,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'ORDENES_CREAR_DE_NUEVO_BTN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');

                                                                          var enviosRecordReference = EnviosRecord
                                                                              .collection
                                                                              .doc();
                                                                          await enviosRecordReference
                                                                              .set({
                                                                            ...createEnviosRecordData(
                                                                              userId: currentUserUid,
                                                                              origen: updateOriginAttributesStruct(
                                                                                listViewEnviosRecord.origen,
                                                                                clearUnsetFields: false,
                                                                                create: true,
                                                                              ),
                                                                              destino: updateDestinationAttributesStruct(
                                                                                listViewEnviosRecord.destino,
                                                                                clearUnsetFields: false,
                                                                                create: true,
                                                                              ),
                                                                              status: 'pending',
                                                                              step: 'paquete',
                                                                              createdAt: getCurrentTimestamp,
                                                                            ),
                                                                            'filtros':
                                                                                ordenesPageConfiguracionLocalRecord!.administradoresUuid,
                                                                          });
                                                                          _model.nuevoEnvio =
                                                                              EnviosRecord.getDocumentFromData({
                                                                            ...createEnviosRecordData(
                                                                              userId: currentUserUid,
                                                                              origen: updateOriginAttributesStruct(
                                                                                listViewEnviosRecord.origen,
                                                                                clearUnsetFields: false,
                                                                                create: true,
                                                                              ),
                                                                              destino: updateDestinationAttributesStruct(
                                                                                listViewEnviosRecord.destino,
                                                                                clearUnsetFields: false,
                                                                                create: true,
                                                                              ),
                                                                              status: 'pending',
                                                                              step: 'paquete',
                                                                              createdAt: getCurrentTimestamp,
                                                                            ),
                                                                            'filtros':
                                                                                ordenesPageConfiguracionLocalRecord!.administradoresUuid,
                                                                          }, enviosRecordReference);
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'dimensionesPage',
                                                                            queryParameters:
                                                                                {
                                                                              'currentShip': serializeParam(
                                                                                _model.nuevoEnvio,
                                                                                ParamType.Document,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              'currentShip': _model.nuevoEnvio,
                                                                            },
                                                                          );

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Crear de nuevo',
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
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
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
                                                                      ),
                                                                    ),
                                                                    if (listViewEnviosRecord
                                                                            .status !=
                                                                        'completed')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          borderRadius:
                                                                              5.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.delete,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('ORDENES_PAGE_PAGE_delete_ICN_ON_TAP');
                                                                            logFirebaseEvent('IconButton_alert_dialog');
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: Text('Eliminar Orden'),
                                                                                      content: Text('Estas seguro de eliminar esta orden?'),
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
                                                                            logFirebaseEvent('IconButton_backend_call');
                                                                            await listViewEnviosRecord.reference.delete();
                                                                          },
                                                                        ),
                                                                      ),
                                                                  ],
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
                                          ),
                                        ],
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
