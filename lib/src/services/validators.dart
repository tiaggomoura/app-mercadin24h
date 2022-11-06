import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email!';
  }
  if (!email.isEmail) {
    return 'Digite um email válido.';
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'Digite seu password!';
  }
  if (password.length < 8) {
    return 'Digite senha com no mínimo 8 caracteres.';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite um nome!';
  }

  final names = name.split(' ');
  if (names.length == 1) {
    return 'Digite seu nome e sobrenome.';
  }

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um número de Celular.';
  }

  if (phone.length < 15 || !phone.isPhoneNumber) {
    return 'Digite um número de celular válido.';
  }
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite seu CPF.';
  }

  if (!cpf.isCpf) return 'Digite um CPF válido.';

  return null;
}
