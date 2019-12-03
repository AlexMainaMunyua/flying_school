import 'package:flutter/material.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({Key key}) : super(key: key);

  @override
  _PersonalDetailsFormState createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  GenderCharacter _character = GenderCharacter.female;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Validate returns true if the form is valid, or false
              // otherwise.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: ListView(children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'UserName',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'FirstName',
                    hintText: 'FirstName',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Lastname',
                    hintText: 'LastName',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    hintText: 'Date of Birth',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                ListTile(
                  title: const Text(
                    'Gender',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                /*  */
              ],
            ),
          ),
          Column(
            children: <Widget>[
              RadioListTile<GenderCharacter>(
                title: const Text('Male'),
                value: GenderCharacter.male,
                groupValue: _character,
                onChanged: (GenderCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<GenderCharacter>(
                title: const Text('Female'),
                value: GenderCharacter.female,
                groupValue: _character,
                onChanged: (GenderCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
}

enum GenderCharacter { male, female }
