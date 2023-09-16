
import 'package:kooha_movie_app/data/repository/user_repository.dart';
import '../../domain/domain/celeb_response.dart';
import '../../domain/domain/login_response.dart';
import '../remote/user_remote.dart';
import '../services/user_services.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemote userRemote;
  final UserServices userServices;

  UserRepositoryImpl(this.userRemote, this.userServices);

// we fetch user data back to the viewmodel over here

  Future<LoginResponse?> login(String email, String password) async {
    final response = await userRemote.login(email, password);
    return response;
  }
  Future<CelebResponse?> getCeleb(String page, String limit,String q) async {
    final response = await userRemote.getCeleb(page, limit, q);
    return response;
  }


}
