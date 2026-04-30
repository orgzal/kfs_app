import '../models/banner_model.dart';
import '../models/event_model.dart';
import '../models/investment_model.dart';
import '../models/news_model.dart';
import '../models/project_model.dart';
import '../models/service_model.dart';
import '../models/statistic_model.dart';
import '../models/tourism_place_model.dart';

class LocalMockProvider {
  Future<List<BannerModel>> getHomeBanners() async {
    return const [
      BannerModel(
        id: 1,
        title: 'بوابة محافظة كفر الشيخ',
        subtitle: 'خدمات رقمية ومعلومات محلية في مكان واحد',
        imageUrl: 'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?auto=format&fit=crop&w=1200&q=80',
        targetRoute: '/home',
      ),
      BannerModel(
        id: 2,
        title: 'الاستثمار والتنمية',
        subtitle: 'فرص واعدة ومشروعات تدعم النمو المحلي',
        imageUrl: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&w=1200&q=80',
        targetRoute: '/investment',
      ),
      BannerModel(
        id: 3,
        title: 'السياحة والتراث',
        subtitle: 'اكتشف أبرز المقاصد والأنشطة داخل المحافظة',
        imageUrl: 'https://images.unsplash.com/photo-1467269204594-9661b134dd2b?auto=format&fit=crop&w=1200&q=80',
        targetRoute: '/tourism',
      ),
    ];
  }

  Future<List<StatisticModel>> getHomeStatistics() async {
    return const [
      StatisticModel(
        id: 1,
        label: 'الخدمات',
        value: '24',
        unit: 'خدمة',
        iconKey: 'services',
      ),
      StatisticModel(
        id: 2,
        label: 'المشروعات',
        value: '12',
        unit: 'مشروع',
        iconKey: 'projects',
      ),
      StatisticModel(
        id: 3,
        label: 'الفعاليات',
        value: '08',
        unit: 'فعالية',
        iconKey: 'events',
      ),
      StatisticModel(
        id: 4,
        label: 'الفرص',
        value: '16',
        unit: 'فرصة',
        iconKey: 'investment',
      ),
    ];
  }

  Future<List<NewsModel>> getNews() async {
    return [
      NewsModel(
        id: 1,
        title: 'افتتاح مشروع خدمي جديد',
        summary: 'تشغيل خدمة جديدة تستهدف تحسين تجربة المواطنين داخل المراكز الرئيسية.',
        content: 'محتوى الخبر الأول',
        imageUrl: 'https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=900&q=80',
        publishedAt: DateTime(2026, 4, 10),
        category: 'محليات',
      ),
      NewsModel(
        id: 2,
        title: 'تحديثات في البنية التحتية',
        summary: 'استمرار أعمال التطوير في عدد من المحاور والمرافق الحيوية.',
        content: 'محتوى الخبر الثاني',
        imageUrl: 'https://images.unsplash.com/photo-1513828583688-c52646db42da?auto=format&fit=crop&w=900&q=80',
        publishedAt: DateTime(2026, 4, 12),
        category: 'مشروعات',
      ),
      NewsModel(
        id: 3,
        title: 'إطلاق مبادرة تدريب شبابية',
        summary: 'برنامج جديد لرفع المهارات العملية والرقمية للفئات المستهدفة.',
        content: 'محتوى الخبر الثالث',
        imageUrl: 'https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=900&q=80',
        publishedAt: DateTime(2026, 4, 15),
        category: 'تدريب',
      ),
    ];
  }

  Future<List<EventModel>> getEvents() async {
    return [
      EventModel(
        id: 1,
        title: 'ملتقى التوظيف المحلي',
        description: 'فعالية مهنية للشباب ورواد الأعمال بمشاركة جهات متعددة.',
        location: 'مدينة كفر الشيخ',
        date: DateTime(2026, 5, 2),
        imageUrl: 'https://images.unsplash.com/photo-1511578314322-379afb476865?auto=format&fit=crop&w=900&q=80',
        isFeatured: true,
      ),
      EventModel(
        id: 2,
        title: 'مهرجان ثقافي',
        description: 'حدث ثقافي وترفيهي مفتوح يعرض الفن المحلي والأنشطة المصاحبة.',
        location: 'دسوق',
        date: DateTime(2026, 5, 14),
        imageUrl: 'https://images.unsplash.com/photo-1505236858219-8359eb29e329?auto=format&fit=crop&w=900&q=80',
      ),
      EventModel(
        id: 3,
        title: 'ورشة تطوير الأعمال',
        description: 'جلسات عملية لدعم الشركات الناشئة وأصحاب المشروعات الصغيرة.',
        location: 'بلطيم',
        date: DateTime(2026, 5, 22),
        imageUrl: 'https://images.unsplash.com/photo-1515169067868-5387ec356754?auto=format&fit=crop&w=900&q=80',
      ),
    ];
  }

