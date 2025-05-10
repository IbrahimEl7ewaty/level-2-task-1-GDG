import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/core/icons.dart';
import 'package:level_1_task_gdg/screens/auth/create_account_view/data/cubit/create_account_cubit.dart';
import 'package:level_1_task_gdg/screens/auth/login_view/login_view.dart';
import 'package:level_1_task_gdg/screens/home/home_view.dart';
import 'package:level_1_task_gdg/widget/container_defult.dart';
import 'package:level_1_task_gdg/widget/text_comic_neue.dart';
import 'package:level_1_task_gdg/widget/text_bottom.dart';
import 'package:level_1_task_gdg/widget/text_form.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, CreateAccountState>(
      listener: (context, state) {
        if (state is CreateAccountSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Login Success')));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        } else if (state is CreateAccountError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),

                  SvgPicture.asset(AppIcons.arrowCircle),

                  SizedBox(height: 20),

                  TextComicNeue(
                    text: "Create Account",
                    size: 24,
                    fontWeight: FontWeight.w400,
                    color: AppColor.text,
                  ),

                  SizedBox(height: 15),

                  TextComicNeue(
                    text:
                        "Enter your information below or continue with \nsocial media account",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.text,
                  ),
                  SizedBox(height: 15),

                  TextComicNeue(
                    text: "Email",
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.text,
                  ),
                  SizedBox(height: 10),
                  TextForm(
                    prefixIcon: AppIcons.email,
                    hintText: "Ex: abc@example.com",
                    controller:
                        context.read<CreateAccountCubit>().emailController,
                  ),
                  SizedBox(height: 20),

                  TextComicNeue(
                    text: "Your Name",
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.text,
                  ),
                  SizedBox(height: 10),
                  TextForm(
                    prefixIcon: AppIcons.account,
                    hintText: "Ex. Saul Ramirez",
                    controller:
                        context.read<CreateAccountCubit>().usernameController,
                  ),
                  SizedBox(height: 20),

                  TextComicNeue(
                    text: "Your Password",
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.text,
                  ),
                  SizedBox(height: 10),
                  TextForm(
                    prefixIcon: AppIcons.password,
                    hintText: "***********",
                    controller:
                        context.read<CreateAccountCubit>().passwordController,
                  ),

                  SizedBox(height: 30),
                  state is CreateAccountLoading
                      ? Center(child: CircularProgressIndicator())
                      : DefultTextBottom(
                        data: "Create Account",
                        color: AppColor.white,
                        size: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          context.read<CreateAccountCubit>().createAccount();
                        },
                      ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        TextComicNeue(
                          text: "Or Register with Social Accounts",
                          size: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColor.text,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerDefult(iconPathSVG: AppIcons.google),
                            ContainerDefult(iconPathSVG: AppIcons.facebook),
                            ContainerDefult(iconPathSVG: AppIcons.iphone),
                            ContainerDefult(iconPathSVG: AppIcons.twitter),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextComicNeue(
                              text: "Already have an account?",
                              size: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColor.text,
                            ),
                            TextButton(
                              onPressed: () {
                                // context.read<SignInCubit>().signIn();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginView(),
                                  ),
                                );
                              },
                              child: TextComicNeue(
                                text: "Login Now",
                                size: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColor.purple,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
