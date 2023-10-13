

import 'package:flutter/material.dart';

import '../../../../styles.dart';
class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Center(child:
        Text('Messsages', style: TextStyles.heading1,),),
      ),
    );
  }
}
