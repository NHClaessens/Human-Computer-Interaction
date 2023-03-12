import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class WaterCounter2 extends StatefulWidget {
  final VoidCallback switchView;
  const WaterCounter2({
    Key? key,
    required this.switchView,
  }) : super(key: key);

  @override
  State<WaterCounter2> createState() => _WaterCounter2State();
}

class _WaterCounter2State extends State<WaterCounter2> {
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              IconButton(onPressed: (){widget.switchView();}, icon: FaIcon(FontAwesomeIcons.rightLeft, color: Constants().primaryColor,), iconSize: 15),
            ],
          ),
          CircularPercentIndicator(
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
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 50,
                child: TextField(
                  controller: amountController,
                ),
              ),
              Text("ml"),
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