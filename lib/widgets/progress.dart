import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/provider.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {

  Widget progressBar(double current, double goal) {
    return SizedBox(
      height: 5,
      width: MediaQuery.of(context).size.width - 130,
      child: Stack(
        children: [
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.grey),),
          Container(width: (MediaQuery.of(context).size.width - 130) * (current / goal), decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Constants().accentColor),),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    context.watch<BackEnd>();
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Constants().primaryColor
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: context.read<BackEnd>().habits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 20, height: 20, child: FaIcon(context.read<BackEnd>().habits[index].icon, color: Constants().accentColor,)),
                    Constants().spacing,
                    Text(context.read<BackEnd>().habits[index].title, style: TextStyle(color: Colors.grey.shade100),),
                    const Spacer(),
                    Text("${context.read<BackEnd>().habits[index].current}/${context.read<BackEnd>().habits[index].goal} ${context.read<BackEnd>().habits[index].unit}", style: TextStyle(color: Colors.grey.shade100),),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    progressBar(context.read<BackEnd>().habits[index].current, context.read<BackEnd>().habits[index].goal),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}