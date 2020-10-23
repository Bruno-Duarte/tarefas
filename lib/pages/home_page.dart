import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tarefas/helpers/tarefa_controller.dart';
import 'package:tarefas/pages/form_page.dart';

class HomePage extends StatelessWidget {
  final TarefaController tarefaController = TarefaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Controle de tarefas'),
        ),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemBuilder: (_, i) => Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      tarefaController.tarefas.toList()[i],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormPage(
                                  tarefaControllerMobX: tarefaController,
                                  editTarefaController:
                                      tarefaController.carregarTarefa(i),
                                  isNew: false,
                                  indiceTarefa: i,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            mostrarAlertDialog(context, i);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          itemCount: tarefaController.tarefas.toList().length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(
                tarefaControllerMobX: tarefaController,
              ),
            ),
          );
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ),
    );
  }

  void mostrarAlertDialog(BuildContext context, int i) {
    Widget botaoCancelar = FlatButton(
      child: Text('Não'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget botaoContinuar = FlatButton(
      child: Text('Sim'),
      onPressed: () {
        tarefaController.remover(i);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alerta = AlertDialog(
      title: Text('Remover'),
      content: Text('Você deseja realmente remover a tarefa?'),
      actions: [
        botaoCancelar,
        botaoContinuar,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
