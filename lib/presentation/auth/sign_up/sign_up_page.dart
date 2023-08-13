import 'package:eriell/presentation/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:eriell/ui/components/app_bar/custom_app_bar.dart';
import 'package:eriell/ui/components/text_fields/eriell_text_field.dart';
import 'package:eriell/ui/components/text_fields/eriell_password_text_field.dart';
import 'package:eriell/ui/components/buttons/eriell_button.dart';
import 'package:eriell/ui/themes/app_style.dart';
import 'package:eriell/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EriellAppBar(title: "Sign up"),
      body: BlocProvider(
        create: (_) => SignUpBloc(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text(
                "Eriell Membership",
                style: AppStyle.interW700x20WBlack,
              ),
              const SizedBox(height: 4),
              Text(
                "Please, sign up to become a member!",
                style: AppStyle.interW500x12WGrey,
              ),
              const SizedBox(height: 24),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  bool isValidName = true;
                  if (state is NameStatusState) {
                    isValidName = state.isValidName;
                  }
                  return EriellTextField(
                    hintText: "Username or login",
                    onChanged: (String value) =>
                        BlocProvider.of<SignUpBloc>(context).add(
                      OnNameChangedEvent(value),
                    ),
                    textInputAction: TextInputAction.next,
                    error: isValidName ? null : "Must be at least 4 characters",
                  );
                },
              ),
              const SizedBox(height: 12),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  final bloc = context.read<SignUpBloc>();
                  bool isValidPassword = true;
                  if (state is PasswordStatusState) {
                    isValidPassword = state.isValidPassword;
                  }
                  return EriellPasswordTextField(
                    hintText: "Password",
                    controller: bloc.passwordController,
                    onChanged: (String value) =>
                        BlocProvider.of<SignUpBloc>(context).add(
                      OnPasswordChangedEvent(value),
                    ),
                    textInputAction: TextInputAction.next,
                    error: isValidPassword
                        ? null
                        : "Must be at least 6 characters",
                  );
                },
              ),
              const SizedBox(height: 12),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  bool isSamePassword = true;
                  if (state is RepeatPasswordStatusState) {
                    isSamePassword = state.isSamePassword;
                  }
                  return EriellPasswordTextField(
                    hintText: "Repeat password",
                    onChanged: (String value) =>
                        BlocProvider.of<SignUpBloc>(context).add(
                      OnRepeatPasswordChangedEvent(value),
                    ),
                    error:
                        isSamePassword ? null : "Must be the same as password",
                  );
                },
              ),
              const SizedBox(height: 24),
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  final bloc = context.read<SignUpBloc>();
                  return EriellButton(
                    isActive: bloc.isButtonEnabled,
                    onPressed: () => context.go(Routes.home),
                    title: "Sign in",
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already a member?',
              style: AppStyle.interW500x14Grey,
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => context.go(Routes.signIn),
              child: Text(
                'Sign in',
                style: AppStyle.interW600x16WBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
