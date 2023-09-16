

import '../../domain/domain/celeb_response.dart';
import '../../domain/domain/login_response.dart';

abstract class UserRepository {
  Future<LoginResponse?> login(String email, String password);
  Future<CelebResponse?> getCeleb(String page, String limit,String q);

}