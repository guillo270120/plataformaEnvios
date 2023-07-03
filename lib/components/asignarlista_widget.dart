import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'asignarlista_model.dart';
export 'asignarlista_model.dart';

class AsignarlistaWidget extends StatefulWidget {
  const AsignarlistaWidget({
    Key? key,
    required this.userReference,
  }) : super(key: key);

  final DocumentReference? userReference;

  @override
  _AsignarlistaWidgetState createState() => _AsignarlistaWidgetState();
}

class _AsignarlistaWidgetState extends State<AsignarlistaWidget> {
  late AsignarlistaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsignarlistaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

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
          List<ConfiguracionLocalRecord> dropDownConfiguracionLocalRecordList =
              snapshot.data!;
          final dropDownConfiguracionLocalRecord =
              dropDownConfiguracionLocalRecordList.isNotEmpty
                  ? dropDownConfiguracionLocalRecordList.first
                  : null;
          return FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController ??=
                FormFieldController<String>(null),
            options: dropDownConfiguracionLocalRecord!.listasDePrecio,
            onChanged: (val) async {
              setState(() => _model.dropDownValue = val);
              logFirebaseEvent('ASIGNARLISTA_DropDown_3iy716in_ON_FORM_W');
              logFirebaseEvent('DropDown_backend_call');

              await widget.userReference!.update(createUsersRecordData(
                precio: _model.dropDownValue,
              ));
              logFirebaseEvent('DropDown_update_app_state');
              setState(() {
                FFAppState().asignarlista = false;
              });
            },
            width: 300.0,
            height: 50.0,
            textStyle: FlutterFlowTheme.of(context).bodyMedium,
            hintText: 'Seleccionar Lista',
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 2.0,
            borderColor: FlutterFlowTheme.of(context).alternate,
            borderWidth: 2.0,
            borderRadius: 8.0,
            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
            hidesUnderline: true,
            isSearchable: false,
          );
        },
      ),
    );
  }
}
