import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c11_friday/providers/settings_provider/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider myProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                myProvider.changeThemeMode(ThemeMode.light);
              },
              child: myProvider.currentTheme == ThemeMode.light
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.light)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                myProvider.changeThemeMode(ThemeMode.dark);
              },
              child: myProvider.currentTheme == ThemeMode.dark
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.dark)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget buildSelectedThemeItem(String selectedTheme) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(selectedTheme,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.primary))),
        Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.primary,
          size: 30,
        )
      ],
    );
  }

  Widget buildUnSelectedThemeItem(String unSelectedTheme) {
    return Row(
      children: [
        Text(
          unSelectedTheme,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
