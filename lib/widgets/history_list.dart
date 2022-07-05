import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_piggy_bank_app/themes/app_themes.dart';


class HistoryList extends StatelessWidget {

  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: ( _ , __ ) => const Divider(),
      itemCount: 30,
      itemBuilder: ( _, index) {
        return const _TransactionTile();
      }
    );
  }

}

class _TransactionTile extends StatelessWidget {
  
  const _TransactionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[100], 
        child: const Icon(Icons.health_and_safety, color: Colors.green)
      ),
      title: const Text('07-06-2022 13:15'),
      trailing: const Text('+15.25 €', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      subtitle: const Text('Farmacia'),
    );
  }
}

