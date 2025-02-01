import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          spacing: 24,
          children: [
            _buildTextFieldForm(),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: _buildUserNameAndNumber(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black45,
      foregroundColor: Colors.white,
      title: Text(
        'Contact List',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTextFieldForm() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 8,
        children: [
          TextFormField(
            controller: _nameTEController,
            decoration: InputDecoration(hintText: 'Name'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Name is required';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _numberTEController,
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(hintText: 'Number'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Number is required';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: _addContacts,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _addContacts() {
    if (_formKey.currentState!.validate()) {
      final String name = _nameTEController.text.trim();
      final String number = _numberTEController.text.trim();
      if (name.isNotEmpty && number.isNotEmpty) {
        _contacts.add({'name': name, 'number': number});
        setState(() {});
        _nameTEController.clear();
        _numberTEController.clear();
      }
    }
  }

  Widget _buildUserNameAndNumber(int index) {
    return GestureDetector(
      onLongPress: () => _deleteContact(index),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 20,
                children: [
                  Icon(
                    Icons.person,
                    size: 42,
                    color: Colors.black54,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_contacts[index]['name']}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        '${_contacts[index]['number']}',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.call, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteContact(int index) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Confirmation',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: Text('Are you sure for delete?'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.cancel,
              color: Colors.green,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {
              _contacts.removeAt(index);
              setState(() {});
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _numberTEController.dispose();
    super.dispose();
  }
}
