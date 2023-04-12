import 'package:flutter/material.dart';
import 'package:lista_de_tareas/app/view/components/logo_esquina.dart';
import 'package:lista_de_tareas/app/view/components/texto_w600.dart';
import 'package:lista_de_tareas/app/view/task_list_page/task_list_page.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: const [
              LogoEsquina(),
            ],
          ),

          const SizedBox(height: 79,),

          Image.asset('assets/images/onboarding.png',
            width: 180,
            height: 168,
          ),

          const SizedBox(height: 99,),

          const Tipografia('Lista de Tareas'),

          const SizedBox(height: 50,),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text('La mejor forma para que no se te olvide nada es '
                'anotarlo. Guardar tus tareas y ve completando poco a poco '
                'para aumentar tu productividad',
              textAlign: TextAlign.center
            ),
          ),

          const SizedBox(height: 90,),

          ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const TaskListPage();
                }));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 54),
              ),
              child: const Text('Empezar'),
          ),
        ],
      ),
    );
  }
}
