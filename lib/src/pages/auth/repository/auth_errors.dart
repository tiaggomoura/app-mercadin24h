String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'Email e/ou senha inválidos.';
    case 'Invalid session token':
      return 'Token inválido ou expirou, faça login novamente.';
    default:
      return 'Ocorreu um erro indefinido.';
  }
}
