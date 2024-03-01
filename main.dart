import 'dart:math';
import 'package:flutter/material.dart';
import 'package:domain/backend/class.dart';
import 'package:domain/backend/department.dart';
import 'package:domain/backend/subject.dart';
import 'package:domain/backend/term.dart';
import 'package:domain/backend/query.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WWU Class Schedule',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(193, 98, 139, 90)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Department _department = Department.allDepartments();
  Subject _subject = Subject.allSubjects();
  Term _term = Term.allTerms();
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    double desiredImageHeight = 200.0;

    return Scaffold(
      appBar: AppBar(
  backgroundColor: isDarkMode
      ? Colors.black // black color in dark mode
      : Color.fromARGB(255, 135, 163, 122), // green in light mode
  title: Text(
    'WWU Class Schedule',
    style: TextStyle(
      color: isDarkMode
          ? Colors.white // white text color in dark mode
          : Theme.of(context).colorScheme.inversePrimary, // inverse primary color in light mode
      fontFamily: 'Times New Roman', 
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: desiredImageHeight,
              child: Image.asset(
                'Walla_Walla_University.png', //add WWU image
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 1403) {
                  return wideLayout();
                } else if (constraints.maxWidth > 723) {
                  return mediumLayout();
                } else {
                  return const Placeholder();
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        child: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
  // @override
  Column wideLayout() {
    return Column(
      children: [
        searchCriteria(),
        wideHeaderRow(),
        Expanded(child: wideResults()),
      ],
    );
  }

  Column mediumLayout() {
    return Column(
      children: [
        searchCriteria(),
        mediumHeaderRow(),
        Expanded(child: mediumResults()),
      ],
    );
  }
  Widget wideHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cell(
          width: 45,
          text: 'Class#',
          foreground: Colors.white,
          alignment: Alignment.center,
          height: 7.0,
        ),
        cell(width: 45, text: 'Sub', foreground: Colors.white, height: 7.0),
        cell(width: 48, text: 'Sum 23', foreground: Colors.white, height: 7.0),
        cell(width: 48, text: 'Aut 23', foreground: Colors.white, height: 7.0),
        cell(width: 48, text: 'Wtr 24', foreground: Colors.white, height: 7.0),
        cell(width: 48, text: 'Spr 24', foreground: Colors.white, height: 7.0),
        cell(width: 48, text: 'Sum 24', foreground: Colors.white, height: 7.0),
        cell(width: 40, text: 'Sec', foreground: Colors.white, height: 7.0),
        cell(width: 25, text: 'GS', foreground: Colors.white, height: 7.0),
        cell(width: 25, text: 'Cr', foreground: Colors.white, height: 7.0),
        cell(
          width: 250,
          text: 'Course Title',
          foreground: Colors.white,
          height: 7.0,
        ),
        cell(width: 45, text: 'Status', foreground: Colors.white, height: 7.0),
        cell(width: 40, text: 'Enroll Count', foreground: Colors.white),
        cell(width: 40, text: 'Enroll Limit', foreground: Colors.white),
        cell(
          width: 67,
          text: 'Waitlist',
          foreground: Colors.white,
          alignment: Alignment.center,
          height: 7.0,
        ),
        cell(width: 30, text: 'Fee', foreground: Colors.white, height: 7.0),
        cell(
          width: 120,
          text: 'Meeting Time',
          foreground: Colors.white,
          alignment: Alignment.center,
          height: 7.0,
        ),
        cell(
          width: 150,
          text: 'Instructor',
          foreground: Colors.white,
          height: 7.0,
        ),
        cell(width: 52, text: 'Campus', foreground: Colors.white, height: 7.0),
        cell(width: 52, text: 'Video', foreground: Colors.white, height: 7.0),
        cell(width: 52, text: 'Consent', foreground: Colors.white, height: 7.0),
        cell(width: 65, text: 'Special Notes*', foreground: Colors.white),
      ],
    );
  }
  Widget mediumHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColoredBox(
          color: Colors.black,
          child: Column(
            children: [
              Row(
                children: [
                  cell(
                    width: 45,
                    text: 'Class#',
                    foreground: const Color.fromARGB(255, 255, 255, 255),
                    alignment: Alignment.center,
                    height: 7.0,
                  ),
                  cell(
                      width: 45,
                      text: 'Sub',
                      foreground: Colors.white,
                      height: 7.0),
                  cell(
                    width: 48,
                    text: 'Sum 23',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                    width: 48,
                    text: 'Aut 23',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                    width: 48,
                    text: 'Wtr 24',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                    width: 48,
                    text: 'Spr 24',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                    width: 48,
                    text: 'Sum 24',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                      width: 40,
                      text: 'Sec',
                      foreground: Colors.white,
                      height: 7.0),
                  cell(
                      width: 25,
                      text: 'GS',
                      foreground: Colors.white,
                      height: 7.0),
                  cell(
                      width: 25,
                      text: 'Cr',
                      foreground: Colors.white,
                      height: 7.0),
                  cell(
                    width: 293,
                    text: 'Course Title',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                ],
              ),
              Row(
                children: [
                  cell(
                    width: 45,
                    text: 'Status',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                      width: 40,
                      text: 'Enroll Count',
                      foreground: Colors.white),
                  cell(
                      width: 40,
                      text: 'Enroll Limit',
                      foreground: Colors.white),
                  cell(
                    width: 67,
                    text: 'Waitlist',
                    foreground: Colors.white,
                    alignment: Alignment.center,
                    height: 7.0,
                  ),
                  cell(
                      width: 30,
                      text: 'Fee',
                      foreground: Colors.white,
                      height: 7.0),
                  cell(
                    width: 120,
                    text: 'Meeting Time',
                    foreground: Colors.white,
                    alignment: Alignment.center,
                    height: 7.0,
                  ),
                  cell(
                    width: 150,
                    text: 'Instructor',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                    width: 52,
                    text: 'Campus',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                    width: 52,
                    text: 'Video',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                    width: 52,
                    text: 'Consent',
                    foreground: Colors.white,
                    height: 7.0,
                  ),
                  cell(
                      width: 65,
                      text: 'Special Notes*',
                      foreground: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container cell({
    required double width,
    required String text,
    Color background = const Color(0xFF336699),
    Color foreground = Colors.black,
    Alignment alignment = Alignment.centerLeft,
    double height = 0,
    double margin = 0.5,
    TextOverflow overflow = TextOverflow.visible,
  }) {
    return Container(
      width: width,
      alignment: alignment,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: height),
      color: background,
      child: Text(
        text,
        style: TextStyle(color: foreground, fontSize: 10.0),
        overflow: overflow,
      ),
    );
  }
  Widget departmentDropdown() {
    final screenWidth = MediaQuery.of(context).size.width;
    final entries = <DropdownMenuEntry>[];
    for (final element in Department.instances) {
      entries.add(DropdownMenuEntry(value: element, label: element.name));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu(
        width: screenWidth * 0.25,
        key: const Key('DepartmentDropdownMenu'),
        dropdownMenuEntries: entries,
        label: const Text(
          'Department',
          overflow: TextOverflow.ellipsis,
        ),
        onSelected: (value) {
          setState(() {
            _department = value;
          });
        },
      ),
    );
  }


  Widget subjectDropdown() {
    final screenWidth = MediaQuery.of(context).size.width;
    final entries = <DropdownMenuEntry>[];
    for (final element in Subject.instances) {
      entries.add(DropdownMenuEntry(value: element, label: element.name));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu(
        width: screenWidth * 0.25,
        key: const Key('SubjectDropdownMenu'),
        dropdownMenuEntries: entries,
        label: const Text(
          'Subject',
          overflow: TextOverflow.ellipsis,
        ),
        onSelected: (value) {
          setState(() {
            _subject = value;
          });
        },
      ),
    );
  }

  Widget termDropdown() {
    final screenWidth = MediaQuery.of(context).size.width;
    final entries = <DropdownMenuEntry>[];
    for (final element in Term.instances) {
      entries.add(DropdownMenuEntry(value: element, label: element.name));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownMenu(
        width: screenWidth * 0.25,
        key: const Key('TermDropdownMenu'),
        dropdownMenuEntries: entries,
        label: const Text('Term'),
        onSelected: (value) {
          setState(() {
            _term = value;
          });
        },
      ),
    );
  }

  Widget searchCriteria() {
    final screenWidth = MediaQuery.of(context).size.width;
    return ColoredBox(
      color: Color.fromARGB(255, 135, 163, 122),
      child: SizedBox(
        width: screenWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            departmentDropdown(),
            subjectDropdown(),
            termDropdown(),
          ],
        ),
      ),
    );
  }
  
  String addLines(String input, int needed) {
    final found = input.split('\n').length;
    var result = input;
    for (int i = found; i < needed; i++) {
      result += '\n';
    }
    return result;
  }

  Widget wideClassRow(Class aClass, bool isEven) {
    final backgroundColor =
        isEven ? const Color(0xFFC2C2C2) : const Color(0xFFDBDBDB);
    final backgroundColorSum =
        isEven ? const Color(0xFFF1F276) : const Color(0xFFFEFFA4);
    final backgroundColorFall =
        isEven ? const Color(0xFFF2B600) : const Color(0xFFFFD34D);
    final backgroundColorWtr =
        isEven ? const Color(0xFF8CA2BD) : const Color(0xFFB4C4D8);
    final backgroundColorSpr =
        isEven ? const Color(0xFF53B573) : const Color(0xFF8AD2A1);
    final lineHeight = max(
      aClass.schedule.toString().split('\n').length,
      aClass.instructors.length,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cell(
          width: 45,
          text: addLines(aClass.term.code.toString(), lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 45,
          text: addLines(aClass.course.subject!.code, lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 48,
          text: addLines(
            aClass.term.name == 'Summer 2023' ? aClass.course.number : ' ',
            lineHeight,
          ),
          background: backgroundColorSum,
          foreground: Colors.black,
          alignment: Alignment.topLeft,
        ),
        cell(
          width: 48,
          text: addLines(
            aClass.term.name == 'Fall 2023' ? aClass.course.number : '',
            lineHeight,
          ),
          background: backgroundColorFall,
          foreground: Colors.black,
          alignment: Alignment.topLeft,
        ),
        cell(
          width: 48,
          text: addLines(
            aClass.term.name == 'Winter 2024' ? aClass.course.number : '',
            lineHeight,
          ),
          background: backgroundColorWtr,
          foreground: Colors.black,
          alignment: Alignment.topLeft,
        ),
        cell(
          width: 48,
          text: addLines(
            aClass.term.name == 'Spring 2024' ? aClass.course.number : '',
            lineHeight,
          ),
          background: backgroundColorSpr,
          foreground: Colors.black,
          alignment: Alignment.topLeft,
        ),
        cell(
          width: 48,
          text: addLines(
            aClass.term.name == 'Summer 2024' ? aClass.course.number : '',
            lineHeight,
          ),
          background: backgroundColorSum,
          foreground: Colors.black,
          alignment: Alignment.centerLeft,
        ),
        cell(
          width: 40,
          text: addLines(aClass.section, lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 25,
          text:
              addLines(aClass.course.isGeneralStudies ? 'GS' : '', lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 25,
          text: addLines(aClass.course.credits.toString(), lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 250,
          text: addLines(aClass.course.title, lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 45,
          text: addLines(
            aClass.isOpenForEnrollment ? 'Open' : 'Close',
            lineHeight,
          ),
          background: backgroundColor,
        ),
        cell(
          width: 40,
          text: addLines(aClass.currEnrollment.toString(), lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 40,
          text: addLines(aClass.maxEnrollment.toString(), lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 67,
          text: addLines(
            aClass.waitlist >= 0 ? '${aClass.waitlist} in waitlist' : '',
            lineHeight,
          ),
          background: backgroundColor,
          alignment: Alignment.centerRight,
        ),
        cell(
          width: 30,
          text: addLines(aClass.fee >= 0 ? '\$${aClass.fee}' : '', lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 120,
          text: addLines(aClass.schedule.toString(), lineHeight),
          background: backgroundColor,
          alignment: Alignment.centerRight,
        ),
        cell(
          width: 150,
          text: addLines(aClass.instructors.join('\n'), lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 52,
          text: addLines(aClass.campus.code, lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 52,
          text: addLines(aClass.video, lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 52,
          text: addLines(aClass.consent, lineHeight),
          background: backgroundColor,
        ),
        cell(
          width: 65,
          text: addLines(aClass.specialNotes, lineHeight),
          background: backgroundColor,
        ),
      ],
    );
  }

  Widget mediumClassRow(Class aClass, bool isEven) {
    final backgroundColor =
        isEven ? const Color(0xFFC2C2C2) : const Color(0xFFDBDBDB);
    final backgroundColorSum =
        isEven ? const Color(0xFFF1F276) : const Color(0xFFFEFFA4);
    final backgroundColorFall =
        isEven ? const Color(0xFFF2B600) : const Color(0xFFFFD34D);
    final backgroundColorWtr =
        isEven ? const Color(0xFF8CA2BD) : const Color(0xFFB4C4D8);
    final backgroundColorSpr =
        isEven ? const Color(0xFF53B573) : const Color(0xFF8AD2A1);
    final lineHeight = max(
      aClass.schedule.toString().split('\n').length,
      aClass.instructors.length,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColoredBox(
          color: Colors.black,
          child: Column(
            children: [
              Row(
                children: [
                  cell(
                    width: 45,
                    text: addLines(aClass.term.code.toString(), lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 45,
                    text: addLines(aClass.course.subject!.code, lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 48,
                    text: addLines(
                      aClass.term.name == 'Summer 2023'
                          ? aClass.course.number
                          : ' ',
                      lineHeight,
                    ),
                    background: backgroundColorSum,
                    foreground: Colors.black,
                    alignment: Alignment.topLeft,
                  ),
                  cell(
                    width: 48,
                    text: addLines(
                      aClass.term.name == 'Fall 2023'
                          ? aClass.course.number
                          : '',
                      lineHeight,
                    ),
                    background: backgroundColorFall,
                    foreground: Colors.black,
                    alignment: Alignment.topLeft,
                  ),
                  cell(
                    width: 48,
                    text: addLines(
                      aClass.term.name == 'Winter 2024'
                          ? aClass.course.number
                          : '',
                      lineHeight,
                    ),
                    background: backgroundColorWtr,
                    foreground: Colors.black,
                    alignment: Alignment.topLeft,
                  ),
                  cell(
                    width: 48,
                    text: addLines(
                      aClass.term.name == 'Spring 2024'
                          ? aClass.course.number
                          : '',
                      lineHeight,
                    ),
                    background: backgroundColorSpr,
                    foreground: Colors.black,
                    alignment: Alignment.topLeft,
                  ),
                  cell(
                    width: 48,
                    text: addLines(
                      aClass.term.name == 'Summer 2024'
                          ? aClass.course.number
                          : '',
                      lineHeight,
                    ),
                    background: backgroundColorSum,
                    foreground: Colors.black,
                    alignment: Alignment.centerLeft,
                  ),
                  cell(
                    width: 40,
                    text: addLines(aClass.section, lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 25,
                    text: addLines(
                      aClass.course.isGeneralStudies ? 'GS' : '',
                      lineHeight,
                    ),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 25,
                    text:
                        addLines(aClass.course.credits.toString(), lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 293,
                    text: addLines(aClass.course.title, lineHeight),
                    background: backgroundColor,
                  ),
                ],
              ),
              Row(
                children: [
                  cell(
                    width: 45,
                    text: addLines(
                      aClass.isOpenForEnrollment ? 'Open' : 'Close',
                      lineHeight,
                    ),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 40,
                    text:
                        addLines(aClass.currEnrollment.toString(), lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 40,
                    text: addLines(aClass.maxEnrollment.toString(), lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 67,
                    text: addLines(
                      aClass.waitlist >= 0
                          ? '${aClass.waitlist} in waitlist'
                          : '',
                      lineHeight,
                    ),
                    background: backgroundColor,
                    alignment: Alignment.centerRight,
                  ),
                  cell(
                    width: 30,
                    text: addLines(
                      aClass.fee >= 0 ? '\$${aClass.fee}' : '',
                      lineHeight,
                    ),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 120,
                    text: addLines(aClass.schedule.toString(), lineHeight),
                    background: backgroundColor,
                    alignment: Alignment.centerRight,
                  ),
                  cell(
                    width: 150,
                    text: addLines(aClass.instructors.join('\n'), lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 52,
                    text: addLines(aClass.campus.code, lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 52,
                    text: addLines(aClass.video, lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 52,
                    text: addLines(aClass.consent, lineHeight),
                    background: backgroundColor,
                  ),
                  cell(
                    width: 65,
                    text: addLines(aClass.specialNotes, lineHeight),
                    background: backgroundColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget wideResults() {
    final classes = Query(
      department: _department,
      subject: _subject,
      term: _term,
    ).results().toList();

    classes.sort((a, b) {
      return a.compareTo(b);
    });

    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) =>
          wideClassRow(classes[index], index % 2 == 0),
    );
  }

  Widget mediumResults() {
    final classes = Query(
      department: _department,
      subject: _subject,
      term: _term,
    ).results().toList();

    classes.sort((a, b) {
      return a.compareTo(b);
    });

    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) =>
          mediumClassRow(classes[index], index % 2 == 0),
    );
  }
}