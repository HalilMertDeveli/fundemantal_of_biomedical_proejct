class ModelUser{
  final int userId;
  final String userEmail;
  final String userPassword;
  final DateTime userBirthDate;

  ModelUser(this.userId,{ required this.userEmail, required this.userPassword, required this.userBirthDate});
}