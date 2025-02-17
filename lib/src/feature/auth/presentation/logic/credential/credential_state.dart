part of 'credential_cubit.dart';

sealed class CredentialState extends Equatable {
  const CredentialState();

  @override
  List<Object> get props => [];
}

final class CredentialInitial extends CredentialState {}
