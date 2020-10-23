import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'tarefa_controller.g.dart';

class TarefaController = TarefaControllerBase with _$TarefaController;

abstract class TarefaControllerBase with Store {
  @observable
  ObservableList<String> tarefas = ObservableList.of([]);

  @action
  void adicionaTarefa(String novaTarefa) {
    if (novaTarefa.isEmpty) return;
    tarefas.add(novaTarefa);
  }

  @action
  TextEditingController carregarTarefa(int i) {
    var editTarefaController = TextEditingController();
    editTarefaController.text = tarefas[i];
    return editTarefaController;
  }

  @action
  void editarTarefa(int i, String tarefaEditada) {
    if (tarefaEditada.isEmpty) return;
    tarefas[i] = tarefaEditada;
  }

  @action
  void remover(int i) {
    tarefas.removeAt(i);
  }
}
