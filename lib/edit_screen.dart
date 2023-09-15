import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final Map<String, dynamic>? cvInfo;

  const EditPage({this.cvInfo, super.key});
  static const routeName = "/editpage";
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController skillController = TextEditingController();
  late Map<String, dynamic> cvDetails;
  bool isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      cvDetails =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    }
    isInit = false;
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Saved Succesfully!",
        ),
        duration: Duration(
          milliseconds: 200,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: const Text("Edit CV details"),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.tealAccent,
            ),
            onPressed: () {
              _submit(context);
            },
            child: const Text(
              "Save",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(cvDetails);
          return false;
        },
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, bottom: 32, top: 24),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text(
                      "Basic Info",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextFormField(
                      initialValue: cvDetails["name"],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        labelStyle: TextStyle(
                            fontSize: 22, color: Colors.teal, height: 0.3),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        setState(() {
                          cvDetails["name"] = newValue;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      initialValue: cvDetails["slackName"],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Slack Name",
                        labelStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.teal,
                          height: 0.3,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        setState(() {
                          cvDetails["slackName"] = newValue;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      initialValue: cvDetails["github"],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Github handle",
                        labelStyle: TextStyle(
                            fontSize: 22, color: Colors.teal, height: 0.3),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        setState(() {
                          cvDetails["github"] = newValue;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      initialValue: cvDetails["about"],
                      textInputAction: TextInputAction.next,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: "About",
                        labelStyle: TextStyle(fontSize: 20, color: Colors.teal),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        setState(() {
                          cvDetails["about"] = newValue;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Education",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextFormField(
                      initialValue: cvDetails["education"]["degree"],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Degree",
                        labelStyle: TextStyle(
                            fontSize: 22, color: Colors.teal, height: 0.3),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        setState(() {
                          cvDetails["education"]["degree"] = newValue;
                        });
                      },
                    ),
                    TextFormField(
                      initialValue: cvDetails["education"]["school"],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "School",
                        labelStyle: TextStyle(
                            fontSize: 22, color: Colors.teal, height: 0.3),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        setState(() {
                          cvDetails["education"]["school"] = newValue;
                        });
                      },
                    ),
                    TextFormField(
                      initialValue: cvDetails["education"]["date"],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Duration",
                        labelStyle: TextStyle(
                            fontSize: 22, color: Colors.teal, height: 0.3),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        setState(() {
                          cvDetails["education"]["date"] = newValue;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Skills",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: skillController,
                            decoration: const InputDecoration(
                              labelText: "Add Skill",
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.teal),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                cvDetails["skills"].add(skillController.text);
                              });
                              skillController.clear();
                            },
                            child: const Text("Add"))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 30,
                      children: List.from(cvDetails["skills"])
                          .map(
                            (value) => InputChip(
                              padding: const EdgeInsets.all(2.0),
                              label: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                              selectedColor: Colors.blue.shade600,
                              onDeleted: () {
                                setState(() {
                                  cvDetails["skills"].remove(value);
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
