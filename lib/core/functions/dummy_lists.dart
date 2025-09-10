import 'package:fayoum_club/core/utils/app_constants.dart';
import 'package:fayoum_club/core/data/models/activity_model.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/activites/data/models/activites_model/activites_model.dart';

List<NewsItem> getDummyBanners() {
  return [
    NewsItem(
      id: 1,
      title: 'خبر رقم 1',
      description: 'ده وصف تجريبي للخبر الأول',
      activate: ActivityModel(id: 1, title: 'مفعل'),
      status: 1,
      typeOption: 'practice',
      image: '/News/dummy_image_1.png',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    NewsItem(
      id: 2,
      title: 'خبر رقم 2',
      description: 'ده وصف تجريبي للخبر التاني',
      activate: ActivityModel(id: 2, title: 'غير مفعل'),
      status: 0,
      typeOption: 'announcement',
      image: '/News/dummy_image_2.jpeg',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    NewsItem(
      id: 3,
      title: 'خبر رقم 3',
      description: 'ده وصف تجريبي للخبر التالت',
      activate: ActivityModel(id: 1, title: 'مفعل'),
      status: 1,
      typeOption: 'event',
      image: '/News/dummy_image_3.png',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
}

List<NewsItem> getDummyNews() {
  return [
    NewsItem(
      id: 1,
      title: 'خبر رقم 1',
      description: 'ده وصف تجريبي للخبر الأول',
      activate: ActivityModel(id: 1, title: 'مفعل'),
      status: 1,
      typeOption: 'practice',
      image: '/News/dummy_image_1.png',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    NewsItem(
      id: 2,
      title: 'خبر رقم 2',
      description: 'ده وصف تجريبي للخبر التاني',
      activate: ActivityModel(id: 2, title: 'غير مفعل'),
      status: 0,
      typeOption: 'announcement',
      image: '/News/dummy_image_2.jpeg',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    NewsItem(
      id: 3,
      title: 'خبر رقم 3',
      description: 'ده وصف تجريبي للخبر التالت',
      activate: ActivityModel(id: 1, title: 'مفعل'),
      status: 1,
      typeOption: 'event',
      image: '/News/dummy_image_3.png',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
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
      image: "/Activates/1756655605_d5282c72-decf-41e3-9cc1-9d84f13ce576.jpeg",
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

ActivityDetailsData getDummyActivityDetails() {
  return ActivityDetailsData(
    id: 1,
    description:
        "/Activates/1756655605_d5282c72-decf-41e3-9cc1-9d84f13ce576.jpeg ",
    type: null,
    image: AppConstants.noImageUrl,
    title: "332",
    createdAt: "2025-08-31 15:53:26",
    updatedAt: "2025-08-31 15:53:26",
    money: 0,
    moneyMember: 0,
    captains: [
      CaptainModel(
        id: 1,
        name: "332",
        description: "3444444444",
        activateId: 1,
        isActive: 1,
        image: "/Activates/1756680333_98f218b9-02e0-4a1c-a369-3f9c381ae238.jpg",
        createdAt: "2025-08-31 22:45:33",
        updatedAt: "2025-08-31 22:45:33",
      ),
      CaptainModel(
        id: 2,
        name: "قائد إضافي",
        description: "وصف تجريبي لقائد إضافي",
        activateId: 1,
        isActive: 1,
        image: "/Activates/dummy_captain.png",
        createdAt: "2025-09-01 10:00:00",
        updatedAt: "2025-09-01 10:00:00",
      ),
    ],
  );
}
