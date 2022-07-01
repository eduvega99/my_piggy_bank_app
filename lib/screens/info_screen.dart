import 'package:flutter/material.dart';


class InfoScreen extends StatelessWidget {

  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Piggy Bank')),
      body: const _Info(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.mood_rounded),
        onPressed: () {},
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
