import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mercadin/src/pages/auth/controller/auth_controller.dart';
import 'package:mercadin/src/pages_routes/app_pages.dart';

import '../../../config/custom_colors.dart';
import '../../../services/validators.dart';
import '../../commons_widgets/app_name_widget.dart';
import '../../commons_widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  //CONTROLADOR DE CAMPOS
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Nome do App
                    const AppNameWidget(
                      mercadinTitleColor: Colors.white,
                      textSize: 40,
                    ),
                    // Categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(pause: Duration.zero, repeatForever: true, animatedTexts: [
                          FadeAnimatedText('Frutas'),
                          FadeAnimatedText('Verduras'),
                          FadeAnimatedText('Massas'),
                          FadeAnimatedText('Cereais')
                        ]),
                      ),
                    )
                  ],
                ),
              ),

              // Formulário
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email,
                        label: 'Email',
                        validator: emailValidator,
                      ),

                      // Senha
                      CustomTextField(
                        controller: passwordController,
                        isSecret: true,
                        icon: Icons.lock,
                        label: 'Senha',
                        validator: passwordValidator,
                      ),

                      //Botão entrar
                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          String email = emailController.text;
                                          String password = passwordController.text;

                                          authController.signin(email: email, password: password);
                                          //Get.offNamed(PagesRoutes.baseRoute);
                                        }
                                      },
                                child: authController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        'Entrar',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ));
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(color: CustomColors.customContrastColor),
                            )),
                      ),

                      // DIVISOR
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text('Ou'),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Botão Criar Conta

                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                                side: const BorderSide(width: 2, color: Colors.green)),
                            onPressed: () {
                              Get.toNamed(PagesRoutes.signUpRoute);
                            },
                            child: const Text(
                              'Criar conta',
                              style: TextStyle(fontSize: 18),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
