import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/home/data/models/activites_models/activites_model.dart';

List<NewsItem> getDummyBanners() {
  return [
    NewsItem(
      id: 1,
      title: 'خبر رقم 1',
      description: 'ده وصف تجريبي للخبر الأول',
      activate: Activate(id: 1, title: 'مفعل'),
      status: 1,
      typeOption: 'practice',
      image: '/News/dummy_image_1.png',
      createdAt: '2025-08-31 12:00:00',
      updatedAt: '2025-08-31 12:00:00',
    ),
    NewsItem(
      id: 2,
      title: 'خبر رقم 2',
      description: 'ده وصف تجريبي للخبر التاني',
      activate: Activate(id: 2, title: 'غير مفعل'),
      status: 0,
      typeOption: 'announcement',
      image: '/News/dummy_image_2.jpeg',
      createdAt: '2025-08-31 13:00:00',
      updatedAt: '2025-08-31 13:00:00',
    ),
    NewsItem(
      id: 3,
      title: 'خبر رقم 3',
      description: 'ده وصف تجريبي للخبر التالت',
      activate: Activate(id: 1, title: 'مفعل'),
      status: 1,
      typeOption: 'event',
      image: '/News/dummy_image_3.png',
      createdAt: '2025-08-31 14:00:00',
      updatedAt: '2025-08-31 14:00:00',
    ),
  ];
}



List<ActivityItem> getDummyActivitiesList() {
  return [
    ActivityItem(
      id: 1,
      title: "332",
      description: "3444444444",
      type: null,
      image:
      "/Activates/1756655605_d5282c72-decf-41e3-9cc1-9d84f13ce576.jpeg",
      createdAt: "2025-08-31 15:53:26",
      updatedAt: "2025-08-31 15:53:26",
    ),
    ActivityItem(
      id: 2,
      title: "Activity 2",
      description: "ده وصف تجريبي للنشاط التاني",
      type: "event",
      image: "/Activates/dummy_image_2.png",
      createdAt: "2025-08-31 16:00:00",
      updatedAt: "2025-08-31 16:00:00",
    ),
    // ActivityItem(
    //   id: 3,
    //   title: "Activity 3",
    //   description: "ده وصف تجريبي للنشاط التالت",
    //   type: "announcement",
    //   image: "/Activates/dummy_image_3.jpeg",
    //   createdAt: "2025-08-31 17:00:00",
    //   updatedAt: "2025-08-31 17:00:00",
    // ),
    // ActivityItem(
    //   id: 4,
    //   title: "Activity 4",
    //   description: "وصف إضافي للنشاط الرابع",
    //   type: "practice",
    //   image: "/Activates/dummy_image_4.png",
    //   createdAt: "2025-08-31 18:00:00",
    //   updatedAt: "2025-08-31 18:00:00",
    // ),
  ];
}




