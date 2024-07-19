import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_mobile_app/app/data/datasources/location_datasource.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_location_datasource.dart';
import 'package:tractian_mobile_app/app/data/models/location_model.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

import '../../../mocks/fake_location_factory.dart';

class MockClient extends Mock implements GetConnect {}

void main() {
  late ILocationDatasource datasource;
  late GetConnect client;

  final json = FakeLocationFactory.makeJson();

  final responseSuccess = Response(body: [json], statusCode: 200);
  const responseFailure = Response(
    body: {
      'message': 'error',
    },
    statusCode: 404,
  );

  void mockGet(response) {
    when(() => client.get(any())).thenAnswer((_) async => response);
  }

  setUp(() {
    client = MockClient();
    datasource = LocationDatasource(client);
  });

  test('getLocations should return List<LocationModel>', () async {
    mockGet(responseSuccess);
    final expected = Right([LocationModel.fromJson(json)]);

    final result = await datasource.getLocations('');
    result.fold(
      (failure) => fail('Expected a successful result, but got failure'),
      (actualList) {
        expect(actualList.length, expected.value.length);
        for (int i = 0; i < actualList.length; i++) {
          expect(actualList[i], equals(expected.value[i]));
        }
      },
    );

    expect(result, isA<Right<Failure, List<LocationModel>>>());
  });

  test('getLocations should return Failure', () async {
    mockGet(responseFailure);

    final result = await datasource.getLocations('');

    expect(result, isA<Left<Failure, List<LocationModel>>>());
  });
}
