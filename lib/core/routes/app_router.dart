import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/activites/presentation/views/activity_details_view.dart';
import 'package:fayoum_club/features/activites/presentation/views/trainer_view.dart';
import 'package:fayoum_club/features/general/presentation/views/contact_us_view.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/home/presentation/views/home_page.dart';
import 'package:fayoum_club/features/home/presentation/views/news_details_view.dart';
import 'package:fayoum_club/features/profile/presentation/view/profile_view.dart';
import 'package:go_router/go_router.dart';
import '../../features/login/presentation/views/login_view.dart';
import '../../features/register/presentation/views/register_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const welcomeView = '/welcomeView';
  static const loginView = '/loginView';
  static const registerView = '/registerView';
  static const homePage = '/homePage';
  static const activityDetailsView = '/activityDetailsView';
  static const trainerView = '/trainerView';
  static const newsDetailsView = '/newsDetailsView';



  static const profileView = '/profileView';
  static const contactUsView = '/contactUsView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      // GoRoute(
      //   path: welcomeView,
      //   builder: (context, state) => const WelcomeView(),
      // ),
      GoRoute(path: loginView, builder: (context, state) => const LoginView()),
      GoRoute(path: registerView, builder: (context, state) => const RegisterView()),
      GoRoute(path: homePage, builder: (context, state) => const HomePage()),
      GoRoute(
        path: newsDetailsView,
        builder: (context, state) {
          final NewsItem news=state.extra as NewsItem;
          return  NewsDetailsView(news: news);
        },
      ),
      GoRoute(
        path: activityDetailsView,
        builder: (context, state) {
          final int id=state.extra as int;
          return  ActivityDetailsView(id: id);
        },
      ),
      GoRoute(
        path: trainerView,
        builder: (context, state) {
          final CaptainModel trainer=state.extra as CaptainModel;
          return  TrainerView(trainer: trainer);
        },
      ),
      GoRoute(path: profileView, builder: (context, state) => const ProfileView()),
      GoRoute(path: contactUsView, builder: (context, state) => const ContactUsView()),
    ],
  );
}
