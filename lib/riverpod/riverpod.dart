import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundemetals_of_biomedical/model/model_user.dart';

final modelUserProvider = StateNotifierProvider<ModelUserNotifier,ModelUser?>((ref) {
  return ModelUserNotifier();
});
class ModelUserNotifier extends StateNotifier<ModelUser?> {
  ModelUserNotifier() : super(null);

  void setModelUser(ModelUser modelUser) {
    state = modelUser;
  }
}
