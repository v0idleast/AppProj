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

  int? _lastPoints; // Та сама змінна, якої не вистачає

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
          // Container(
          //   width: double.infinity,
          //   height: MediaQuery.sizeOf(context).height * 0.87,
          //   decoration: BoxDecoration(),
          //   child: Align(
          //     alignment: AlignmentDirectional(0.0, -1.0),
          //     child: Column(
          //       mainAxisSize: MainAxisSize.max,
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Column(
          //           mainAxisSize: MainAxisSize.max,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Row(
          //               mainAxisSize: MainAxisSize.max,
          //               children: [
          //                 Padding(
          //                   padding: EdgeInsetsDirectional.fromSTEB(
          //                       0.0, 10.0, 0.0, 10.0),
          //                   child: Container(
          //                     width: MediaQuery.sizeOf(context).width * 1.0,
          //                     decoration: BoxDecoration(
          //                       color: FlutterFlowTheme.of(context)
          //                           .primaryBackground,
          //                     ),
          //                     child: Padding(
          //                       padding: EdgeInsetsDirectional.fromSTEB(
          //                           24.0, 12.0, 24.0, 12.0),
          //                       child: Row(
          //                         mainAxisSize: MainAxisSize.max,
          //                         children: [
          //                           Padding(
          //                             padding: EdgeInsetsDirectional.fromSTEB(
          //                                 16.0, 0.0, 0.0, 0.0),
          //                             child: Column(
          //                               mainAxisSize: MainAxisSize.max,
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 AuthUserStreamWidget(
          //                                   builder: (context) {
          //                                     final currentPoints = valueOrDefault(currentUserDocument?.points, 0);
          //
          //                                     // Перевірка на зміну рівня
          //                                     if (_lastPoints != null) {
          //                                       int oldLevel = _getLevelIndex(_lastPoints!);
          //                                       int newLevel = _getLevelIndex(currentPoints);
          //
          //                                       if (newLevel > oldLevel) {
          //                                         String levelName = newLevel == 1 ? 'Частий гість' : 'Особливий друг';
          //
          //                                         // Викликаємо сповіщення після завершення кадру
          //                                         SchedulerBinding.instance.addPostFrameCallback((_) {
          //                                           _showLevelUpToast(levelName);
          //                                         });
          //                                       }
          //                                     }
          //                                     _lastPoints = currentPoints;
          //
          //                                     return Text(
          //                                       // Існуюча логіка відображення назви рівня...
          //                                       currentPoints < 2000 ? 'Новачок' : (currentPoints < 5000 ? 'Частий гість' : 'Особливий друг'),
          //                                       style: FlutterFlowTheme.of(context).headlineMedium.override(
          //                                         // ваші стилі
          //                                       ),
          //                                     );
          //                                   },
          //                                 ),
          //                                 Padding(
          //                                   padding:
          //                                       EdgeInsetsDirectional.fromSTEB(
          //                                           0.0, 4.0, 0.0, 0.0),
          //                                   child: Text(
          //                                     currentUserEmail,
          //                                     style: FlutterFlowTheme.of(
          //                                             context)
          //                                         .bodySmall
          //                                         .override(
          //                                           font: GoogleFonts.outfit(
          //                                             fontWeight:
          //                                                 FontWeight.normal,
          //                                             fontStyle:
          //                                                 FlutterFlowTheme.of(
          //                                                         context)
          //                                                     .bodySmall
          //                                                     .fontStyle,
          //                                           ),
          //                                           color: FlutterFlowTheme.of(
          //                                                   context)
          //                                               .primary,
          //                                           fontSize: 14.0,
          //                                           letterSpacing: 0.0,
          //                                           fontWeight:
          //                                               FontWeight.normal,
          //                                           fontStyle:
          //                                               FlutterFlowTheme.of(
          //                                                       context)
          //                                                   .bodySmall
          //                                                   .fontStyle,
          //                                         ),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Padding(
          //               padding:
          //                   EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
          //               child: Column(
          //                 mainAxisSize: MainAxisSize.max,
          //                 children: [
          //                   if (Theme.of(context).brightness ==
          //                       Brightness.light)
          //                     InkWell(
          //                       splashColor: Colors.transparent,
          //                       focusColor: Colors.transparent,
          //                       hoverColor: Colors.transparent,
          //                       highlightColor: Colors.transparent,
          //                       onTap: () async {
          //                         setDarkModeSetting(context, ThemeMode.dark);
          //                       },
          //                       child: Container(
          //                         width: MediaQuery.sizeOf(context).width * 1.0,
          //                         decoration: BoxDecoration(
          //                           color: FlutterFlowTheme.of(context)
          //                               .primaryBackground,
          //                         ),
          //                         child: Padding(
          //                           padding: EdgeInsetsDirectional.fromSTEB(
          //                               24.0, 12.0, 24.0, 12.0),
          //                           child: Row(
          //                             mainAxisSize: MainAxisSize.max,
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Text(
          //                                 'Увімкнути темний режим',
          //                                 style: FlutterFlowTheme.of(context)
          //                                     .bodyMedium
          //                                     .override(
          //                                       fontFamily: 'Blog',
          //                                       color:
          //                                           FlutterFlowTheme.of(context)
          //                                               .secondaryText,
          //                                       fontSize: 14.0,
          //                                       letterSpacing: 0.0,
          //                                       fontWeight: FontWeight.normal,
          //                                     ),
          //                               ),
          //                               Container(
          //                                 width: 80.0,
          //                                 height: 40.0,
          //                                 decoration: BoxDecoration(
          //                                   color: Color(0xFFF1F4F8),
          //                                   borderRadius:
          //                                       BorderRadius.circular(20.0),
          //                                 ),
          //                                 child: Stack(
          //                                   alignment:
          //                                       AlignmentDirectional(0.0, 0.0),
          //                                   children: [
          //                                     Align(
          //                                       alignment: AlignmentDirectional(
          //                                           0.95, 0.0),
          //                                       child: Padding(
          //                                         padding: EdgeInsetsDirectional
          //                                             .fromSTEB(
          //                                                 0.0, 0.0, 8.0, 0.0),
          //                                         child: Icon(
          //                                           Icons.nights_stay,
          //                                           color: Color(0xFF57636C),
          //                                           size: 20.0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                     Align(
          //                                       alignment: AlignmentDirectional(
          //                                           -0.85, 0.0),
          //                                       child: Container(
          //                                         width: 36.0,
          //                                         height: 36.0,
          //                                         decoration: BoxDecoration(
          //                                           color: Colors.white,
          //                                           boxShadow: [
          //                                             BoxShadow(
          //                                               blurRadius: 4.0,
          //                                               color:
          //                                                   Color(0x430B0D0F),
          //                                               offset: Offset(
          //                                                 0.0,
          //                                                 2.0,
          //                                               ),
          //                                             )
          //                                           ],
          //                                           borderRadius:
          //                                               BorderRadius.circular(
          //                                                   30.0),
          //                                           shape: BoxShape.rectangle,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   if (Theme.of(context).brightness == Brightness.dark)
          //                     InkWell(
          //                       splashColor: Colors.transparent,
          //                       focusColor: Colors.transparent,
          //                       hoverColor: Colors.transparent,
          //                       highlightColor: Colors.transparent,
          //                       onTap: () async {
          //                         setDarkModeSetting(context, ThemeMode.light);
          //                       },
          //                       child: Container(
          //                         width: MediaQuery.sizeOf(context).width * 1.0,
          //                         decoration: BoxDecoration(
          //                           color: FlutterFlowTheme.of(context)
          //                               .primaryBackground,
          //                         ),
          //                         child: Padding(
          //                           padding: EdgeInsetsDirectional.fromSTEB(
          //                               24.0, 12.0, 24.0, 12.0),
          //                           child: Row(
          //                             mainAxisSize: MainAxisSize.max,
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: [
          //                               Text(
          //                                 'Увімкнути світлий режим',
          //                                 style: FlutterFlowTheme.of(context)
          //                                     .bodyMedium
          //                                     .override(
          //                                       fontFamily: 'Blog',
          //                                       color:
          //                                           FlutterFlowTheme.of(context)
          //                                               .secondaryText,
          //                                       fontSize: 14.0,
          //                                       letterSpacing: 0.0,
          //                                       fontWeight: FontWeight.normal,
          //                                     ),
          //                               ),
          //                               Container(
          //                                 width: 80.0,
          //                                 height: 40.0,
          //                                 decoration: BoxDecoration(
          //                                   color: Color(0xFFF1F4F8),
          //                                   borderRadius:
          //                                       BorderRadius.circular(20.0),
          //                                 ),
          //                                 child: Stack(
          //                                   alignment:
          //                                       AlignmentDirectional(0.0, 0.0),
          //                                   children: [
          //                                     Align(
          //                                       alignment: AlignmentDirectional(
          //                                           -0.9, 0.0),
          //                                       child: Padding(
          //                                         padding: EdgeInsetsDirectional
          //                                             .fromSTEB(
          //                                                 8.0, 2.0, 0.0, 0.0),
          //                                         child: Icon(
          //                                           Icons.wb_sunny_rounded,
          //                                           color: Color(0xFF57636C),
          //                                           size: 24.0,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                     Align(
          //                                       alignment: AlignmentDirectional(
          //                                           0.9, 0.0),
          //                                       child: Container(
          //                                         width: 36.0,
          //                                         height: 36.0,
          //                                         decoration: BoxDecoration(
          //                                           color: Colors.white,
          //                                           boxShadow: [
          //                                             BoxShadow(
          //                                               blurRadius: 4.0,
          //                                               color:
          //                                                   Color(0x430B0D0F),
          //                                               offset: Offset(
          //                                                 0.0,
          //                                                 2.0,
          //                                               ),
          //                                             )
          //                                           ],
          //                                           borderRadius:
          //                                               BorderRadius.circular(
          //                                                   30.0),
          //                                           shape: BoxShape.rectangle,
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                 ],
          //               ),
          //             ),
          //             Column(
          //               mainAxisSize: MainAxisSize.max,
          //               children: [
          //                 Row(
          //                   mainAxisSize: MainAxisSize.max,
          //                   children: [
          //                     Padding(
          //                       padding: EdgeInsetsDirectional.fromSTEB(
          //                           24.0, 12.0, 0.0, 12.0),
          //                       child: Text(
          //                         'Налаштування аккаунта',
          //                         style: FlutterFlowTheme.of(context)
          //                             .labelMedium
          //                             .override(
          //                               fontFamily: 'Blog',
          //                               color: FlutterFlowTheme.of(context)
          //                                   .primaryText,
          //                               fontSize: 14.0,
          //                               letterSpacing: 0.0,
          //                               fontWeight: FontWeight.normal,
          //                             ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //             Column(
          //               mainAxisSize: MainAxisSize.max,
          //               children: [
          //                 Padding(
          //                   padding: EdgeInsetsDirectional.fromSTEB(
          //                       20.0, 0.0, 20.0, 0.0),
          //                   child: InkWell(
          //                     splashColor: Colors.transparent,
          //                     focusColor: Colors.transparent,
          //                     hoverColor: Colors.transparent,
          //                     highlightColor: Colors.transparent,
          //                     onTap: () async {
          //                       context.pushNamed(
          //                         EditPassWidget.routeName,
          //                         extra: <String, dynamic>{
          //                           '__transition_info__': TransitionInfo(
          //                             hasTransition: true,
          //                             transitionType:
          //                                 PageTransitionType.rightToLeft,
          //                             duration: Duration(milliseconds: 300),
          //                           ),
          //                         },
          //                       );
          //                     },
          //                     child: Container(
          //                       width: double.infinity,
          //                       height: 60.0,
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .primaryBackground,
          //                         boxShadow: [
          //                           BoxShadow(
          //                             blurRadius: 5.0,
          //                             color: Color(0x3416202A),
          //                             offset: Offset(
          //                               0.0,
          //                               2.0,
          //                             ),
          //                           )
          //                         ],
          //                         borderRadius: BorderRadius.circular(12.0),
          //                         shape: BoxShape.rectangle,
          //                       ),
          //                       child: Padding(
          //                         padding: EdgeInsets.all(8.0),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           children: [
          //                             Padding(
          //                               padding: EdgeInsetsDirectional.fromSTEB(
          //                                   12.0, 0.0, 0.0, 0.0),
          //                               child: Text(
          //                                 'Змінити пароль',
          //                                 style: FlutterFlowTheme.of(context)
          //                                     .labelMedium
          //                                     .override(
          //                                       fontFamily: 'Blog',
          //                                       color:
          //                                           FlutterFlowTheme.of(context)
          //                                               .secondaryText,
          //                                       fontSize: 14.0,
          //                                       letterSpacing: 0.0,
          //                                       fontWeight: FontWeight.normal,
          //                                     ),
          //                               ),
          //                             ),
          //                             Expanded(
          //                               child: Align(
          //                                 alignment:
          //                                     AlignmentDirectional(0.9, 0.0),
          //                                 child: Icon(
          //                                   Icons.arrow_forward_ios,
          //                                   color: Color(0xFF57636C),
          //                                   size: 18.0,
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsetsDirectional.fromSTEB(
          //                       20.0, 12.0, 20.0, 0.0),
          //                   child: InkWell(
          //                     splashColor: Colors.transparent,
          //                     focusColor: Colors.transparent,
          //                     hoverColor: Colors.transparent,
          //                     highlightColor: Colors.transparent,
          //                     onTap: () async {
          //                       context.pushNamed(
          //                         ProfileEditWidget.routeName,
          //                         extra: <String, dynamic>{
          //                           '__transition_info__': TransitionInfo(
          //                             hasTransition: true,
          //                             transitionType:
          //                                 PageTransitionType.rightToLeft,
          //                             duration: Duration(milliseconds: 300),
          //                           ),
          //                         },
          //                       );
          //                     },
          //                     child: Container(
          //                       width: double.infinity,
          //                       height: 60.0,
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .primaryBackground,
          //                         boxShadow: [
          //                           BoxShadow(
          //                             blurRadius: 5.0,
          //                             color: Color(0x3416202A),
          //                             offset: Offset(
          //                               0.0,
          //                               2.0,
          //                             ),
          //                           )
          //                         ],
          //                         borderRadius: BorderRadius.circular(12.0),
          //                         shape: BoxShape.rectangle,
          //                       ),
          //                       child: Padding(
          //                         padding: EdgeInsets.all(8.0),
          //                         child: Row(
          //                           mainAxisSize: MainAxisSize.max,
          //                           children: [
          //                             Padding(
          //                               padding: EdgeInsetsDirectional.fromSTEB(
          //                                   12.0, 0.0, 0.0, 0.0),
          //                               child: Text(
          //                                 'Редагувати профіль',
          //                                 style: FlutterFlowTheme.of(context)
          //                                     .labelMedium
          //                                     .override(
          //                                       fontFamily: 'Blog',
          //                                       color:
          //                                           FlutterFlowTheme.of(context)
          //                                               .secondaryText,
          //                                       fontSize: 14.0,
          //                                       letterSpacing: 0.0,
          //                                       fontWeight: FontWeight.normal,
          //                                     ),
          //                               ),
          //                             ),
          //                             Expanded(
          //                               child: Align(
          //                                 alignment:
          //                                     AlignmentDirectional(0.9, 0.0),
          //                                 child: Icon(
          //                                   Icons.arrow_forward_ios,
          //                                   color: Color(0xFF57636C),
          //                                   size: 18.0,
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsetsDirectional.fromSTEB(
          //                       0.0, 20.0, 0.0, 20.0),
          //                   child: Row(
          //                     mainAxisSize: MainAxisSize.max,
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: [
          //                       FFButtonWidget(
          //                         onPressed: () async {
          //                           GoRouter.of(context).prepareAuthEvent();
          //                           await authManager.signOut();
          //                           GoRouter.of(context)
          //                               .clearRedirectLocation();
          //
          //                           context.pushNamedAuth(
          //                             LoginPageWidget.routeName,
          //                             context.mounted,
          //                             extra: <String, dynamic>{
          //                               '__transition_info__': TransitionInfo(
          //                                 hasTransition: true,
          //                                 transitionType:
          //                                     PageTransitionType.fade,
          //                                 duration: Duration(milliseconds: 0),
          //                               ),
          //                             },
          //                           );
          //                         },
          //                         text: 'Вийти з акаунту',
          //                         options: FFButtonOptions(
          //                           width: 120.0,
          //                           height: 40.0,
          //                           padding: EdgeInsetsDirectional.fromSTEB(
          //                               0.0, 0.0, 0.0, 0.0),
          //                           iconPadding: EdgeInsetsDirectional.fromSTEB(
          //                               0.0, 0.0, 0.0, 0.0),
          //                           color: FlutterFlowTheme.of(context)
          //                               .primaryBackground,
          //                           textStyle: FlutterFlowTheme.of(context)
          //                               .bodySmall
          //                               .override(
          //                                 fontFamily: 'Blog',
          //                                 color: FlutterFlowTheme.of(context)
          //                                     .primaryText,
          //                                 fontSize: 14.0,
          //                                 letterSpacing: 0.0,
          //                                 fontWeight: FontWeight.normal,
          //                               ),
          //                           elevation: 1.0,
          //                           borderSide: BorderSide(
          //                             color: Colors.transparent,
          //                             width: 1.0,
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //         Container(
          //           width: double.infinity,
          //           height: 90.0,
          //           decoration: BoxDecoration(
          //             color: Color(0x00EEEEEE),
          //           ),
          //           child: Stack(
          //             children: [
          //               Column(
          //                 mainAxisSize: MainAxisSize.max,
          //                 mainAxisAlignment: MainAxisAlignment.end,
          //                 children: [
          //                   Material(
          //                     color: Colors.transparent,
          //                     elevation: 0.0,
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(20.0),
          //                         topRight: Radius.circular(20.0),
          //                       ),
          //                     ),
          //                     child: Container(
          //                       width: double.infinity,
          //                       height: 80.0,
          //                       decoration: BoxDecoration(
          //                         color: FlutterFlowTheme.of(context)
          //                             .primaryBackground,
          //                         boxShadow: [
          //                           BoxShadow(
          //                             blurRadius: 10.0,
          //                             color: Color(0x1A57636C),
          //                             offset: Offset(
          //                               0.0,
          //                               -10.0,
          //                             ),
          //                             spreadRadius: 0.1,
          //                           )
          //                         ],
          //                         borderRadius: BorderRadius.only(
          //                           topLeft: Radius.circular(20.0),
          //                           topRight: Radius.circular(20.0),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 mainAxisSize: MainAxisSize.max,
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   FlutterFlowIconButton(
          //                     borderColor: Colors.transparent,
          //                     borderRadius: 30.0,
          //                     borderWidth: 1.0,
          //                     buttonSize: 50.0,
          //                     icon: Icon(
          //                       Icons.home_rounded,
          //                       color: Color(0xFF9299A1),
          //                       size: 30.0,
          //                     ),
          //                     onPressed: () async {
          //                       context.pushNamed(
          //                         HomePageWidget.routeName,
          //                         extra: <String, dynamic>{
          //                           '__transition_info__': TransitionInfo(
          //                             hasTransition: true,
          //                             transitionType: PageTransitionType.fade,
          //                             duration: Duration(milliseconds: 290),
          //                           ),
          //                         },
          //                       );
          //                     },
          //                   ),
          //                   Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     children: [
          //                       Padding(
          //                         padding: EdgeInsetsDirectional.fromSTEB(
          //                             0.0, 0.0, 0.0, 10.0),
          //                         child: FlutterFlowIconButton(
          //                           borderColor: Colors.transparent,
          //                           borderRadius: 4.0,
          //                           borderWidth: 1.0,
          //                           buttonSize: 60.0,
          //                           fillColor:
          //                               FlutterFlowTheme.of(context).primary,
          //                           icon: FaIcon(
          //                             FontAwesomeIcons.barcode,
          //                             color: Colors.white,
          //                             size: 30.0,
          //                           ),
          //                           onPressed: () async {
          //                             await showModalBottomSheet(
          //                               isScrollControlled: true,
          //                               backgroundColor:
          //                                   FlutterFlowTheme.of(context)
          //                                       .popupBack,
          //                               barrierColor:
          //                                   FlutterFlowTheme.of(context)
          //                                       .alternate,
          //                               context: context,
          //                               builder: (context) {
          //                                 return Padding(
          //                                   padding: MediaQuery.viewInsetsOf(
          //                                       context),
          //                                   child: ClientCardWidget(),
          //                                 );
          //                               },
          //                             ).then((value) => safeSetState(() {}));
          //                           },
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   FlutterFlowIconButton(
          //                     borderColor: Colors.transparent,
          //                     borderRadius: 30.0,
          //                     borderWidth: 1.0,
          //                     buttonSize: 50.0,
          //                     icon: Icon(
          //                       Icons.account_circle,
          //                       color: Color(0xFF9299A1),
          //                       size: 30.0,
          //                     ),
          //                     onPressed: () {
          //                       print('IconButton pressed ...');
          //                     },
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Знайди цей блок у своєму коді:
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.13,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 20.0, 10.0), // Збільшили відступ справа до 20
              child: Row( // Обертаємо в Row, щоб поставити меню поруч із текстом
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

                  // --- ДОДАЄМО POPUP MENU (Завдання лаби №5) ---
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
