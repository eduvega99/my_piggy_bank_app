import 'package:flutter/material.dart';
import 'package:my_piggy_bank_app/themes/app_themes.dart';


class HistoryScreen extends StatelessWidget {

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Historial'),
          bottom: const TabBar(
            indicatorColor: AppTheme.secondaryColor,
            tabs: [
              Tab(text: 'Todos'),
              Tab(text: 'Gastos'),
              Tab(text: 'Ingresos'),
            ] 
          ),
        ),
        body: const TabBarView(
          children: [
            Text('Todos'),
            Text('Gastos'),
            Text('Ingresos'),
          ]
        )
       ),
    );
  }
  
}