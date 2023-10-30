

import 'package:flutter/material.dart';
 import 'package:flutter/services.dart';
 import 'package:notary_ping/styles.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return   Scaffold(

      appBar: AppBar(
        centerTitle: true,
        iconTheme: const  IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Palette.secondaryColor,

        title: Text('Term and condition', style: TextStyles().appBarTitleWhite,),
      ),
      body: ListView(
        padding: const  EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15

        ),
        children: [
          
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20
            ),
            child: Image.asset('assets/images/terms.png',
            height: height * 0.3,),
          ),

          const Text("Term and condition " , style: TextStyles.normalHeading,),

           // Html(
           //   data: '<a href="https://eezly.com/terms/">Terms of Service</a>',
           //
           //
           //  ),

          Wrap(
            children: [
              Text("Our notary services"
              " are designed to ensure the authenticity "
              "and legality of your documents while upholding "
    "the highest standards of professionalism and ethical conduct. "
    "Our notary,, will carefully verify your identity"
    "and authenticate your signature in accordance with applicable"
    " laws and regulations. It is essential to understand the content of "
    "your documents before presenting them for notarization, "
    "as we do not provide legal advice. We maintain the strictest"
    " confidentiality regarding your"
                  " information, and our  are committed to delivering reliable and accurate notarial services",



                style: TextStyles().privacyBLack,

              )

            ],
          ),

        ],
      ),
    );
  }
}
