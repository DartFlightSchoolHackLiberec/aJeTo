import 'package:angular/angular.dart';

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(override: '*')
import 'dart:mirrors';

/* Use the @NgController annotation to indicate that this class is an
 * Angular controller. Angular will instantiate the controller if
 * it finds an element matching its selector in the DOM.
 *
 * The selector field defines the CSS selector that will trigger the
 * controller. It can be any valid CSS selector which does not cross
 * element boundaries.
 *
 * The publishAs field specifies that the controller instance should be
 * assig  ned to the current scope under the name specified.
 *
 * The controller's public fields are available for data binding from the view.
 * Similarly, the controller's public methods can be invoked from the view.
 */
@NgController(selector: '[tasks]', publishAs: 'ctrl')
class TasksController {

  List<Task> tasks;

  TasksController() {
    tasks = _loadData();
  }

  Task selectedTask;

  void selectRecipe(Task task) {
    selectedTask = task;
  }

  void archiveTask(int taskIdx) {
//    Task tmpTask = tasks.elementAt(taskIdx);
    tasks.removeAt(taskIdx);

  }

  void finishTask(taskIdx) {
    Task tmpTask = tasks.elementAt(taskIdx);

    print(tasks.elementAt(taskIdx));
    tmpTask.done = true;
  }

  List<Task> _loadData() {
    return [new Task('do dart tutorial', 'dart', 'Lorem ipsum dolor sit amet daaaart ufffffffffff, consectetur adipisicing elit.', false), new Task('do dartAngular tutorial', 'angular', 'pomooooc angular dart Lorem ipsum dolor sit amet, consectetur adipisicing elit.', false), new Task('learn about js this', 'js', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', false)];
  }
}

class Task {
  String name;
  String category;
  String comment;
  bool done;

  Task(this.name, this.category, this.comment, this.done);
}

class AjeToAppModule extends Module {
  AjeToAppModule() {
    type(TasksController);
  }
}

void main() {
  ngBootstrap(module: new AjeToAppModule());
}
