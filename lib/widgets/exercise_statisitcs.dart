import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class ExercisesStatistics extends StatelessWidget {
  const ExercisesStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: Constants().primaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text("weight", style: Constants().mediumText,),
                  Text("${context.read<BackEnd>().weight} KG", style: Constants().largeText.copyWith(color: Colors.white),),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Constants().accentColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        FaIcon(FontAwesomeIcons.weightScale, color: Constants().primaryColor,),
                        Constants().spacing,
                        Text("${context.read<BackEnd>().weightLoss} kg", style: Constants().mediumText.copyWith(color: Constants().primaryColor))
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  // TODO maybe add graph thingy here
                ],
              ),
            ],
          ),
        ),
        Constants().spacing,
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Constants().accentColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              CircleAvatar(
                backgroundColor: Constants().primaryColor,
                radius: 20,
                child: FaIcon(FontAwesomeIcons.fire, color: Constants().accentColor,),
              ),
              Constants().spacing,
              Column(
                children: [
                  Text("1256/2200", style: Constants().smallText),
                  Text("kcal burned today", style: Constants().smallText.copyWith(color: Colors.grey))
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Constants().primaryColor,
                radius: 20,
                child: FaIcon(FontAwesomeIcons.shoePrints, color: Constants().accentColor,),
              ),
              Constants().spacing,
              Column(
                children: [
                  Text("2000/6000", style: Constants().smallText),
                  Text("total steps", style: Constants().smallText.copyWith(color: Colors.grey))
                ],
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}