import 'package:flutter/material.dart';

class CreateChallenege extends StatefulWidget {
  const CreateChallenege({Key? key}) : super(key: key);

  @override
  CreateChallenegeState createState() => CreateChallenegeState();
}

class CreateChallenegeState extends State<CreateChallenege> {
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
