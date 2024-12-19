import 'package:flutter/material.dart';

class ThoughtInputWidget extends StatefulWidget {
  const ThoughtInputWidget({super.key});

  @override
  _ThoughtInputWidgetState createState() => _ThoughtInputWidgetState();
}

class _ThoughtInputWidgetState extends State<ThoughtInputWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _thoughts = [];

  void _addThought() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _thoughts.insert(0, _controller.text.trim());
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Thoughts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Field
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Write your thought',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addThought,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // List of Thoughts
            Expanded(
              child: _thoughts.isEmpty
                  ? Center(
                child: Text(
                  'No thoughts yet. Start by adding one!',
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
              )
                  : ListView.builder(
                itemCount: _thoughts.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        _thoughts[index],
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
