import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'loyal_progress_model.dart';
export 'loyal_progress_model.dart';
import '/components/app_drawer.dart';
import 'package:flutter/scheduler.dart';

class LoyalProgressWidget extends StatefulWidget {
  const LoyalProgressWidget({super.key});

  static String routeName = 'LoyalProgress';
  static String routePath = '/loyalProgress';

  @override
  State<LoyalProgressWidget> createState() => _LoyalProgressWidgetState();
}

class _LoyalProgressWidgetState extends State<LoyalProgressWidget> {
  late LoyalProgressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int? _lastPoints;

  // Функція для показу Toast з малюнком риби (вимога Лаби №5)
  void _showLevelUpToast(String levelName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: FlutterFlowTheme.of(context).primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Row(
          children: [
            const Icon(Icons.stars_rounded, color: Colors.white, size: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                "Вітаємо! Ваш новий статус: $levelName",
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getLevelIndex(int points) {
    if (points < 2000) return 0;
    if (points < 5000) return 1;
    return 2;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoyalProgressModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawer(),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            buttonSize: 50.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Прогрес',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Roboto',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22.0,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.menu_rounded,
                  color: Color(0xFF39ADD2),
                  size: 30.0,
                ),
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
          ],
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                child: Text(
                  'Ваш рівень',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.roboto(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x1F000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) {
                                      final int currentPoints = valueOrDefault(currentUserDocument?.points, 0);

                                      if (_lastPoints != null) {
                                        int oldLevel = _getLevelIndex(_lastPoints!);
                                        int newLevel = _getLevelIndex(currentPoints);
                                        if (newLevel > oldLevel) {
                                          SchedulerBinding.instance.addPostFrameCallback((_) {
                                            String levelName = newLevel == 1 ? 'Частий гість' : 'Особливий друг';
                                            _showLevelUpToast(levelName);
                                          });
                                        }
                                      }
                                      _lastPoints = currentPoints;

                                      return Text(
                                        currentPoints < 2000 ? 'Новачок' : (currentPoints < 5000 ? 'Частий гість' : 'Особливий друг'),
                                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                          ),
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          fontSize: 20.0,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                        () {
                                      final currentPoints = valueOrDefault(currentUserDocument?.points, 0);
                                      if (currentPoints < 2000) {
                                        return 'Перший рівень';
                                      } else if (currentPoints >= 2000 && currentPoints < 5000) {
                                        return 'Другий рівень';
                                      } else {
                                        return 'Третій рівень';
                                      }
                                    }(),
                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                      font: GoogleFonts.roboto(),
                                      color: FlutterFlowTheme.of(context).primaryText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).popupBack,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                          () {
                                        final currentPoints = valueOrDefault(currentUserDocument?.points, 0);
                                        if (currentPoints < 2000) {
                                          return '5%';
                                        } else if (currentPoints >= 2000 && currentPoints < 5000) {
                                          return '10%';
                                        } else {
                                          return '15%';
                                        }
                                      }(),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.roboto(),
                                        fontSize: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 24.0,
                          thickness: 1.0,
                          color: Color(0xFF6AA3B8),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) {
                                  final currentPoints = valueOrDefault(currentUserDocument?.points, 0);
                                  if (currentPoints < 5000) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'До наступного \nрівня:',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.roboto(),
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Stack(
                                            alignment: AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              CircularPercentIndicator(
                                                percent: valueOrDefault<double>(functions.getPercentage(currentPoints), 0.0),
                                                radius: 35.0,
                                                lineWidth: 12.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor: Colors.white,
                                                backgroundColor: Color(0x4CFFFFFF),
                                              ),
                                              Text(
                                                    () {
                                                  if (currentPoints < 2000) {
                                                    return '10%';
                                                  } else {
                                                    return '15%';
                                                  }
                                                }(),
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.roboto(),
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Ви досягли максимального рівня!',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.roboto(),
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                child: Text(
                  'Рівні',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.roboto(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // КАРТКА 1: НОВАЧОК
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                        child: AuthUserStreamWidget(
                            builder: (context) {
                              final currentPoints = valueOrDefault(currentUserDocument?.points, 0);
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: currentPoints < 2000
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x1F000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 16.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 12.0, 12.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Новачок',
                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Перший рівень',
                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                        font: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Text(
                                                  '5%',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.roboto(),
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: currentPoints < 2000 ? valueOrDefault<double>(functions.getPercentage(currentPoints), 0.0) : 1.0,
                                          width: MediaQuery.sizeOf(context).width * 0.82,
                                          lineHeight: 16.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: FlutterFlowTheme.of(context).primary,
                                          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                          barRadius: Radius.circular(24.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),

                      // КАРТКА 2: ЧАСТИЙ ГІСТЬ
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                        child: AuthUserStreamWidget(
                            builder: (context) {
                              final currentPoints = valueOrDefault(currentUserDocument?.points, 0);
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: (currentPoints >= 2000 && currentPoints < 5000)
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x1F000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 16.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 12.0, 12.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Частий гість',
                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Другий рівень',
                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                        font: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  '10%',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.roboto(),
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: () {
                                            if (currentPoints < 2000) {
                                              return 0.0;
                                            } else if (currentPoints >= 2000 && currentPoints < 5000) {
                                              return valueOrDefault<double>(functions.getPercentage(currentPoints), 0.0);
                                            } else {
                                              return 1.0;
                                            }
                                          }(),
                                          width: MediaQuery.sizeOf(context).width * 0.82,
                                          lineHeight: 16.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: FlutterFlowTheme.of(context).primary,
                                          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                          barRadius: Radius.circular(24.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),

                      // КАРТКА 3: ОСОБЛИВИЙ ДРУГ
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                        child: AuthUserStreamWidget(
                            builder: (context) {
                              final currentPoints = valueOrDefault(currentUserDocument?.points, 0);
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: currentPoints >= 5000
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).primaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x1F000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 16.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 12.0, 12.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Особливий друг',
                                                    style: FlutterFlowTheme.of(context).titleLarge,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Третій рівень',
                                                      style: FlutterFlowTheme.of(context).labelMedium.override(
                                                        font: GoogleFonts.roboto(fontWeight: FontWeight.w300),
                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: AlignmentDirectional(0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  '15%',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.roboto(),
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                        child: LinearPercentIndicator(
                                          percent: currentPoints >= 5000 ? 1.0 : 0.0,
                                          width: MediaQuery.sizeOf(context).width * 0.82,
                                          lineHeight: 16.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: FlutterFlowTheme.of(context).primary,
                                          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                          barRadius: Radius.circular(24.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}