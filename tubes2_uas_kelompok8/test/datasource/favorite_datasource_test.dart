import 'package:flutter_test/flutter_test.dart';
import 'package:tubes2_uas_kelompok8/data/breeds/datasource/breeds_datasource.dart';
import 'package:tubes2_uas_kelompok8/data/favorite/datasource/favorite_datasource.dart';
void main() {
  group('Favorite Datasource test', () {
    late FavoriteDatasource favoriteDatasource;
    setUp(() {
      favoriteDatasource = FavoriteDatasource();
    });
    test('get Favorite return correct data when succesfully', () async {
      final response = await favoriteDatasource.getFavorite();
      expect(response.length, greaterThan(0));
      expect(response[0].id, isNotNull);
    });
    test('create Favorite return correct data when succesfully', () async {
      final favoriteReqModel = FavoriteRequestsModelPost(
        imageId: 'a2s',
        subId: 'test_i1'
      );
      final response = await favoriteDatasource.createFavorite(favoriteReqModel);
      if (response != null) {
        expect(response.message, equals("SUCCESS"));
      } else {
        fail('response is null');
      }
    });
    
    test('search Favorite return correct data when succesfully', () async {
      final favoriteId = 232501209;
      final response = 
      await favoriteDatasource.searchFavorite(favoriteId);
      if (response != null) {
        expect(response.id, equals(favoriteId));
      } else {
        fail('response is null');
      }
    });
    test('delete Favorite return correct data when succesfully', () async {
      final favoriteId = 232501209;
      final response = 
      await favoriteDatasource.deleteFavorite(favoriteId);
      expect(response?.message, equals("SUCCESS"));
    });
  });
}