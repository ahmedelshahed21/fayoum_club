import 'package:equatable/equatable.dart';

class UserSessionState extends Equatable {
  final bool isGuest;

  const UserSessionState({required this.isGuest});

  @override
  List<Object?> get props => [isGuest];
}