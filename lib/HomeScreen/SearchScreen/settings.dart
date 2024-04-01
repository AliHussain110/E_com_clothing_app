import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class MyWidget extends StatefulWidget {
  // const MyWidget({Key key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('Account'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              value: const Text('English'),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.cloud),
              title: const Text('Envirment'),
              value: const Text('Production'),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.device_hub),
              title: const Text('Platform'),
              value: const Text('Default'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                if (check) {
                  setState(() {
                    check = false;
                  });
                } else {
                  setState(() {
                    check = true;
                  });
                }
              },
              initialValue: check,
              leading: const Icon(Icons.format_paint),
              title: const Text('Enable custom theme'),
            ),
          ],
        ),
      ],
    );
  }
}
