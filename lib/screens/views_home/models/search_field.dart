import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _textController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              width: 0.8,
              color: Theme.of(context).primaryColor,
            ),
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {
              _textController.clear();
            },
            icon: const Icon(Icons.clear, color: Colors.grey),
          ),
          hintText: 'Search for train stations or tourist places',
        ),
      ),
    );
  }
}
