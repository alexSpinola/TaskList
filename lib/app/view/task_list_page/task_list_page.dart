import 'package:flutter/material.dart';
import 'package:lista_de_tareas/app/model/task.dart';
import 'package:lista_de_tareas/app/repository/task_repository.dart';
import 'package:lista_de_tareas/app/view/components/logo_esquina.dart';
import 'package:lista_de_tareas/app/view/components/texto_w600.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {

  final TaskRepository taskRepository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const _Header(),
          Expanded(
            child: FutureBuilder<List<Task>>(
              future: taskRepository.getTasks(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(!snapshot.hasData || snapshot.data!.isEmpty){
                  return const Center(
                    child: Text('No hay tareas'),
                  );
                }
                return _TaskList(
                  snapshot.data!,
                  onTapDoneChange: (task){
                    task.done = !task.done;
                    taskRepository.saveTasks(snapshot.data!);
                    setState(() {});
                   },
                );
              }
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTaskModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }


  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _NewTaskModal(
        onTaskCreated: (Task task) {
          taskRepository.addTask(task);
          setState(() {});
        },
      ),
    );
  }
}


//MODAL TO ADD A NEW TASK
class _NewTaskModal extends StatelessWidget {
  _NewTaskModal({Key? key, required this.onTaskCreated}) : super(key: key);

  final _controllerInputText = TextEditingController();
  final void Function(Task task) onTaskCreated;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              width: 100,
              height: 3,
              color: Theme.of(context).colorScheme.primary,
            )
          ],),
          const SizedBox(height: 26,),
          const Tipografia('Nueva Tarea'),
          const SizedBox(height: 26,),
          TextField(
            controller: _controllerInputText,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
               hintText: ('Descripción de la tarea'),
            ),
          ),
          const SizedBox(height: 26,),
          ElevatedButton(
              onPressed: (){
                if(_controllerInputText.text.isNotEmpty){
                  final task = Task(_controllerInputText.text);
                  onTaskCreated(task);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}



//CLASE PARA DEFINIR EL WIDGET DEL LISTADO
class _TaskList extends StatelessWidget {
  const _TaskList(this.taskList,{
    required this.onTapDoneChange,
    super.key,
  });

  final List<Task> taskList;
  final void Function(Task task) onTapDoneChange;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: Tipografia('Tareas:'),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView.separated(
              itemBuilder: (_, index) => _TaskItem(
                taskList[index],
                onTap: () => onTapDoneChange(taskList[index]),
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 15,),
              itemCount: taskList.length),
        ),
      ),
    ]);
  }
}


//CLASE PARA DEFINIR EL WIDGET DE LA CABECERA
class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Row(children: const [LogoEsquina()]),
          Column(
            children: [
              Image.asset(
                'assets/images/tasks-list-image.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 16),
              const Tipografia('Completa tus tareas', color: Colors.white),
              const SizedBox(height: 24),
            ],
          )
        ],
      ),
    );
  }
}


//CARD MODEL
class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {Key? key, this.onTap}) : super(key: key);

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
            child: Row(
              children: [
                Icon(
                  task.done
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(task.title),
              ],
            ),
          )),
    );
  }
}