  Future<List<ServiceModel>> getServices() async {
    return const [
      ServiceModel(
        id: 1,
        name: 'خدمة الشكاوى',
        description: 'تقديم ومتابعة الشكاوى إلكترونيًا',
        iconKey: 'feedback',
        route: '/services',
      ),
      ServiceModel(
        id: 2,
        name: 'حجز المواعيد',
        description: 'تنظيم زيارة الجهات الحكومية',
        iconKey: 'calendar',
        route: '/services',
      ),
      ServiceModel(
        id: 3,
        name: 'الاستعلامات',
        description: 'الوصول السريع إلى الإجراءات والمستندات',
        iconKey: 'search',
        route: '/services',
      ),
    ];
  }

  Future<List<ProjectModel>> getProjects() async {
    return const [
      ProjectModel(
        id: 1,
        title: 'تطوير الطرق',
        description: 'رفع كفاءة الطرق والمحاور الحيوية بين المراكز.',
        status: 'قيد التنفيذ',
        progress: 0.65,
        imageUrl: 'https://images.unsplash.com/photo-1504307651254-35680f356dfd?auto=format&fit=crop&w=900&q=80',
      ),
      ProjectModel(
        id: 2,
        title: 'تحديث المرافق',
        description: 'تحسين شبكات الخدمات الأساسية ورفع الاعتمادية.',
        status: 'مخطط',
        progress: 0.20,
        imageUrl: 'https://images.unsplash.com/photo-1489515217757-5fd1be406fef?auto=format&fit=crop&w=900&q=80',
      ),
      ProjectModel(
        id: 3,
        title: 'تطوير واجهات خدمية',
        description: 'تحديث بيئة تقديم الخدمات في عدد من المواقع.',
        status: 'قيد المراجعة',
        progress: 0.45,
        imageUrl: 'https://images.unsplash.com/photo-1431576901776-e539bd916ba2?auto=format&fit=crop&w=900&q=80',
      ),
    ];
  }

  Future<List<InvestmentModel>> getInvestments() async {
    return const [
      InvestmentModel(
        id: 1,
        title: 'منطقة صناعية',
        sector: 'الصناعة',
        description: 'فرصة لتوسعة أنشطة التصنيع والخدمات الداعمة.',
        budget: 2500000,
        location: 'مطوبس',
      ),
      InvestmentModel(
        id: 2,
        title: 'مشروع لوجستي',
        sector: 'الخدمات اللوجستية',
        description: 'خدمات دعم النقل وسلاسل الإمداد وتوزيع البضائع.',
        budget: 1800000,
        location: 'كفر الشيخ',
      ),
      InvestmentModel(
        id: 3,
        title: 'وجهة تجارية',
        sector: 'التجزئة',
        description: 'مشروع متعدد الاستخدامات في موقع حيوي داخل العاصمة.',
        budget: 3200000,
        location: 'وسط المدينة',
      ),
    ];
  }

  Future<List<TourismPlaceModel>> getTourismPlaces() async {
    return const [
      TourismPlaceModel(
        id: 1,
        name: 'بحيرة البرلس',
        description: 'وجهة طبيعية مميزة للرحلات والأنشطة البيئية.',
        address: 'البرلس',
        imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=900&q=80',
        rating: 4.7,
      ),
      TourismPlaceModel(
        id: 2,
        name: 'متحف محلي',
        description: 'معرض للتراث والتاريخ المحلي بمحتوى متنوع.',
        address: 'وسط المدينة',
        imageUrl: 'https://images.unsplash.com/photo-1518998053901-5348d3961a04?auto=format&fit=crop&w=900&q=80',
        rating: 4.3,
      ),
      TourismPlaceModel(
        id: 3,
        name: 'ممشى ساحلي',
        description: 'منطقة مفتوحة للزيارة والأنشطة العائلية.',
        address: 'مصيف بلطيم',
        imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
        rating: 4.5,
      ),
    ];
  }
}
