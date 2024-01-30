part of 'landing_page_bloc.dart';

class LandingPageEvent {}

class TabChange extends LandingPageEvent{
  final int tabIndex;

  TabChange({required this.tabIndex});
}
