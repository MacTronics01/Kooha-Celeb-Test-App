
import 'package:kooha_movie_app/data/services/storage-service.dart';
import '../../locator.dart';
import 'app_cache.dart';

class UserServices{
  StorageService storageService =  getIt<StorageService>();
  AppCache cache = getIt<AppCache>();


  // storeUser(UserResponse? userResponse) async{
  //   storageService.storeItem(key: DbTable.USER_TABLE_NAME, value: jsonEncode(userResponse));
  // }
  //
  // logout() async{
  //   storageService.deleteAllItems();
  //   cache.clearCache();
  // }
  //
  // Future<UserResponse?> getUser()  async {
  //   final data = await storageService.readItem(key: DbTable.USER_TABLE_NAME);
  //   if(data==null || data =="null" ){
  //     return null;
  //   }else{
  //     UserResponse userResponse = UserResponse.fromJson(jsonDecode(data));
  //     return userResponse;
  //   }
  // }


}