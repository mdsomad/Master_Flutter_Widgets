import 'package:flutter/material.dart';
import 'package:master_flutter/help_screen.dart';
import 'package:master_flutter/setting_screen.dart';
import 'package:quick_actions/quick_actions.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final QuickActions quickActions = const QuickActions();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'action_setting',
        localizedTitle: 'Setting',
        icon: 'setting',
      ),
      const ShortcutItem(
        type: 'action_help',
        localizedTitle: 'Help',
        icon: 'help',
      ),
      
    ]);




    quickActions.initialize((String shortcutType) {

      if(shortcutType == 'action_setting') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
      }else if(shortcutType == 'action_help'){
           Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
      }
      
      
    });
    
    
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Quick Actions "),
      ),
    );
  }
}
