import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', '01'),
        Locale('fa', '98'),
      ],
      locale: const Locale('fa'),
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme('fa')
          : MyAppThemeConfig.light().getTheme('fa'),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const MyHomePage({super.key, required this.toggleThemeMode});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SkillType { photoShop, adobeXd, illustrator, afterEffect, lightRoom }

class _MyHomePageState extends State<MyHomePage> {
  SkillType _skill = SkillType.photoShop;
  void updateSelectedSkill(SkillType skillType) {
    setState(() {
      _skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(localization.profileDemo),
          actions: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Icon(CupertinoIcons.bubble_left),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: InkWell(
                  onTap: widget.toggleThemeMode,
                  child: const Icon(CupertinoIcons.ellipsis_vertical)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
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
                          localization.name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          localization.shortDescription,
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
                              localization.locale,
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
                      localization.description)
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 8, right: 24),
              child: Row(
                children: [
                  Text(
                    localization.skills,
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 32, right: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    localization.personalInformation,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localization.email,
                      prefixIcon: const Icon(CupertinoIcons.at),
                      hintMaxLines: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: localization.password,
                      prefixIcon: const Icon(CupertinoIcons.lock),
                      hintMaxLines: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            localization.save,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ))),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            )
          ]),
        ));
  }
}

class MyAppThemeConfig {
  static const String faPrimaryFontFamily = 'IranYekan';
  final Color primaryColor = Colors.pink.shade300;
  final Color primaryTextColor;
  final Color seconderyTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appbarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        seconderyTextColor = Colors.white70,
        surfaceColor = Colors.white,
        backgroundColor = const Color.fromARGB(255, 30, 30, 30),
        appbarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        seconderyTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Colors.black,
        backgroundColor = Colors.white,
        appbarColor = const Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme(String languageCode) {
    return ThemeData(
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
        scaffoldBackgroundColor: backgroundColor,
        brightness: brightness,
        useMaterial3: true,
        primarySwatch: Colors.pink,
        primaryColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor))),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white10,
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: appbarColor, foregroundColor: primaryTextColor),
        textTheme:
            languageCode == 'fa' ? faPrimaryTextTheme : enPrimaryTextTheme);
  }

  TextTheme get enPrimaryTextTheme => GoogleFonts.latoTextTheme(TextTheme(
      bodyMedium: TextStyle(fontSize: 12, color: primaryTextColor),
      bodyLarge: TextStyle(fontSize: 15, color: seconderyTextColor),
      titleLarge:
          TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
      titleSmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: primaryTextColor)));
  TextTheme get faPrimaryTextTheme => TextTheme(
      bodyMedium: TextStyle(
          fontSize: 12,
          color: primaryTextColor,
          fontFamily: faPrimaryFontFamily),
      bodyLarge: TextStyle(
          fontSize: 15,
          color: seconderyTextColor,
          fontFamily: faPrimaryFontFamily),
      titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
          fontFamily: faPrimaryFontFamily),
      titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: primaryTextColor,
          fontFamily: faPrimaryFontFamily));
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
