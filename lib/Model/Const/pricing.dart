import 'package:learn_for_business_app/Controller/asset_constants.dart';

class Pricing {
  int id;
  String title;
  String tabTitle;
  int fee;
  String icon;
  List<String> pricingContents;
  Pricing({this.id, this.title, this.fee, this.icon, this.pricingContents, this.tabTitle});
}

List<Pricing> pricingList = [
  Pricing(
    id: 0,
    title: 'Ücretsiz Üyelik',
    tabTitle: 'Ücretsiz',
    fee: 0,
    icon: AppConstants.pricingFree,
    pricingContents: [
      'Üyelik süresi SINIRSIZ',
      'Yalnız ücretsiz eğitimler alınır',
      'Üyelik süresince eklenecek ücretsiz eğitimler',
      'Alınan eğitimlerin notları',
      'Alınan eğitimlerin sertifikaları',
    ],
  ),
  Pricing(
    id: 1,
    title: 'Pro Üyelik',
    tabTitle: 'Pro',
    fee: 300,
    icon: AppConstants.pricingPro,
    pricingContents: [
      'Üyelik süresi 1 yıldır',
      'Mevcut bütün eğitimler alınır',
      'Üyelik süresince eklenecek ücretsiz eğitimler',
      'Alınan eğitimlerin notları',
      'Alınan eğitimlerin sınavları',
      'Alınan eğitimlerin sertifikaları',
    ],
  ),
  Pricing(
    id: 2,
    title: 'LifeTime Üyelik',
    tabTitle: 'LifeTime',
    fee: 749,
    icon: AppConstants.pricingLifetime,
    pricingContents: [
      'Üyelik süresi SINIRSIZ',
      'Mevcut bütün eğitimler alınır',
      'Üyelik süresince eklenecek ücretsiz eğitimler',
      'Alınan eğitimlerin notları',
      'Alınan eğitimlerin sınavları',
      'Alınan eğitimlerin sertifikaları',
    ],
  ),
  Pricing(
    id: 3,
    title: 'Kurumsal Üyelik',
    tabTitle: 'Kurumsal',
    icon: AppConstants.pricingBusiness,
    pricingContents: [
      'Üyelik süresi 1 yıldır',
      'Mevcut bütün eğitimler alınır',
      'Üyelik süresince eklenecek ücretsiz eğitimler',
      'Alınan eğitimlerin notları',
      'Alınan eğitimlerin sınavları',
      'Alınan eğitimlerin sertifikaları',
      'Eğitim aktif/pasif etme',
      'Şirket logolu giriş sayfası',
      'Şirket yönetim sayfası'
    ],
  ),
];

class Trainings {
  int id;
  String title;
  Trainings({this.id, this.title});
}

List<Trainings> trainingList = [
  Trainings(id: 11, title: 'Yalın Üretimin Özü'),
  Trainings(id: 12, title: 'Yalın Üretim Araçları'),
  Trainings(id: 13, title: 'OEE - Ekipman Etkinlik Oranı'),
  Trainings(id: 14, title: 'TPM - Toplam Üretken Bakım'),
  Trainings(id: 15, title: 'FMEA - Hata Modları ve Etkilerinin Analizi'),
  Trainings(id: 16, title: 'SWOT Stratejik Analiz'),
  Trainings(id: 17, title: '5S İşyeri Organizasyonu'),
  Trainings(id: 18, title: 'Ürün Maliyet Hesaplama'),
  Trainings(id: 19, title: 'ISO 9001:2015 Kalite Yönetim Sistemi'),
  Trainings(id: 20, title: 'Özgeçmiş Hazırlama'),
  Trainings(id: 21, title: 'Kalite Prensipleri'),
  Trainings(id: 22, title: 'Liderlik Eğitimi'),
  Trainings(id: 23, title: 'G8D Problem Çözme Metodu'),
  Trainings(id: 24, title: '5 Niçin Kök Neden Analizi'),
  Trainings(id: 25, title: 'KPI Ana Performans Göstergeleri'),
  Trainings(id: 26, title: 'Balık Kılçığı Problem Çözme'),
  Trainings(id: 27, title: 'Etkili Toplantı Yapma'),
  Trainings(id: 28, title: 'Şirketlerde Kurumsallık'),
  Trainings(id: 29, title: 'PPAP Üretim Parçası Onay Prosesi'),
  Trainings(id: 30, title: 'Pareto Analizi'),
  Trainings(id: 31, title: 'Acil Durum Planlama'),
  Trainings(id: 32, title: 'Çalışan Performans Yönetimi'),
  Trainings(id: 33, title: 'Misyon, Vizyon ve Değerler'),
  Trainings(id: 34, title: 'Organizasyon Şeması ve Görev Tanımları'),
  Trainings(id: 35, title: 'Yönetim Dersleri'),
  Trainings(id: 36, title: 'Küçük Şirketler için Satış'),
  Trainings(id: 37, title: 'Yönetim Gözden Geçirmesi'),
  Trainings(id: 38, title: 'İş Planı Yazma - Business Plan'),
  Trainings(id: 39, title: 'Ürün ve Proses Denetimi'),
  Trainings(id: 40, title: 'SPC - İstatistiksel Proses Kontrol'),
];

class BusinessPlanning {
  int id;
  String title;
  String icon;
  double pricing;
  BusinessPlanning({this.icon, this.id, this.pricing, this.title});
}

List<BusinessPlanning> businessPlanList = [
  BusinessPlanning(
      id: 0,
      title: '1 - 25 Çalışan',
      icon: AppConstants.factoryS,
      pricing: 997),
  BusinessPlanning(
      id: 1,
      title: '26 - 100 Çalışan',
      icon: AppConstants.factoryM,
      pricing: 2995),
  BusinessPlanning(
      id: 2,
      title: '101 - 500 Çalışan',
      icon: AppConstants.factoryL,
      pricing: 6990),
  BusinessPlanning(
      id: 3,
      title: '501+ Çalışan',
      icon: AppConstants.factoryXL,
      pricing: 19900),
];
