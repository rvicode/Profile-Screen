import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
          brightness: Brightness.dark,
          useMaterial3: true,
          primaryColor: Colors.pink.shade300,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          textTheme: GoogleFonts.latoTextTheme(const TextTheme(
              bodyMedium: TextStyle(fontSize: 12),
              titleLarge: TextStyle(fontWeight: FontWeight.bold),
              titleSmall:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SkillType { photoShop, adobeXd, illustrator, afterEffect, lightRoom }

class _MyHomePageState extends State<MyHomePage> {
  SkillType _skill = SkillType.photoShop;
  void updateSelectedSkill(SkillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Demo'),
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Icon(CupertinoIcons.bubble_left),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 60,
                      height: 60,
                    )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Arvin Veysi',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        'Programming and Teacher',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.location_solid,
                            size: 12,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Iran, Abyek',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Row(
              children: [
                Text(
                    style: Theme.of(context).textTheme.bodyMedium,
                    'Lorem ipsum dolor sit amet, consectetur \n adipiscing  elit, sed do eiusmod tempor \n incididunt ut labore et dolore magna aliqua. Ut \n enim ad minim veniam, quis nostrud exercitation \n ullamco  laboris nisi ut aliquip ex ea commodo \n consequat.')
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 8),
            child: Row(
              children: [
                Text(
                  'Skills',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  size: 12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              direction: Axis.horizontal,
              children: [
                Skills(
                  type: SkillType.photoShop,
                  title: 'Photoshop',
                  imagePath: 'assets/images/app_icon_01.png',
                  colorShadow: Colors.blue,
                  isActive: _skill == SkillType.photoShop,
                  onTap: () {
                    updateSelectedSkill(SkillType.photoShop);
                  },
                ),
                Skills(
                  type: SkillType.adobeXd,
                  title: 'Adobe XD',
                  imagePath: 'assets/images/app_icon_05.png',
                  colorShadow: Colors.pink.shade400,
                  isActive: _skill == SkillType.adobeXd,
                  onTap: () {
                    updateSelectedSkill(SkillType.adobeXd);
                  },
                ),
                Skills(
                  type: SkillType.illustrator,
                  title: 'illustrator',
                  imagePath: 'assets/images/app_icon_04.png',
                  colorShadow: Colors.yellow.shade900,
                  isActive: _skill == SkillType.illustrator,
                  onTap: () {
                    updateSelectedSkill(SkillType.illustrator);
                  },
                ),
                Skills(
                  type: SkillType.afterEffect,
                  title: 'After Effect',
                  imagePath: 'assets/images/app_icon_03.png',
                  colorShadow: Colors.blue.shade800,
                  isActive: _skill == SkillType.afterEffect,
                  onTap: () {
                    updateSelectedSkill(SkillType.afterEffect);
                  },
                ),
                Skills(
                  type: SkillType.lightRoom,
                  title: 'Lightroom',
                  imagePath: 'assets/images/app_icon_02.png',
                  colorShadow: Colors.blue,
                  isActive: _skill == SkillType.lightRoom,
                  onTap: () {
                    updateSelectedSkill(SkillType.lightRoom);
                  },
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

class Skills extends StatelessWidget {
  final SkillType type;
  final String title;
  final String imagePath;
  final Color colorShadow;
  final bool isActive;
  final Function() onTap;

  const Skills(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.colorShadow,
      required this.isActive,
      required this.type,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(
                  10,
                ))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: colorShadow.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
