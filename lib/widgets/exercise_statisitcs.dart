import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class ExercisesStatistics extends StatelessWidget {
  ExercisesStatistics({super.key});

  final TextEditingController weightController = TextEditingController();

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
                  Text("${context.watch<BackEnd>().weight} KG", style: Constants().largeText.copyWith(color: Colors.white),),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.read<BackEnd>().setPopup(
                        SizedBox(
                          width: 200,
                          height: 100,
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: "Current weight in kg"
                            ),
                            keyboardType: TextInputType.number,
                            controller: weightController,
                          ),
                        ),
                        (){
                          context.read<BackEnd>().addWeight(double.parse(weightController.text));
                          weightController.clear();
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Constants().accentColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Constants().spacing,
                          FaIcon(FontAwesomeIcons.weightScale, color: Constants().primaryColor,),
                          Constants().spacing,
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Sparkline(
                  data: context.watch<BackEnd>().weights,
                  useCubicSmoothing: true,
                  cubicSmoothingFactor: 0.2,
                  lineColor: Colors.white,
                  lineWidth: 2,
                  pointsMode: PointsMode.last,
                  pointColor: Colors.white,
                  pointSize: 10,
                ),
              )
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
                  Text("kcal burned", style: Constants().smallText.copyWith(color: Colors.grey))
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