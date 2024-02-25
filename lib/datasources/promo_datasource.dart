import 'package:dlaundry_mobile/config/app_constants.dart';
import 'package:dlaundry_mobile/config/app_request.dart';
import 'package:dlaundry_mobile/config/app_response.dart';
import 'package:dlaundry_mobile/config/app_session.dart';
import 'package:dlaundry_mobile/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class PromoDatasource {
  static Future<Either<Failure, Map>> readLimit() async {
    Uri url = Uri.parse('${AppConstants.baseURL}/promo/limit');
    final token = await AppSession.getBearerToken();

    try {
      final response = await http.get(
        url,
        headers: AppRequest.header(token),
      );

      final data = AppResponse.data(response);

      return Right(data);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }

      return Left(FetchFailure(message: e.toString()));
    }
  }
}
