import 'package:bloc/bloc.dart';
import 'package:side_bar/pages/dashboard.dart';
import 'package:side_bar/pages/home_page.dart';
import 'package:side_bar/pages/notifications.dart';
import 'package:side_bar/pages/search.dart';
import 'package:side_bar/pages/settings.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  DashboardPageClickedEvent,
  SearchPageClickedEvent,
  NotificationsPageClickedEvent,
  SettingsPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.DashboardPageClickedEvent:
        yield DashboardPage();
        break;
      case NavigationEvents.SearchPageClickedEvent:
        yield SearchPage();
        break;
      case NavigationEvents.NotificationsPageClickedEvent:
        yield NotificationsPage();
        break;
      case NavigationEvents.SettingsPageClickedEvent:
        yield SettingsPage();
        break;
    }
  }
}
