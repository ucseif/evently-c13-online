import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:evently_c13_online/ui/shared_widgets/language_switch.dart';
import 'package:evently_c13_online/ui/shared_widgets/theme_switch.dart';
import 'package:evently_c13_online/ui/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/loginScreen";

  LoginScreen({super.key});

  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.asset(
                AppAssets.appVerticalLogoImage,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    prefixIcon: const Icon(EvaIcons.email),
                    hintText: appLocalizations.email),
              ),
              const SizedBox(height: 16),
              TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    prefixIcon: const Icon(EvaIcons.lock),
                    suffixIcon: const Icon(EvaIcons.eye),
                    hintText: appLocalizations.password),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(appLocalizations.forgetPassword),
                  )
                ],
              ),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: () {}, child: Text(appLocalizations.login)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appLocalizations.dontHaveAccount,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.routeName);
                    },
                    child: Text(appLocalizations.signup),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Brand(Brands.google),
                      const SizedBox(width: 8),
                      Text(appLocalizations.googleLogin),
                    ],
                  ),),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LanguageSwitch(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
