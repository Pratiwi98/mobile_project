import 'package:mobile_project/models/user_model.dart';
import 'package:mobile_project/utilities/constants.dart';

class DatabaseService{
  static void updateUser(User user){
    usersRef.document(user.id).updateData({
      'name' : user.name,
      'profileImageUrl' : user.profileImageUrl,
      'bio': user.bio,
    });

  }
}