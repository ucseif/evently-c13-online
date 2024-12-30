import 'package:evently_c13_online/core/providers/locale_provider.dart';
import 'package:evently_c13_online/core/providers/theme_provider.dart';
import 'package:evently_c13_online/core/theme/app_theme.dart';
import 'package:evently_c13_online/ui/login/login_screen.dart';
import 'package:evently_c13_online/ui/onbording/onboarding_setup_screen.dart';
import 'package:evently_c13_online/ui/signup_screen/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDf7oO7fF7We7ChS4aknvi8i-7fVSb1PiA",
        appId: "1:361454085331:android:198f6916015a7d8d3b6026",
        messagingSenderId: "",
        projectId: "evently-mon-c13"),
  );
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
      },
      initialRoute: OnboardingSetupScreen.routeName,
    );
  }
}
