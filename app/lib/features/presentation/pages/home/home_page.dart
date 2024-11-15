import 'package:flutter/material.dart';
import 'package:mi_reclamo/features/presentation/pages/home/widgets/assigned_claim.dart';
import 'package:mi_reclamo/features/presentation/pages/home/widgets/statics_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    String fullName = prefs.getString('name') ?? 'Usuario';
    setState(() {
      String firstName = fullName.split(' ').first;
      _userName =
          firstName[0].toUpperCase() + firstName.substring(1).toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigation(
        title: "Administrador",
        isMainScreen: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("¡Hola $_userName!", style: StyleText.headline),
              const SizedBox(height: 20),
              // Tablero de Estadísticas
              Text("Resumen de las Solicitudes", style: StyleText.label),
              const SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.2,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  StatCard(
                    icon: AppIcons.ticket,
                    value: "25",
                    label: "Solicitudes Totales",
                    color: AppTheme.lightBlue,
                  ),
                  StatCard(
                    icon: AppIcons.claim,
                    value: "10",
                    label: "Sin Resolver",
                    color: AppTheme.lightRed,
                  ),
                  StatCard(
                    icon: AppIcons.pending,
                    value: "12",
                    label: "Pendientes",
                    color: AppTheme.lightOrange,
                  ),
                  StatCard(
                    icon: AppIcons.done,
                    value: "3",
                    label: "Resueltos",
                    color: AppTheme.lightGreen,
                  ),
                ],
              ),

              const SizedBox(height: 24),
              // Asignados
              Text("Solicitudes Asignadas", style: StyleText.label),
              const SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => const AssignedClaim(),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/*class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopNavigation(titulo: "Administrador"),
            Text("Hola! ", style: StyleText.headline),
            const SizedBox(height: 20),
            // Tablero de Estadísticas
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2,
              physics: const NeverScrollableScrollPhysics(),
              children: [
              StatCard(
                icon: AppIcons.ticket,
                value: "25",
                label: "Solicitudes Totales",
                color: AppTheme.lightBlue, 
              ),
              StatCard(
                icon: AppIcons.claim,
                value: "10",
                label: "Sin Resolver",
                color: AppTheme.lightRed,
              ),
              StatCard(
                icon: AppIcons.pending,
                value: "12",
                label: "Pendientes",
                color: AppTheme.lightOrange,
              ),
              StatCard(
                icon: AppIcons.done,
                value: "3",
                label: "Resueltos",
                color: AppTheme.lightGreen,
              ),
              ],
            ),

            const SizedBox(height: 24),
            // Asignados
            Text("Solicitudes Asignadas", style: StyleText.label),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => const AssignedClaim(),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}*/


