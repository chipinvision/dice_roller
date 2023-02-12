///////////////////////////////////////////
// Instagram: @invisionchip
// Github: https://github.com/chipinvision
// LIKE | SHARE | FOLLOW
///////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dice_roler/utils/appcolors.dart';
import 'dart:math';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice-Roller',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
      ),
      home: const DiceView(),
    );
  }
}

class DiceView extends StatefulWidget {
  const DiceView({Key? key}) : super(key: key);

  @override
  State<DiceView> createState() => _DiceViewState();
}

class _DiceViewState extends State<DiceView> {

  int dice_no = 1;

  void rollDice(){
    setState(() {
      dice_no = Random().nextInt(6) + 1;
    });
  }

  Future aboutDialog(){
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgColor,
        title: const Text(
            'Dice-Roller',
          style: TextStyle(
            color: AppColors.fgColor
          ),
        ),
        content: const Text(
            'This game is made by the developer while he was procrastinating.',
          style: TextStyle(
              color: AppColors.fgColor
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(ctx).pop();},
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
            "Dice-Roller",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: AppColors.fgColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              aboutDialog();
            },
            icon: const Icon(Icons.more_vert, color: AppColors.fgColor,),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    onPressed: (){
                      rollDice();
                    },
                    backgroundColor: AppColors.fgColor,
                    label: const Text(
                        "Player 1",
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    icon: const Icon(Icons.refresh, color: AppColors.bgColor,),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset('assets/dice$dice_no.png'),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    onPressed: (){
                      rollDice();
                    },
                    backgroundColor: AppColors.fgColor,
                    label: const Text(
                      "Player 2",
                      style: TextStyle(
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    icon: const Icon(Icons.refresh, color: AppColors.bgColor,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

