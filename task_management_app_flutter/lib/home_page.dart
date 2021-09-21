import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app_flutter/add_task.dart';
import 'package:task_management_app_flutter/models/list_items.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  List<ListItems> _tasks = [];

  void updateInformation(List<ListItems> tasks) {
    setState(() {
      _tasks..addAll(tasks);
    });
  }

  void moveToSecondScreen() async {
    final tasks = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTask()));
    updateInformation(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Tasks",
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 500,
              child: Center(
                  child: (_tasks.length == 0)
                      ? Text(
                          "Nothing to show for now!",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                          ),
                        )
                      : ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Title: ${_tasks[index].title}"),
                                  Text("Text: ${_tasks[index].text}"),
                                  Row(
                                    children: [
                                      Text(
                                          "Due Time: ${_tasks[index].selectedTime}"),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _tasks.length,
                        )),
            ),
            InkWell(
              onTap: () {
                moveToSecondScreen();
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.blueAccent],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
