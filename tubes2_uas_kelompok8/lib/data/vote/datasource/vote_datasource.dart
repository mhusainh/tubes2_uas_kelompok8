import 'package:tubes2_uas_kelompok8/core/api_services/dio_module.dart';
import 'package:tubes2_uas_kelompok8/core/api_services/endpoint.dart';
import 'package:tubes2_uas_kelompok8/data/vote/responsesmodel/vote_responses_model_delete.dart';
import 'package:tubes2_uas_kelompok8/data/vote/responsesmodel/vote_responses_model_get.dart';
import 'package:tubes2_uas_kelompok8/data/vote/responsesmodel/vote_responses_model_post.dart';
import 'package:tubes2_uas_kelompok8/data/vote/requestsmodel/vote_requests_model.dart';
import 'package:tubes2_uas_kelompok8/data/vote/responsesmodel/vote_responses_model.dart';
class VoteDatasource {
  final HttpManager httpManager = HttpManager();
  Future<List<VoteResponsesModelGet>> getVote() async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        method: HttpMethods.get,
        useAuth: true,
      );
      PrintLog.printLog("get Vote datasource responses : ${response}");
      if (response['statusCode'] == 200) {
        final List<dynamic> data = response['data'];
        return data.map((item){
          if (item ['image'] != null || item ['image'].isEmpty) {
            item['image'] = {'id': '', 'url': ''};
          }
          return VoteResponsesModelGet.fromJson(item);
        }).toList();
      } else {
        throw Exception(
            'Failed to load search voteresponse['statusMessage']}');
      }
    } catch (e) {
      throw Exception('Failed to load search vote');
    }
  }
  Future<VoteResponsesModelPost?> createVote(
      VoteRequestsModel data) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.voteGetEndpoint,
        method: HttpMethods.post,
        useAuth: true,
        body: data.toJson(),
      );
      final statusCode = response['statusCode'];
      final statusMessage = response['statusMessage'];
      if (statusCode == 200 || statusMessage == 201) {
        if (response['data'] != null && 
            response['data'] is Map<String, dynamic>) {
          
          PrintLog.printLog("create Vote datasource responses  $response['data']");
          return VoteResponsesModelPost.fromJson(response['data']);
        } else {
          PrintLog.printLog("create Vote datasource responses : ${response}");
        return VoteResponsesModelPost(
          message: StatusMessage ?? "SUCCESS",
          id: 0,
          imageId: '',
          subId: '',
          value: 0,
          countryCode: '',
        );
        }
      }
      else {
        PrintLog.printLog(
          "create Vote datasource responses : ${StatusMessage ?? "Unknown"}");
          return null;
      }
    } catch (e) {
      throw Exception('Failed to load search vote');
    }
  }
  Future<VoteResponsesModelDelete?> deleteVote(
      int voteId) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.voteByGetEndpoint(voteId),
        method: HttpMethods.delete,
        useAuth: true,
      );
      final message = response['message'];
      final statusMessage = response['statusMessage'];
      if (message == 'SUCCESS' || statusMessage == "OK") {
        if (response['data'] != null &&
            response['data'] is Map<String, dynamic>) {
          return VoteResponsesModelDelete.fromJson(response['data']);
        } else {
          return VoteResponsesModelDelete(message: message ?? "SUCCESS");
        }
      } else {
        PrintLog.printLog(
          "delete Vote datasource responses : ${StatusMessage ?? "Unknown"}",
        );
        return null;
      }
    } catch (e) {
      PrintLog.printLog(
        "delete Vote datasource responses : ${StatusMessage ?? "Unknown"}",
      );
      return null;
    }
  }
  Future<VoteResponsesModelSearch?> searchVote(int voteId) async {
    try {
      final response = await httpManager.restRequest(
        url: ApiConstants.voteByGetEndpoint(voteId),
        method: HttpMethods.get,
        useAuth: true,
      );
      if (response['statusCode'] == 200) {
        PrintLog.printLog("search Vote datasource responses : ${response['response']}");  
        return VoteResponsesModelSearch.fromJson(response['data']);
      } else {
        PrintLog.printLog(
          "search Vote datasource responses : ${response['statusMessage'] ?? "Unknown"}",
        );
        return null;
      }
    } catch (e) {
      throw Exception('Failed to load search vote');
    }
  }
}