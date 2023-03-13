import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class WaterCounter3 extends StatefulWidget {
  final VoidCallback switchView;
  const WaterCounter3({
    Key? key,
    required this.switchView,
  }) : super(key: key);

  @override
  State<WaterCounter3> createState() => _WaterCounter3State();
}

class _WaterCounter3State extends State<WaterCounter3> {

  final TextEditingController waterController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.watch<BackEnd>();
    waterController.text = "${context.watch<BackEnd>().currentWater.round()}";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text("water intake", style: Constants().mediumText.copyWith(color: Constants().primaryColor)),
                  Text("1.5 liters recommended", style: Constants().smallText.copyWith(color: Colors.grey)),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: (){widget.switchView();}, icon: const FaIcon(FontAwesomeIcons.rightLeft, color: Colors.transparent,), iconSize: 15),
            ],
          ),
          Constants().spacing,
          Center(
            child: CircularPercentIndicator(
              animateFromLastPercent: true,
              radius: MediaQuery.of(context).size.width * 0.20,
              lineWidth: 20,
              percent: context.watch<BackEnd>().currentWater / context.watch<BackEnd>().waterGoal,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Constants().primaryColor,
              backgroundColor: Colors.grey,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${(context.watch<BackEnd>().waterGoal - context.watch<BackEnd>().currentWater).floor()}", style: TextStyle(color: Constants().primaryColor, fontSize: 30), textAlign: TextAlign.center,),
                  Text("remaining", style: TextStyle(color: Constants().primaryColor), textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          Constants().spacing,
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 150);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 30,),
                      const Spacer(),
                      const Text("+ 150ml")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 200);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 35,),
                      const Spacer(),
                      const Text("+ 200ml")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 250);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 40,),
                      const Spacer(),
                      const Text("+ 250ml")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 300);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 45,),
                      const Spacer(),
                      const Text("+ 300ml")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 350);
                  },
                  child: Column(
                    children: [
                      const Spacer(),
                      FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 50,),
                      const Spacer(),
                      const Text("+ 350ml")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Constants().spacing,
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 50,
                child: TextField(
                  controller: amountController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9\.-]')),
                  ],
                ),
              ),
              const Text("ml"),
              GestureDetector(
                onTap: () {
                  context.read<BackEnd>().addWater(double.parse(amountController.text));
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Constants().primaryColor,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("add", style: TextStyle(color: Colors.white)),
                ),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}