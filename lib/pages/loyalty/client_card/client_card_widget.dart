import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'client_card_model.dart';
export 'client_card_model.dart';

class ClientCardWidget extends StatefulWidget {
  const ClientCardWidget({super.key});

  @override
  State<ClientCardWidget> createState() => _ClientCardWidgetState();
}

class _ClientCardWidgetState extends State<ClientCardWidget> {
  late ClientCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).popupBack,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Кнопка "Назад"
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 0.0), // Трохи зменшив верхній відступ для альбомного режиму
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 40.0, // Трохи зменшив розмір іконки
                ),
              ),
            ),
          ),
          
          // Сама біла картка клієнта
          Expanded(
            child: Padding(
              // Відступи навколо білої картки
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0), // Внутрішні відступи
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ТЕКСТ (Ім'я та телефон)
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Картка Клієнта\n',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0, // Трохи збільшив шрифт
                                  ),
                            ),
                            TextSpan(
                              text: '\n',
                            ),
                            TextSpan(
                              text: currentUserDisplayName,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0, // Трохи збільшив шрифт
                              ),
                            ),
                            TextSpan(
                              text: '\n',
                            ),
                            TextSpan(
                              text: currentPhoneNumber,
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      
                      SizedBox(height: 16.0), // Проміжок між текстом і штрих-кодом
                      
                      // ШТРИХ-КОД (Розтягується на весь вільний простір)
                      Expanded(
                        child: Center(
                          child: AuthUserStreamWidget(
                            builder: (context) => BarcodeWidget(
                              data: valueOrDefault(currentUserDocument?.barcode, 0).toString(),
                              barcode: Barcode.code128(),
                              width: double.infinity, // Розтягуємо на всю ширину
                              height: double.infinity, // Розтягуємо на всю доступну висоту
                              color: Colors.black,
                              backgroundColor: Colors.transparent,
                              errorBuilder: (_context, _error) => SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              drawText: false,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
