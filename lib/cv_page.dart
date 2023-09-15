import 'package:flutter/material.dart';
import 'package:hng_task_2/edit_screen.dart';

Map<String, dynamic> cvDetails = {
  "name": "Adah Godwin Oche",
  "slackName": "Godwin Adah",
  "github": "AdahGodwin",
  "about":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "education": {
    "degree": "Bsc Computer Science",
    "school": "Lagos State University",
    "date": "April 2023 till date",
  },
  "skills": [
    "JavaScript",
    "TypeScript",
    "AngularJS",
    "HTML and CSS",
    "NodeJS",
    "MongoDB",
    "Flutter and Dart",
  ],
};

class CvPage extends StatefulWidget {
  const CvPage({super.key});

  @override
  State<CvPage> createState() => _CvPageState();
}

class _CvPageState extends State<CvPage> {
  @override
  Widget build(BuildContext context) {
    void routeToPage() {
      Navigator.of(context)
          .pushNamed(EditPage.routeName, arguments: cvDetails)
          .then((value) {
        setState(() {
          cvDetails = value as Map<String, dynamic>;
        });
        print(value);
      });
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        title: const Text(
          "CV",
        ),
        actions: [
          TextButton(
            onPressed: routeToPage,
            child: const Text(
              "Edit CV",
              style: TextStyle(color: Colors.tealAccent, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              rowText("Name", valueText(cvDetails["name"])),
              const Divider(),
              rowText("Slack Name", valueText(cvDetails["slackName"])),
              const Divider(),
              rowText("Github", valueText(cvDetails["github"])),
              const Divider(),
              rowText(
                "About Me",
                valueText(cvDetails["about"]),
              ),
              const Divider(),
              rowText(
                "Education",
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cvDetails["education"]["degree"],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    valueText(cvDetails["education"]["school"]),
                    Text(
                      cvDetails["education"]["date"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              const Divider(),
              if (cvDetails["skills"].isNotEmpty)
                rowText(
                    "Skills",
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.from(cvDetails["skills"])
                          .map((e) => valueText(e))
                          .toList(),
                    )),
            ]),
          ),
        ),
      ),
    );
  }

  Widget rowText(String title, Widget widget) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            width: 200,
            child: widget,
          )
        ],
      ),
    );
  }

  Widget valueText(String value) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
