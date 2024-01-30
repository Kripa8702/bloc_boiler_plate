import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(const LandingPageState(tabIndex: 0)) {
    on<TabChange>(_onTabChange);
  }
  _onTabChange(TabChange event, Emitter<LandingPageState> emit){
    emit(LandingPageState(tabIndex: event.tabIndex));
  }
}
