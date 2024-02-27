import 'package:activity2/models/user.dart';
import 'package:activity2/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockClient;
  late UserRespository userRespository;

  setUpAll(() {
    mockClient = MockHttpClient();
    userRespository = UserRespository(mockClient);
  });

  test(
    'Given HomeScreen is instantiated, When getUsers is called and returns 200, then a User object should be returned',
    () async {
      // Arrange
      String uri = 'https://jsonplaceholder.typicode.com/users';

      // Act
      when(() => mockClient.get(Uri.parse(uri))).thenAnswer(
        (_) => Future.delayed(
          Duration.zero,
          () => Response('''
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
        ''', 200),
        ),
      );

      // Assert
      List<User> user = await userRespository.fetchUser();
      expect(user, isA<List<User>>());

      verify(() => mockClient.get(Uri.parse(uri))).called(1);
    },
  );

  test(
    'Given UserRepository is instantiated, When fetchUser is called and returns 404, then an exception should be thrown',
    () async {
      // Arrange
      String uri = 'https://jsonplaceholder.typicode.com/users';

      when(() => mockClient.get(Uri.parse(uri)))
          .thenAnswer((_) => Future.delayed(Duration.zero, () => Response('', 404)));

      // Act & Assert
      expect(userRespository.fetchUser(), throwsException);
    },
  );


  
}
