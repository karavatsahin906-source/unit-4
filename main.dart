import 'package:flutter/material.dart' show BuildContext, AppBar, ExpansionTile, FontWeight, Icon, Icons, ListTile, ListView, MaterialApp, MaterialPageRoute, Navigator, Scaffold, StatelessWidget, Text, TextStyle, Widget, runApp;

// Import all practicals
import 'easy_1.dart' as easy1;
import 'easy_2.dart' as easy2;
import 'easy_3.dart' as easy3;
import 'easy_4.dart' as easy4;
import 'easy_5.dart' as easy5;
import 'easy_6.dart' as easy6;
import 'easy_7.dart' as easy7;
import 'easy_8.dart' as easy8;
import 'easy_9.dart' as easy9;
import 'easy_10.dart' as easy10;

import 'moderate_1.dart' as mod1;
import 'moderate_2.dart' as mod2;
import 'moderate_3.dart' as mod3;
import 'moderate_4.dart' as mod4;
import 'moderate_5.dart' as mod5;
import 'moderate_6.dart' as mod6;
import 'moderate_7.dart' as mod7;
import 'moderate_8.dart' as mod8;
import 'moderate_9.dart' as mod9;
import 'moderate_10.dart' as mod10;

import 'hard_1.dart' as hard1;
import 'hard_2.dart' as hard2;
import 'hard_3.dart' as hard3;
import 'hard_4.dart' as hard4;
import 'hard_5.dart' as hard5;
import 'hard_6.dart' as hard6;
import 'hard_7.dart' as hard7;
import 'hard_8.dart' as hard8;
import 'hard_9.dart' as hard9;
import 'hard_10.dart' as hard10;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PracticalsMenu(),
  ));
}

class PracticalsMenu extends StatelessWidget {
  const PracticalsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Practicals Menu')),
      body: ListView(
        children: [
          _buildSection(context, 'Easy Level', [
            _tile(context, '1. Names List (ListView.builder)', const easy1.Easy1()),
            _tile(context, '2. ListTile with Icon/Text', const easy2.Easy2()),
            _tile(context, '3. GridView 6 Colors', const easy3.Easy3()),
            _tile(context, '4. Navigate Push/Pop', const easy4.Easy4Home()),
            _tile(context, '5. Named Routes', const easy5.Easy5Home()), // Note: This needs route setup in MaterialApp to work fully as requested in its file
            _tile(context, '6. Simple Form Validation', const easy6.Easy6()),
            _tile(context, '7. Counter setState', const easy7.Easy7()),
            _tile(context, '8. Checkbox setState', const easy8.Easy8()),
            _tile(context, '9. Provider Counter', const easy9.Easy9()),
            _tile(context, '10. context.read/watch', const easy10.Easy10()),
          ]),
          _buildSection(context, 'Moderate Level', [
            _tile(context, '1. Product Catalog Grid', const mod1.Moderate1()),
            _tile(context, '2. Search Filter List', const mod2.Moderate2()),
            _tile(context, '3. Pass Student Object', const mod3.Moderate3()),
            _tile(context, '4. Return Data (SnackBar)', const mod4.Moderate4Home()),
            _tile(context, '5. Registration Form', const mod5.Moderate5()),
            _tile(context, '6. Login Form', const mod6.Moderate6()),
            _tile(context, '7. To-Do List setState', const mod7.Moderate7()),
            _tile(context, '8. Shopping Cart Provider', const mod8.Moderate8()),
            _tile(context, '9. Star Rating Widget', const mod9.Moderate9()),
            _tile(context, '10. Star Pattern rows', const mod10.Moderate10()),
          ]),
          _buildSection(context, 'Hard Level', [
            _tile(context, '1. Multi-step Form Wizard', const hard1.Hard1()),
            _tile(context, '2. E-commerce App Provider', const hard2.Hard2()),
            _tile(context, '3. Todo Riverpod', const hard3.Hard3() as Widget),
            _tile(context, '4. Counter BLoC', const hard4.Hard4()),
            _tile(context, '5. Toggle List/Grid View', const hard5.Hard5()),
            _tile(context, '6. Complex Form Save', const hard6.Hard6()),
            _tile(context, '7. Dark/Light Mode Provider', const hard7.Hard7()),
            _tile(context, '8. Pyramid Pattern', const hard8.Hard8()),
            _tile(context, '9. Nested Navigation', const hard9.Hard9()),
            _tile(context, '10. Multi-user Login Provider', const hard10.Hard10()),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> tiles) {
    return ExpansionTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      children: tiles,
    );
  }

  Widget _tile(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
    );
  }
}
