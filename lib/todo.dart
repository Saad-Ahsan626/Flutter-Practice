import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoModel {
  String id;
  String title;

  TodoModel({required this.id, required this.title});

  TodoModel copyWith({String? id, String? title}) {
    return TodoModel(id: id ?? this.id, title: title ?? this.title);
  }
}

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]);

  void addTodo(String title) {
    state.add(TodoModel(id: DateTime.now().toString(), title: title));
    state = List.from(state);
  }

  void deleteTodo(String id) {
    state.removeWhere((todo) => todo.id == id);
    state = List.from(state);
  }

  void updateTodo(String id, String title) {
    final index = state.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      state[index] = state[index].copyWith(title: title);
      state = List.from(state);
    }
  }
}

final TodoProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>((
  ref,
) {
  return TodoNotifier();
});

class Todo extends ConsumerWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(TodoProvider);
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Todo List'))),
      body: todos.isEmpty
          ? const Center(child: Text('No todos yet'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(TodoProvider.notifier).deleteTodo(todo.id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(TodoProvider.notifier)
                              .updateTodo(todo.id, 'Updated Title');
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(TodoProvider.notifier).addTodo('Saad Ahsan');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
