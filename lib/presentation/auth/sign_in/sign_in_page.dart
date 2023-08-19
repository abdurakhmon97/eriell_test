import 'package:eriell/presentation/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:eriell/ui/components/text_fields/eriell_password_text_field.dart';
import 'package:eriell/ui/components/text_fields/eriell_text_field.dart';
import 'package:eriell/ui/components/app_bar/custom_app_bar.dart';
import 'package:eriell/ui/components/buttons/eriell_button.dart';
import 'package:eriell/ui/themes/app_style.dart';
import 'package:eriell/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EriellAppBar(
        title: "Login",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (context) => SignInBloc(),
          child: BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is CredentialsStatusState) {
                if (state.userExists) {
                  context.go(Routes.home);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Wrong credentials'),
                    ),
                  );
                }
              }
            },
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  "Welcome to Eriell",
                  style: AppStyle.interW700x20WBlack,
                ),
                const SizedBox(height: 4),
                Text(
                  "Please, sign in to continue",
                  style: AppStyle.interW500x12WGrey,
                ),
                const SizedBox(height: 24),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    final bloc = context.read<SignInBloc>();
                    bool isValidName = true;
                    if (state is NameStatusState) {
                      isValidName = state.isValidName;
                    }
                    return EriellTextField(
                      controller: bloc.usernameController,
                      hintText: "Enter username or login",
                      onChanged: (String value) =>
                          BlocProvider.of<SignInBloc>(context).add(
                        OnNameChangedEvent(value),
                      ),
                      textInputAction: TextInputAction.next,
                      error:
                          isValidName ? null : "Enter valid username or login",
                    );
                  },
                ),
                const SizedBox(height: 12),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    final bloc = context.read<SignInBloc>();
                    bool isValidPassword = true;
                    if (state is PasswordStatusState) {
                      isValidPassword = state.isValidPassword;
                    }
                    return EriellPasswordTextField(
                      controller: bloc.passwordController,
                      hintText: "Enter password",
                      onChanged: (String value) =>
                          BlocProvider.of<SignInBloc>(context).add(
                        OnPasswordChangedEvent(value),
                      ),
                      error: isValidPassword ? null : "Enter valid password",
                    );
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    final bloc = context.read<SignInBloc>();
                    return EriellButton(
                      isActive: bloc.isButtonEnabled,
                      onPressed: () =>
                          bloc.add(const OnCheckCredentialsEvent()),
                      title: "Sign in",
                    );
                  },
                ),
              ],
            ),
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
              'Do not have an account?',
              style: AppStyle.interW500x14Grey,
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => context.push(Routes.signUp),
              child: Text(
                'Sign up!',
                style: AppStyle.interW600x16WBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
