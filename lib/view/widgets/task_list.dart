import 'package:flutter/material.dart';
import 'package:getx_todo_mvc/view/widgets/task_tile.dart';
import '../../model/todo_model.dart';


class TasksList extends StatelessWidget {
  const TasksList({Key? key, required this.taskList}) : super(key: key);
  final List<ModelTodo> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isOen) => TaskTile(
                      task: task,
                    ),
                    body: ListTile(
                      title: SelectableText.rich(
                        TextSpan(children: [
                          const TextSpan(
                            text: 'Task\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: task.title,
                            style: const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          const TextSpan(
                            text: '\n\nDescription\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: task.description,
                            style: const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

/*Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) => TaskTile(task: taskList[index],),
      ),
    )*/
}
