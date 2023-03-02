import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class WaterCounter extends StatefulWidget {
  const WaterCounter({super.key});

  @override
  State<WaterCounter> createState() => _WaterCounterState();
}

class _WaterCounterState extends State<WaterCounter> {
  @override
  Widget build(BuildContext context) {
    context.watch<BackEnd>();
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
          Text("water intake", style: Constants().mediumText.copyWith(color: Constants().primaryColor)),
          Text("1.5 liters recommended", style: Constants().smallText.copyWith(color: Colors.grey)),
          Constants().spacing,
          GestureDetector(
            onTap: () {
              context.read<BackEnd>().setWater(context.read<BackEnd>().currentWater + 300);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 50,),
                FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 50,),
                FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 50,),
                FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 50,),
                FaIcon(FontAwesomeIcons.glassWaterDroplet, color: Constants().primaryColor, size: 50,),
              ],
            ),
          ),
          Constants().spacing,
          Text("${context.watch<BackEnd>().currentWater.round()}/${context.watch<BackEnd>().waterGoal.round()} ml", style: Constants().smallText,),
          Constants().spacing,
          Slider(
            min: 0,
            max: context.read<BackEnd>().waterGoal,
            value: context.watch<BackEnd>().currentWater, 
            onChanged: (value){context.read<BackEnd>().setWater(value);},
            activeColor: Constants().primaryColor,
            inactiveColor: Colors.grey,
          )
        ],
      ),
    );
  }
}