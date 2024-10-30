import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../core/core.dart';
import '../../../data/data_sources/google/google_service.dart';
import '../views.dart';

class LoginPage extends StatelessWidget {
  static final Logger _logger = Logger();

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
             children: [
               OutlinedButton(
                  onPressed: () {
                    GoogleService.logIn().then((result) {
                      if (result) {
                        _logger.i('Sesión Iniciada');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
               
                                ///Retorna a BottomNavBar ya que es un Scaffold, y ayuda con el manejo de rutas
                                builder: (context) => const BottomNavBar()));
                      } else {
                        _logger.e('PROBLEMA con Login');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ErrorScreen();
                        }));
                      }
                    });
                  },
                  child: Row(
                    children: [const Icon(AppIcons.profile), Text('Iniciar Sesión',style: StyleText.bodyBold)],
                  )),
             ],
           ),
        ),
      ),
    );
  }
}