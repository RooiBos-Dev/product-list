import 'package:product_list/service/httpService.dart';

class AuthRepository {
  Future<String?> login(String? username, String? password) async {
    final user = await HttpService.instance.login(username, password);
    return user.sessionId;
  }

  Future<void> register(String? username, String? password) async {
    await HttpService.instance.register(username, password);
  }
}
