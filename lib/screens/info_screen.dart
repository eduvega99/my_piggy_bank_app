import 'package:flutter/material.dart';

import 'package:my_piggy_bank_app/widgets/transaction_dialog.dart';


class InfoScreen extends StatelessWidget {

  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('My Piggy Bank')),
      body: const _Info(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.credit_card_rounded),
        onPressed: () => showDialog(
          context: context, 
          barrierDismissible: false,
          builder: ( _ ) => const TransactionDialog()
        )
      )
    );
  }
}

class _Info extends StatelessWidget {
  
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Hola mundo')
      ],
    );
  }

}
