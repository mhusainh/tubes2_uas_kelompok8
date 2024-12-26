import "package:dio/dio.dart";
import "package:flutter/material.dart"

import "package:tubes2_uas_kelompok8/data/breeds/datasource/breeds_datasource.dart";
import 'package:tubes2_uas_kelompok8/data/favorite/datasource/favorite_datasource.dart';
import 'package:tubes2_uas_kelompok8/data/vote/datasource/vote_datasource.dart';
import "package:tubes2_uas_kelompok8/data/vote/requestsmodel/vote_requests_model.dart";
import "../../../data/breeds/responsesmodel/breeds_responses_model.dart"

class HomeController extends GetController {
  final BreedsDatasource _datasource = BreedsDatasource();
  final VoteDatasource _votedatasource = VoteDatasource();
  final FavoriteDatasource _favoriteDatasource = FavotiteDatasource();
  var image = <BreedsResponsesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    try {
      final images = await _datasource.getBreeds();
      images.value = response;
    } catch (e) {
      Printing.printing("catch error $e");
    }
  }

  void onFavoritePressed(string imageId){
    final favotite = FavoriteRequestsModelPost(
      imageId: imageId,
      subId: "1234",
      );
      _favoriteDatasource.createFavorite(favotite);
  }

  void onLikePressed(string imageId){
    final vote = VoteRequestsModel(
      imageId: imageId,
      subId: "1234",
      );
      _votedatasource.createVote(vote);
  }
}