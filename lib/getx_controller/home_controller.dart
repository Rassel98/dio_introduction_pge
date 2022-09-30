import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/models/user_model.dart';

import '../models/post_model.dart';

class HomeController extends GetxController {
  var index = 1.obs;
  var isLoading = false.obs;
  UserModel? userModel;
  PostModel? postModel;

  // get isLoading => {userModel != null}.obs;
  setIndex(var ind) {
    index.value = ind;
  }

  Future<void> getApiData() async {
    var dio = Dio();
    try {
      var response = await dio.get('https://reqres.in/api/users?page=2');
      //print(response.data);
      if (response.statusCode == 200) {
        isLoading(true);
        userModel = UserModel.fromJson(response.data);
      }
      print(userModel!.data![0].email);
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  Future<void> createUser({required PostModel postModel}) async {
    var dio = Dio();

    try {
      var response = await dio.post(
        'https://reqres.in/api/users',
        data: postModel.toJson(),
      );

      print('User created: ${response.data}');

      postModel = PostModel.fromJson(response.data);
      print(postModel.name);
    } on DioError catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<void> updateUser({
    required PostModel postModel,
    required int id,
  }) async {
    var dio = Dio();

    try {
      var response = await dio.put(
        'https://reqres.in/api/users/$id',
        data: postModel.toJson(),
      );

      print('User updated: ${response.data}');

      postModel = PostModel.fromJson(response.data);
    } on DioError catch (e) {
      print('Error updating user: $e');
    }
  }
  Future<void> deleteUser({required int id}) async {
    var dio=Dio();
    try {
      var response=await dio.delete('https://reqres.in/api/users/$id');
      print('User deleted!${response.headers}');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
