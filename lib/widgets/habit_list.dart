import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                        ],
                      ),
                    ), 
                    (){
                      context.read<BackEnd>().habits.add(
                        HabitModel(
                          icon: FaIcon(FontAwesomeIcons.book, color: Constants().accentColor,), 
                          title: titleController.text, 
                          current: 0, 
                          goal: int.parse(goalController.text), 
                          unit: unitController.text
                        )
                      );
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
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: habits[index].current == habits[index].goal ? Constants().primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    habits[index].current == habits[index].goal 
                      ? context.read<BackEnd>().resetHabit(index)
                      : context.read<BackEnd>().completeHabit(index);
                  },
                  child: CircleAvatar(
                    backgroundColor: Constants().accentColor,
                    radius: 20,
                    child: habits[index].current == habits[index].goal ? FaIcon(FontAwesomeIcons.check, color: Constants().primaryColor,) : null,
                  ),
                ),
                const Spacer(),
                Text(habits[index].title, style: Constants().mediumText.copyWith(color: habits[index].current == habits[index].goal ? Colors.white : Constants().primaryColor),),
                const Spacer(),
                habits[index].icon
              ],
            ),
          );
        },
      ),
    );
  }
}