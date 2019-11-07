import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Name Generator',
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: TodoItem(),
      );
}

class TodoItemState extends State<TodoItem> {
  final List<String> _todoItems = <String>[];

  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildTodoList() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black45,
        ),
        itemCount: _todoItems.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i < _todoItems.length) {
            return _buildRow(_todoItems[i]);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Todos'),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToAddNew();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _buildRow(String pair) {
    return ListTile(
      title: Text(
        pair,
        style: _biggerFont,
      ),
    );
  }

  void _goToAddNew() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Add new todo"),
                TextField(
                  autofocus: true,
                  onSubmitted: (val) {
                    _addTodoItem(val);
                    Navigator.pop(context);
                  },
                  decoration: new InputDecoration(
                      hintText: 'Enter something to do...',
                      contentPadding: const EdgeInsets.all(16.0)),
                )
              ],
            )),
      );
    }));
  }

  void _addTodoItem(String todoName) {
    setState(() {
      _todoItems.add(todoName);
    });
  }
}

class TodoItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoItemState();
}
