import 'package:notary_ping/index.dart';
import 'package:notary_ping/src/modules/dashboard/DashboardScreen.dart';

import 'src/services/Languages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const NotaryPingApp());
}

class NotaryPingApp extends StatelessWidget {
  const NotaryPingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        translations: Languages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        defaultTransition: Transition.fadeIn,
        title: 'Notary Ping',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        home: const Dashboard(),
      ),
    );
  }
}
