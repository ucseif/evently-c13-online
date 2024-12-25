import 'package:evently_c13_online/core/assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';
  SignupScreen({super.key});
  late AppLocalizations appLocalizations;
  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.register),
      ),
      body: Form(
        child: ListView(
          padding:const EdgeInsets.all(16),
          children: [
            Image.asset(
              AppAssets.appVerticalLogoImage,
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            TextFormField(
              style: Theme.of(context).textTheme.bodyLarge,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  prefixIcon: const Icon(EvaIcons.person),
                  hintText: appLocalizations.name),
            ),
            const SizedBox(height: 16),
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
            TextFormField(
              style: Theme.of(context).textTheme.bodyLarge,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  prefixIcon: const Icon(EvaIcons.lock),
                  suffixIcon: const Icon(EvaIcons.eye),
                  hintText: appLocalizations.repassword),
            ),
            const SizedBox(height: 32),
            FilledButton(onPressed: (){}, child: Text(appLocalizations.createAccount)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appLocalizations.alreadyHaveAccount,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(appLocalizations.login),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
