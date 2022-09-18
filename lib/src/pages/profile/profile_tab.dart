import 'package:flutter/material.dart';
import 'package:mercadin/src/pages/commons_widgets/custom_text_field.dart';
import 'package:mercadin/src/config/app_data.dart' as app_data;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: const [
          //Email
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
          ),
          //Nome
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
          ),
          //phone
          CustomTextField(
            icon: Icons.phone,
            label: 'Celular',
          ),
          //CPF
          CustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),

          // botão para atualizar senha
        ],
      ),
    );
  }
}
