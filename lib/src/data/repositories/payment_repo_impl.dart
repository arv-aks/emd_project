
import 'package:dio/dio.dart';
import 'package:emd_project/src/domain/api_provider.dart';
import 'package:emd_project/src/domain/repositories/payment_repo.dart';
import 'package:emd_project/src/domain/result.dart';

class PaymentRepoImpl extends PaymentRepo {
  final Dio _dio;
  PaymentRepoImpl() : _dio = ApiProvider.getDio();

  @override
  Future<Result> createPaymentIntent() async {
    Map<String, dynamic> body = {
      "amount": "1000",
      "currency": "USD",
    };

    try {
      final response =
          await _dio.post("https://api.stripe.com/v1/payment_intents",
              data: body,
              options: Options(headers: {
                "Authorization":
                    "Bearer sk_test_51PYtoFIrqOXT1j7hLGQHaNL0yZHLk2RNHe5yPocxMv0Pa6zaGDDPF3jOTWR9gDMhr7z3Ht27P1T5HKT8c3JSGihI00b7f9CLP5",
                "Content-Type": "application/x-www-form-urlencoded",
              }));
      return Success(data: response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception(e);
    }
  }
}
