import 'package:activity2/models/user.dart';
import 'package:http/http.dart' as http;



 class UserRespository {
  late http.Client client;
 
  UserRespository(this.client);
 
  Future<User> fetchUser() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
 
    if (response.statusCode == 200) {
      return User();
    } else {
      throw Exception();
    }
  }
}