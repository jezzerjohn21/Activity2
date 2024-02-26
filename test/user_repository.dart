
import 'package:activity2/models/user.dart';
import 'package:activity2/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockClient;
  late UserRespository userRespository;

  setUp(() {
    mockClient = MockHttpClient();
    userRespository = UserRespository(mockClient);
  });

  test(
      'Given HomeScreen  is instantiate, When getUsers is called and return is 200, then a Task object shount be returned,',
      () async {
    //Arrange
    String uri = 'https://jsonplaceholder.typicode.com/users';

    //Act
    when(() => mockClient.get(Uri.parse(uri))).thenAnswer(
        (_) => Future.delayed(Duration.zero, () => Response('''

[
  {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  }

  ]
'''
, 200)));

    //Assert

    User user = await userRespository.fetchUser();
    expect(user, isA<User>());

    verify(() => mockClient.get(Uri.parse(uri))).called(1);
    
  });


   test(
      'Given User Repository is instantiate, When fetchUser is called and return is 404, then a Users object shounld be thrown',
      () 
        async {
    String uri = 'https://jsonplaceholder.typicode.com/users';

    when(() => mockClient.get(Uri.parse(uri)))
        .thenAnswer((_) => Future.delayed(Duration.zero, () => Response('', 404)));

// TaskRespository taskRespository = TaskRespository();

    expect(userRespository.fetchUser(), throwsException);

      });





}
