import 'package:aub/Models/MyTile.dart';
import 'package:flutter/material.dart';

class SecondDegreeFAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 35, 40, 50),
        title: Text("Second Degree"),
      ),
      backgroundColor: Color.fromARGB(255, 35, 40, 50),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SafeArea(
          child: new ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return stuffInTiles(context, listOfTiles[index]);
            },
            itemCount: listOfTiles.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 20),
          ),
        ),
      ),
    );
  }
}

Widget stuffInTiles(BuildContext context, MyTile myTile) {
  return _buildTiles(myTile);
}

Widget _buildTiles(MyTile t) {
  if (t.children.isEmpty)
    return Container(
      child: RawMaterialButton(
        child: new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          selected: true,
          title: new Text(
            t.title,
            style: TextStyle(color: Colors.white70, fontSize: 20),
          ),
        ),
      ),
    );

  return Container(
    decoration: BoxDecoration(color: Color.fromRGBO(83, 93, 112, .9)),
    child: new ExpansionTile(
      key: new PageStorageKey<int>(3),
      backgroundColor: Color.fromARGB(255, 83, 93, 112),
      title: new Text(
        t.title,
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
      children: t.children.map(_buildTiles).toList(),
    ),
  );
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'Can I apply as a transfer student to another major when I already have a bachelor degree?',
    <MyTile>[
      new MyTile(
          '​If you already have a bachelor degree, then you will need to apply as second degree applicant.  Some of the credits taken in the bachelor degree will be transferred to your second degree per department approval.'),
    ],
  ),
  new MyTile(
    'I am an AUB graduate and want to apply to AUB for a second degree, do I submit an application to the Office of Admissions like other second degree applicants?',
    <MyTile>[
      new MyTile(
          "​AUB graduates who've been away from AUB for less than 2 years after graduation, must contact the Office of the Registrar on: registrar@aub.edu.lb and inquire about their application for second degree.   For all other applicants, they need to submit their second degree application form at the Office of Admissions."),
    ],
  ),
];
