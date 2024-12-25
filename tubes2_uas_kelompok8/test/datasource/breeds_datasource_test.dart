import 'package:flutter_test/flutter_test.dart';
import 'package:tubes2_uas_kelompok8/data/breeds/datasource/breeds_datasource.dart';
void main() {
  group('Breeds Datasource test', () {
    late BreedsDatasource breedsDatasource;
    setUp(() {
      breedsDatasource = BreedsDatasource();
    });
    test('getBreeds return correct data when succesfully', () async {
      final response = await breedsDatasource.getBreeds();
      expect(response.length, greaterThan(0));
      expect(response[0].id, isNotNull);
    });
  });
}