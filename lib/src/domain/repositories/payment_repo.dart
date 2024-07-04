import 'package:emd_project/src/domain/result.dart';

abstract class PaymentRepo{
Future<Result> createPaymentIntent();
}