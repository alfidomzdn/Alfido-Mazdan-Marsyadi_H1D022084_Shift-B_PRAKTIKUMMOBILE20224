import 'dart:async';
import 'dart:math';

class Student {
  String name;
  double grade;

  Student(this.name, this.grade);

  @override
  String toString() {
    return '$name: $grade';
  }
}

class StudentManager {
  List<Student> students = [];


  Future<void> addStudent(String name) async {
    double grade = generateRandomGrade();
    print('Menambahkan siswa "$name" dengan nilai acak...');
    await Future.delayed(Duration(seconds: 2));
    students.add(Student(name, grade));
    print('Siswa "$name" berhasil ditambahkan dengan nilai $grade.');
  }


  double generateRandomGrade() {
    Random random = Random();
    return 50 + random.nextDouble() * 50; 
  }

  double calculateAverageGrade() {
    double total = 0;
    for (var student in students) {
      total += student.grade;
    }
    return students.isEmpty ? 0 : total / students.length;
  }

  Student? getTopStudent() {
    if (students.isEmpty) {
      return null;
    }
    Student topStudent = students[0];
    for (var student in students) {
      if (student.grade > topStudent.grade) {
        topStudent = student;
      }
    }
    return topStudent;
  }

  void displayStudents() {
    if (students.isEmpty) {
      print('Belum ada siswa yang ditambahkan.');
    } else {
      print('Daftar Siswa:');
      for (var student in students) {
        print(student);
      }
    }
  }
}

void main() async {
  StudentManager manager = StudentManager();

  await manager.addStudent('Ahmad');
  await manager.addStudent('Budi');
  await manager.addStudent('Cici');

  manager.displayStudents();

  double average = manager.calculateAverageGrade();
  print('\nNilai rata-rata siswa: $average');


  Student? topStudent = manager.getTopStudent();
  if (topStudent != null) {
    print('\nSiswa dengan nilai tertinggi: ${topStudent.name} dengan nilai ${topStudent.grade}');
  }
}
