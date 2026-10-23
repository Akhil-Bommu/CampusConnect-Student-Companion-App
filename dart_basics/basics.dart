class Task {
  String title;
  bool isDone;
  Task(this.title, {this.isDone = false});
}

void printTasks(List<Task> tasks) {
  for (var t in tasks) {
    print('${t.title} - ${t.isDone ? "Done" : "Pending"}');
  }
}

void main() {
  String student = 'Akhil';          // variable
  int pending = 2;                   // int
  List<Task> tasks = [               // list
    Task('Submit lab record'),
    Task('Prepare for quiz'),
  ];

  print('Hello $student, you have $pending tasks');
  printTasks(tasks);

  tasks[0].isDone = true;            // modify an object
  if (tasks[0].isDone) {             // condition
    print('First task completed!');
  }
}