import 'dart:math';

import 'package:faker/faker.dart';
import 'package:learn_for_business_app/Model/Const/pricing.dart';
import 'package:learn_for_business_app/Model/fake_user.dart';

class Course {
  int id;
  String title;
  String description;
  List<String> descriptionItems;
  List<String> contents;
  String photoUrl;
  List<Comment> comments;
  String category;
  double rank;
  Course(
      {this.id,
      this.comments,
      this.contents,
      this.description,
      this.category,
      this.descriptionItems,
      this.photoUrl,
      this.rank,
      this.title});
}

class Comment {
  User user;
  double rank;
  DateTime publishDate;
  String content;
  Comment({this.content, this.publishDate, this.rank, this.user});
}

class MyCourse {
  Course course;
  DateTime startDate;
  DateTime lastSeen;
  int completedContent;
  String dersNotu;
  String sinav;
  String sertifika;
  MyCourse(
      {this.completedContent,
      this.course,
      this.dersNotu,
      this.lastSeen,
      this.sertifika,
      this.sinav,
      this.startDate});
}

List<Comment> commentList = List.generate(
    10,
    (index) => Comment(
          user: user,
          content: Faker()
              .lorem
              .sentences(3)
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', ''),
          publishDate: DateTime.now(),
          rank: Random().nextDouble() * 5,
        ));

List<Course> courseList = trainingList.map((e) {
  return Course(
    id: e.id,
    title: e.title,
    comments: commentList,
    photoUrl: 'assets/image/dummy_course_cover.jpeg',
    category: 'Yalın Üretim',
    rank: Random().nextDouble() * 5,
    descriptionItems: [
      'Gereksiz yere taşıma',
      'Gereksiz işçilik',
      'Stok yapma',
      'Bekleme',
      'Gereksiz hareket',
      'Aşırı üretim',
    ],
    contents: [
      'Ana Fikir',
      'İçindekiler',
      'Genel Olarak',
      'İsrafı netleştirelim',
      'Değer katan faaliyetler',
      'Yedi Ölümcül israf',
    ],
    description:
        'Şirketlerin başarısı müşterinin istediği ürünü, istediği kalitede vermek, müşterinin istediği zamanda vermek, müşterinin kabul edeceği fiyata vermek üzerine kuruludur. Yalın üretimin özü ise yukarıdaki bu üç parametreyi sekteye uğratan israf kalemlerine odaklanmaktır. İsraf dediğimiz ise birçok işyerinde bulunan “Lüzumsuz ise söndürünüz” klişesinden çok daha fazlasıdır.',
  );
}).toList();

List<MyCourse> myCourseList = [];

Future<void> generateMyCourse() async {
  courseList.shuffle();
  List<Course> myCourseTakeList = courseList.take(5).toList();
  for (var element in myCourseTakeList) {
    myCourseList.add(MyCourse(
        course: element,
        completedContent: Random().nextInt(5),
        dersNotu: 'Notlar',
        sinav: 'LGS',
        lastSeen: DateTime.now(),
        startDate: DateTime.now(),
        sertifika: 'Modern Sertifika'));
  }
}

class Exam {
  int id;
  int correctId;
  String question;
  List<String> answers;
  Exam({this.answers, this.correctId, this.id, this.question});
}

List<Exam> exams = [
  Exam(
    id: 0,
    question:
        'SWOT Analizi, şirketin aşağıdakileri değerlendirmesine yardımcı olur',
    answers: [
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
    ],
    correctId: 2,
  ),
  Exam(
    id: 1,
    question:
        'Zara\'nın Singapur\'da bir giyim hattı ve bir giyim dağıtım merkezi var. Müşterileri çoğunlukla üst orta sınıf segmentinden geliyor. En son piyasa araştırmasına göre, üst orta sınıf segmentinin harcanabilir gelirinin %30 oranında artacağı tahmin ediliyor.',
    answers: [
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
    ],
    correctId: 1,
  ),
  Exam(
    id: 2,
    question:
        'SWOT Analizi, şirketin aşağıdakileri değerlendirmesine yardımcı olur',
    answers: [
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
    ],
    correctId: 0,
  ),
  Exam(
    id: 3,
    question:
        'Zara\'nın Singapur\'da bir giyim hattı ve bir giyim dağıtım merkezi var. Müşterileri çoğunlukla üst orta sınıf segmentinden geliyor. En son piyasa araştırmasına göre, üst orta sınıf segmentinin harcanabilir gelirinin %30 oranında artacağı tahmin ediliyor.',
    answers: [
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
      'İç tehditler ve fırsatlar ile dış güçlü ve zayıf yönler',
    ],
    correctId: 4,
  ),
];
