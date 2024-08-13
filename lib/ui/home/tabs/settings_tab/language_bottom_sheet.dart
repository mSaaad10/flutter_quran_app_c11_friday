import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c11_friday/providers/settings_provider/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeAppLanguage('en');
              },
              child: provider.currentLang == 'en'
                  ? buildSelectedThemeItem(AppLocalizations.of(context).english)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context).english)),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                provider.changeAppLanguage('ar');
              },
              child: provider.currentLang == 'ar'
                  ? buildSelectedThemeItem(AppLocalizations.of(context).arabic)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context).arabic)),
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
          size: 30,
          weight: 100,
          color: Theme.of(context).colorScheme.primary,
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
