import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mercadin/src/pages/commons_widgets/custom_text_field.dart';

import '../../../config/custom_colors.dart';
import '../../../services/validators.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  final phoneFormatter = MaskTextInputFormatter(mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),

                  // Formulário
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            icon: Icons.email,
                            label: 'Email',
                            validator: emailValidator,
                            textInputType: TextInputType.emailAddress,
                          ),
                          const CustomTextField(
                            icon: Icons.lock,
                            label: 'Senha',
                            validator: passwordValidator,
                            isSecret: true,
                          ),
                          const CustomTextField(
                            icon: Icons.person,
                            label: 'Nome',
                            validator: nameValidator,
                          ),
                          CustomTextField(
                            icon: Icons.phone,
                            label: 'Celular',
                            inputFormatters: [phoneFormatter],
                            textInputType: TextInputType.phone,
                            validator: phoneValidator,
                          ),
                          CustomTextField(
                            icon: Icons.file_copy,
                            label: 'CPF',
                            inputFormatters: [cpfFormatter],
                            textInputType: TextInputType.number,
                            validator: cpfValidator,
                          ),
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                                  onPressed: () {
                                    _formKey.currentState!.validate();
                                  },
                                  child: const Text(
                                    'Cadastrar usuário',
                                    style: TextStyle(fontSize: 18),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
