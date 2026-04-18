import 'package:flutter/material.dart';
import '/auth/firebase_auth/auth_util.dart'; // Для отримання імені користувача
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart'; // Щоб працював context.pushNamed

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthUserStreamWidget(
                    builder: (context) => Text(
                      currentUserDisplayName.isNotEmpty
                          ? currentUserDisplayName
                          : 'Користувач',
                      style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    currentUserEmail,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Roboto',
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ],
              ),
            ),
            // Пункти меню
            _buildMenuItem(context, Icons.home_rounded, 'Головна', 'HomePage'),
            _buildMenuItem(context, Icons.trending_up, 'Мій прогрес', 'LoyalProgress'),
            _buildMenuItem(context, Icons.person_outline, 'Профіль', 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String routeName) {
    return ListTile(
      leading: Icon(icon, color: FlutterFlowTheme.of(context).primaryText),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Закриваємо Drawer перед переходом
        context.pushNamed(routeName);
      },
    );
  }
}