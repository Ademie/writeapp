import 'package:flutter/material.dart';

class TextEditorPage extends StatefulWidget {
  @override
  _TextEditorPageState createState() => _TextEditorPageState();
}

class _TextEditorPageState extends State<TextEditorPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> _history = [];
  int _historyIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Editor'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: canUndo() ? undo : null,
                icon: Icon(Icons.undo),
              ),
              IconButton(
                onPressed: canRedo() ? redo : null,
                icon: Icon(Icons.redo),
              ),
            ],
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: TextField(
                controller: _textEditingController,
                onChanged: (text) {
                  addToHistory(text);
                },
                maxLines: null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool canUndo() {
    return _historyIndex > 0;
  }

  bool canRedo() {
    return _historyIndex < _history.length - 1;
  }

  void addToHistory(String text) {
    if (_historyIndex < _history.length - 1) {
      // We're not at the latest history entry, so remove everything after
      _history.removeRange(_historyIndex + 1, _history.length);
    }
    _history.add(text);
    _historyIndex = _history.length - 1;
  }

  void undo() {
    setState(() {
      _historyIndex--;
      _textEditingController.text = _history[_historyIndex];
    });
  }

  void redo() {
    setState(() {
      _historyIndex++;
      _textEditingController.text = _history[_historyIndex];
    });
  }
}
