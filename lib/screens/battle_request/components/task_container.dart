import 'package:flutter/material.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:hci_03/screens/battle_request/components/task_addbtn.dart';
import 'package:hci_03/screens/battle_request/components/task_item.dart';

class TaskContainer extends StatefulWidget {
  TaskContainer({super.key});

  @override
  _TaskContainerState createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  // 더미태스크에 접근할 때 컨트롤러를 사용합니다.나중에 서버를 구현한다면 controller 코드를 수정하면 됩니다.
  final TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      // 처음 띄울 태스크 목록을 listview 로 표시합니다.
      child: ListView.builder(
        itemCount: taskController.defualtTasks.length + 1,
        itemBuilder: (context, index) {
          if (index == taskController.defualtTasks.length) {
            return TaskAddButton( // 태스크 '직접 입력하기' 버튼을 클릭하면 현재 뷰에 추가함
              addTask: (title, emoji) {
                setState(() {  // 컨트롤러를 통해 task 를 추가합니다.
                  taskController.addTask(title, emoji);
                });
              },
            );
          } else {
            return TaskItem(
              task: taskController.defualtTasks[index],
              onToggleCheck: (task) {
                setState(() {
                  // 만약 태스크가 체크된다면 컨트롤러를 통해 toggleTask 함수를 호출하여 태스크의 체크 여부를 변경함
                  taskController.toggleTask(task);
                });
              },
            );
          }
        },
      ),
    );
  }
}
