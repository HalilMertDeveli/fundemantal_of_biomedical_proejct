import 'package:fundemetals_of_biomedical/fundemantal_core/ientity_repository_base.dart';
import 'package:fundemetals_of_biomedical/fundemantal_entities/abstract/iapplication_user.dart';

class FbEntityFirebaseRepositoryBase<TEntity> extends IEntityRepositoryBase<IApplicationUser>{
  @override
  Future<TEntity?> userCreate({required TEntity Entity}) {
    // TODO: implement userCreate
    throw UnimplementedError();
  }

  @override
  List<TEntity> userGets() {
    // TODO: implement userGets
    throw UnimplementedError();
  }

  @override
  Future<TEntity?> userLogin({required TEntity Entity}) {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
  Future<void> userSignOut() {
      
  }

}