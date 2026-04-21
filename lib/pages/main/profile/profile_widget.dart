import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/loyalty/client_card/client_card_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_model.dart';
export 'profile_model.dart';
import 'package:flutter/scheduler.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int? _lastPoints;

  // Метод для визначення індексу рівня
  int _getLevelIndex(int points) {
    if (points < 2000) return 0;
    if (points < 5000) return 1;
    return 2;
  }

  // Функція для показу Toast
  void _showLevelUpToast(String levelName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: FlutterFlowTheme.of(context).primary,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            const Icon(Icons.stars_rounded, color: Colors.white, size: 30),
            const SizedBox(width: 15),
            Text(
              "Новий статус: $levelName",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.13,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(-1.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 10.0),
                child: Text(
                  'Профіль',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'Blog',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 36.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.13,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 20.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Профіль',
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Blog',
                      fontSize: 36.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  //PopUpMenu
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onSelected: (value) {
                      if (value == 'info') {
                        _showLevelUpToast("Гулеватий Євген, група [Твоя], 121 ІПЗ");
                      } else if (value == 'toast') {
                        _showLevelUpToast("Тестове сповіщення 🌟");
                      } else if (value == 'home') {
                        context.pushNamed('HomePage');
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'info', child: Text("Про автора")),
                      const PopupMenuItem(value: 'toast', child: Text("Показати Toast")),
                      const PopupMenuItem(value: 'home', child: Text("На головну")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
