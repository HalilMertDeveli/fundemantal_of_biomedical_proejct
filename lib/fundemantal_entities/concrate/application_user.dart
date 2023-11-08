import 'package:fundemetals_of_biomedical/fundemantal_entities/abstract/iapplication_user.dart';

class ApplicationUser implements IApplicationUser{
  final String userId;
  final String userEmail;

  ApplicationUser({required this.userId, required this.userEmail});


}