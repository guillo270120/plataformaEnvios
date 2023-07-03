import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'cuenta_creada_page_model.dart';
export 'cuenta_creada_page_model.dart';

class CuentaCreadaPageWidget extends StatefulWidget {
  const CuentaCreadaPageWidget({Key? key}) : super(key: key);

  @override
  _CuentaCreadaPageWidgetState createState() => _CuentaCreadaPageWidgetState();
}

class _CuentaCreadaPageWidgetState extends State<CuentaCreadaPageWidget> {
  late CuentaCreadaPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuentaCreadaPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'cuentaCreadaPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CUENTA_CREADA_cuentaCreadaPage_ON_INIT_S');
      logFirebaseEvent('cuentaCreadaPage_navigate_to');

      context.pushNamed('loginPage');
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
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Trabajar-en-Estafeta.jpg',
                ).image,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie_animations/110817-account-created.json',
                    width: 500.0,
                    height: 500.0,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
