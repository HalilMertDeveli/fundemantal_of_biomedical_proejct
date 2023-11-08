import 'package:fundemetals_of_biomedical/fundemantal_entities/abstract/iapplication_user.dart';

abstract class IEntityRepositoryBase<T extends IApplicationUser>{
  List<T> userGets();
  Future<T?> userCreate({required T Entity});
  Future<T?> userLogin({required T Entity});
  Future<void>  userSignOut();
}