import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loader_generar_guia_mobile_model.dart';
export 'loader_generar_guia_mobile_model.dart';

class LoaderGenerarGuiaMobileWidget extends StatefulWidget {
  const LoaderGenerarGuiaMobileWidget({Key? key}) : super(key: key);

  @override
  _LoaderGenerarGuiaMobileWidgetState createState() =>
      _LoaderGenerarGuiaMobileWidgetState();
}

class _LoaderGenerarGuiaMobileWidgetState
    extends State<LoaderGenerarGuiaMobileWidget> with TickerProviderStateMixin {
  late LoaderGenerarGuiaMobileModel _model;

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoaderGenerarGuiaMobileModel());

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
              width: MediaQuery.sizeOf(context).width * 0.7,
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
                      'assets/lottie_animations/123807-global-parcel-shipment-tracking.json',
                      width: 300.0,
                      height: 280.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                    Text(
                      'Generando Guia',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      'Espere un momento',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation']!),
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
