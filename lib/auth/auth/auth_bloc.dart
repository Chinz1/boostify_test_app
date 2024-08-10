import 'package:boostify_test_app/auth/auth/auth_event.dart';
import 'package:boostify_test_app/auth/auth/auth_repository.dart';
import 'package:boostify_test_app/auth/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await authRepository.getUser(event.email, event.password);

      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(const AuthFailure('Invalid email or password'));
      }
    } catch (e) {
      emit(const AuthFailure('An error occurred. Please try again.'));
    }
  }
}
