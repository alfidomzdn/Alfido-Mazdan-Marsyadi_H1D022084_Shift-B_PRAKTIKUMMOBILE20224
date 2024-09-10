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

  void addStudent(String name, double grade) {
    students.add(Student(name, grade));
    print('Siswa "$name" ditambahkan dengan nilai $grade.');
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

void main() {

  StudentManager manager = StudentManager();

  manager.addStudent('Ahmad', 85.0);
  manager.addStudent('Budi', 90.5);
  manager.addStudent('Cici', 78.0);

  manager.displayStudents();

  double average = manager.calculateAverageGrade();
  print('\nNilai rata-rata siswa: $average');

  Student? topStudent = manager.getTopStudent();
  if (topStudent != null) {
    print('\nSiswa dengan nilai tertinggi: ${topStudent.name} dengan nilai ${topStudent.grade}');
  }
}

