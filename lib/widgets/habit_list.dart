import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconpicker/Models/IconPack.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/constants.dart';
import 'package:wellbeing_tracker/models/habit_model.dart';
import 'package:wellbeing_tracker/provider.dart';

class HabitList extends StatefulWidget {
  const HabitList({super.key});

  @override
  State<HabitList> createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController goalController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  IconData? icon;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    List<HabitModel> habits = context.watch<BackEnd>().habits;




    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListView.builder(
        key: _listKey,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: habits.length + 1,
        itemBuilder: (context, index) {
          if(index == habits.length) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Constants().accentColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<BackEnd>().setPopup(
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Column(
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              hintText: "Title"
                            ),
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: goalController,
                            decoration: const InputDecoration(
                              hintText: "Goal"
                            ),
                          ),
                          TextField(
                            controller: unitController,
                            decoration: const InputDecoration(
                              hintText: "Unit"
                            ),
                          ),
                          Constants().spacing,
                          //TODO kinda scuffed you cant see it but whatevs
                          GestureDetector(
                            onTap: () async {
                             IconData? i = await FlutterIconPicker.showIconPicker(context, iconPackModes: [IconPack.fontAwesomeIcons]);
                              setState(() {
                                icon = i;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Constants().primaryColor,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: const Text("Choose icon", style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                    ), 
                    (){
                      context.read<BackEnd>().habits.add(
                        HabitModel(
                          icon: icon ?? FontAwesomeIcons.book, 
                          title: titleController.text, 
                          current: 0, 
                          goal: double.parse(goalController.text), 
                          unit: unitController.text
                        )
                      );
                      context.read<BackEnd>().updateProgressToday();
                      titleController.clear();
                      goalController.clear();
                      unitController.clear();
                    }
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Constants().primaryColor,
                      radius: 20,
                      child: FaIcon(FontAwesomeIcons.plus, color: Constants().accentColor,),
                    ),
                    const Spacer(),
                    Text("Add new habit", style: Constants().mediumText.copyWith(color: Constants().primaryColor),),
                    const Spacer(),
                  ],
                ),
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              habits[index].current == habits[index].goal 
                ? context.read<BackEnd>().resetHabit(index)
                : context.read<BackEnd>().completeHabit(index);
            },
            onLongPress: (){
              context.read<BackEnd>().setPopup(
                const Text("Do you want to remove this habit?"),
                (){
                  context.read<BackEnd>().removeHabit(index);
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: habits[index].current == habits[index].goal ? Constants().primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Constants().accentColor,
                    radius: 20,
                    child: habits[index].current == habits[index].goal ? FaIcon(FontAwesomeIcons.check, color: Constants().primaryColor,) : null,
                  ),
                  const Spacer(),
                  Text(habits[index].title, style: Constants().mediumText.copyWith(color: habits[index].current == habits[index].goal ? Colors.white : Constants().primaryColor),),
                  const Spacer(),
                  FaIcon(habits[index].icon, color: habits[index].current == habits[index].goal ? Constants().accentColor : Constants().primaryColor,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}