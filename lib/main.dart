import 'package:evently_c13_online/core/providers/locale_provider.dart';
import 'package:evently_c13_online/core/providers/theme_provider.dart';
import 'package:evently_c13_online/core/theme/app_theme.dart';
import 'package:evently_c13_online/model/event_dm.dart';
import 'package:evently_c13_online/ui/add_event/add_event.dart';
import 'package:evently_c13_online/ui/event_details/event_details.dart';
import 'package:evently_c13_online/ui/home_screen/home_screen.dart';
import 'package:evently_c13_online/ui/login/login_screen.dart';
import 'package:evently_c13_online/ui/onbording/on_boarding.dart';
import 'package:evently_c13_online/ui/onbording/onboarding_setup_screen.dart';
import 'package:evently_c13_online/ui/signup_screen/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform, Automatic flutter installation
      options: FirebaseOptions(
    apiKey: "AIzaSyCHbr5qa_-eVTSc3oBSOiwejWykfolI-24",
    appId: "1:1036082477317:android:b75f1afe31d981a5bcdf6c",
    messagingSenderId: "",
    projectId: "evently-fcb2c",
  ));
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
      ),
    ], child: MyApp()),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  late ThemeProvider themeProvider;
  late LocaleProvider localeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(localeProvider.locale),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      routes: {
        OnboardingSetupScreen.routeName: (_) => OnboardingSetupScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SignupScreen.routeName: (_) => SignupScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        AddEvent.routeName: (_) => AddEvent(),
        OnBoarding.routeName: (_) => OnBoarding(),
        EventDetails.routeName: (context){
          var event = ModalRoute.of(context)?.settings.arguments as EventDM;
          return EventDetails(eventModel: event);
        },
      },
      initialRoute: OnboardingSetupScreen.routeName,
    );
  }
}
