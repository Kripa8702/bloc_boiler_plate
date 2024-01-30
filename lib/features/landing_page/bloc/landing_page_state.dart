part of 'landing_page_bloc.dart';

class LandingPageState extends Equatable{
  final int tabIndex;

  const LandingPageState({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}
