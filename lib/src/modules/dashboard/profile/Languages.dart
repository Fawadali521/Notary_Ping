
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../styles.dart';
class Languages extends StatefulWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const  IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Palette.primaryColor.withOpacity(0.7),

        title: Text('Languages', style: TextStyles().appBarTitleWhite,),
      ),
      body: ListView(
        padding:   EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20
        ),
        children: [
           Padding(
             padding: const EdgeInsets.only(bottom: 20),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('English', style: TextStyles.normalHeading,),
                Image.asset('assets/icon/tick.png', height: 24,)

              ],
          ),
           ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                    opacity: 0.7,
                    child: Text('Spanish', style: TextStyles.normalHeading,)),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                    opacity: 0.7,
                    child: Text('Spanish', style: TextStyles.normalHeading,)),
 
              ],
            ),
          )
        ],
      ),

    );
  }
}
