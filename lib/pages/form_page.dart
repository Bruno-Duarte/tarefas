import 'package:flutter/material.dart';
import 'package:tarefas/helpers/tarefa_controller.dart';

// ignore: must_be_immutable
class FormPage extends StatelessWidget {
  final TarefaController tarefaControllerMobX;
  final TextEditingController editTarefaController;
  final int indiceTarefa;
  final bool isNew;
  var novaTarefaController = TextEditingController();

  FormPage({
    this.tarefaControllerMobX,
    this.editTarefaController,
    this.isNew = true,
    this.indiceTarefa,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefa'),
      ),
      body: Center(
        child: Container(
          height: 200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 30.0,
                  left: 30.0,
                ),
                child: TextField(
                  controller: (editTarefaController == null)
                      ? novaTarefaController
                      : editTarefaController,
                  style: TextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Tarefa',
                    labelStyle: TextStyle(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: FlatButton(
                  child: Text(
                    isNew ? 'Adicionar Tarefa' : 'Editar Tarefa',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (isNew) {
                      tarefaControllerMobX
                          .adicionaTarefa(novaTarefaController.text);
                    } else {
                      tarefaControllerMobX.editarTarefa(
                          indiceTarefa, editTarefaController.text);
                    }
                    Navigator.pop(context);
                  },
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
