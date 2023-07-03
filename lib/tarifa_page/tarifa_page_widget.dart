import '/alert_confirmaciones/loader_generar_guia/loader_generar_guia_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
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
                                              child: CircularProgressIndicator(
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
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
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
                                                                FontWeight.w600,
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
                                                                FontWeight.w600,
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
                                                                FontWeight.w600,
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
                                                                FontWeight.w600,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                          color:
                                                              Color(0xFFED3237),
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
                                                                    isEqualTo:
                                                                        valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.precio,
                                                                            ''))
                                                                .where(
                                                                    'pesoMin',
                                                                    isLessThanOrEqualTo:
                                                                        cardEnviosRecord
                                                                            .paquete
                                                                            .weight)
                                                                .where(
                                                                    'plataforma',
                                                                    isEqualTo:
                                                                        valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.plataforma,
                                                                            ''))
                                                                .orderBy(
                                                                    'pesoMin',
                                                                    descending:
                                                                        true),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<PreciosRecord>
                                                                rowPreciosRecordList =
                                                                snapshot.data!;
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
                                                                        child: Image
                                                                            .network(
                                                                          listViewCarriersRecord
                                                                              .imagen,
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          fit: BoxFit
                                                                              .contain,
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
                                                                        DateTime.fromMillisecondsSinceEpoch((listViewCarriersRecord.eta *
                                                                                86400000) +
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
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future:
                                                                        ZonaExtendidaCall
                                                                            .call(
                                                                      copo: widget
                                                                          .currentship!
                                                                          .destino
                                                                          .postalCode,
                                                                    ),
                                                                    builder:
                                                                        (context,
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
                                                                              color: Color(0xFFED3237),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnZonaExtendidaResponse =
                                                                          snapshot
                                                                              .data!;
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            formatNumber(
                                                                              rowPreciosRecord!.precio,
                                                                              formatType: FormatType.decimal,
                                                                              decimalType: DecimalType.automatic,
                                                                              currency: '\$ ',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Readex Pro',
                                                                                  fontSize: 18.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          if (ZonaExtendidaCall.result(
                                                                                columnZonaExtendidaResponse.jsonBody,
                                                                              ) ==
                                                                              FFAppState().validacionZonaExtendida)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '${ZonaExtendidaCall.result(
                                                                                  columnZonaExtendidaResponse.jsonBody,
                                                                                ).toString()}. Requiere pago adicional en mostrador',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 18.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      );
                                                                    },
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
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'TARIFA_PAGE_PAGE_COMPRAR_BTN_ON_TAP');
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
                                                                            if (valueOrDefault(currentUserDocument?.saldo, 0.0) >=
                                                                                rowPreciosRecord!.precio) {
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
                                                                              if (_shouldSetState)
                                                                                setState(() {});
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

                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');
                                                                          _model.loginResponse = await GenerarGuiaGroup
                                                                              .loginCall
                                                                              .call(
                                                                            email:
                                                                                containerConfiguracionRecord!.userPlataforma,
                                                                            password:
                                                                                containerConfiguracionRecord!.passwordPlataforma,
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
                                                                            _model.shipmentresponse =
                                                                                await GenerarGuiaGroup.shipmentsCall.call(
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
                                                                            _shouldSetState =
                                                                                true;
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
                                                                              if (_shouldSetState)
                                                                                setState(() {});
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

                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'generarGuia',
                                                                            queryParameters:
                                                                                {
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
