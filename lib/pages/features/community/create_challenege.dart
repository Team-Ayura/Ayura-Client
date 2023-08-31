import 'package:flutter/material.dart';

class CreateChallenege extends StatefulWidget {
  const CreateChallenege({Key? key}) : super(key: key);

  @override
  _CreateChallenegeState createState() => _CreateChallenegeState();
}

class _CreateChallenegeState extends State<CreateChallenege> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Challenge'),
        ),
        body: const Center(
          child: Text('Create Challenge'),
        ));
  }
}
