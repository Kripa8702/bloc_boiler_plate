part of 'splash_bloc.dart';

enum SplashStatus { initial, loading, loaded, error }

class SplashState extends Equatable{
  const SplashState({this.event = SplashStatus.initial});

  final SplashStatus event;

  @override
  List<Object?> get props => [event];

  SplashState copyWith({SplashStatus? event}) {
    return SplashState(
      event: event ?? this.event,
    );
  }
}
