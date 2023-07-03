import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'direccion_guardada_model.dart';
export 'direccion_guardada_model.dart';

class DireccionGuardadaWidget extends StatefulWidget {
  const DireccionGuardadaWidget({Key? key}) : super(key: key);

  @override
  _DireccionGuardadaWidgetState createState() =>
      _DireccionGuardadaWidgetState();
}

class _DireccionGuardadaWidgetState extends State<DireccionGuardadaWidget> {
  late DireccionGuardadaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DireccionGuardadaModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: Color(0x74A3A3A3),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/lottie_animations/12587-delivery-address.json',
                      width: 300.0,
                      height: 280.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                    Text(
                      'Direccion Almacenada',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
