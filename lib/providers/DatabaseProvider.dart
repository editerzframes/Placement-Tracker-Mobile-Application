import 'package:Project/models/CompanyModel.dart';
import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import '../models/StudentModel.dart'; //import model class
import 'dart:async';

class DatabaseProvider {
  var sampleCompany = CompanyModel(
      arrival: "12-04-2020",
      backlogs: 0,
      ctc: 95,
      details: "The Dream Company",
      graduation: 10,
      link: "TXT",
      name: "A Company That Never Came",
      tenth: 0,
      twelfth: 0);
  var sampleStudent = StudentModel(
      name: 'A Student That Never Existed',
      cgpa: '10',
      course: 'B.Tech: CS-SD',
      email: 'a@mmumullana.org',
      password: '123',
      rollNumber: 17000,
      tenth: 100,
      twelfth: 100);
  Future<Database> init() async {
    var directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "PlacementAppX.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("""
        CREATE TABLE STUDENTS(
          name TEXT,
          rollNumber INTEGER PRIMARY KEY,
          tenth INTEGER,
          twelfth INTEGER,
          cgpa INTEGER,
          course TEXT,
          email TEXT,
          password TEXT)
        """);
        await db.execute("""
        CREATE TABLE COMPANY(
          name TEXT PRIMARY KEY,
          details TEXT,
          tenth REAL,
          twelfth REAL,
          arrival TEXT,
          backlogs INTEGER,
          ctc REAL,
          graduation REAL,
          link TEXT)
        """);
        await db.insert('COMPANY', sampleCompany.toMap());
        await db.insert('STUDENT', sampleStudent.toMap());
      },
    );
  }

  Future<int> addStudent(StudentModel student) async {
    final db = await init();
    return db.insert("STUDENTS", student.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<StudentModel>> fetchStudents() async {
    print("1");
    final db = await init();
    print("2");
    final maps = await db.query("STUDENTS");
    print("3");
    return List.generate(maps.length, (index) {
      return StudentModel(
          name: maps[index]['name'],
          rollNumber: maps[index]['rollNumber'],
          email: maps[index]['email'],
          cgpa: maps[index]['cgpa'],
          course: maps[index]['course'],
          password: maps[index]['password'],
          tenth: maps[index]['tenth'],
          twelfth: maps[index]['twelfth']);
    });
  }

  Future<int> addCompany(CompanyModel company) async {
    final db = await init();
    return db.insert("COMPANY", company.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<List<CompanyModel>> fetchCompanies() async {
    final db = await init();
    final maps = await db.query("COMPANY");
    return List.generate(maps.length, (index) {
      return CompanyModel(
          name: maps[index]['name'],
          arrival: maps[index]['arrival'],
          backlogs: maps[index]['backlogs'],
          ctc: maps[index]['ctc'],
          details: maps[index]['details'],
          graduation: maps[index]['graduation'],
          link: maps[index]['link'],
          tenth: maps[index]['tenth'],
          twelfth: maps[index]['twelfth']);
    });
  }

  Future<int> deleteCompany(String companyName) async {
    final db = await init();
    return await db
        .delete("COMPANY", where: 'name=?', whereArgs: [companyName]);
  }

  Future<int> deleteStudent(int rollNo) async {
    final db = await init();
    return await db
        .delete("STUDENT", where: 'rollNumber=?', whereArgs: [rollNo]);
  }

  Future<int> updateCompany(CompanyModel cpn) async {
    await deleteCompany(cpn.name);
    return await addCompany(cpn);
  }

  Future<int> updateStudent(StudentModel std) async {
    await deleteStudent(std.rollNumber);
    return await updateStudent(std);
  }
}
