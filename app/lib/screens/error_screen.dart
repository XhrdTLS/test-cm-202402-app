import 'package:cm/widgets/barra_app.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BarraApp(titulo: 'Error'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.error, size: 100, color: Colors.red),
            Text('Ha ocurrido un problema y no se puede procesar su solicitud',
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}