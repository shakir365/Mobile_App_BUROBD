import 'package:buro_employee/repository/models/generate_otp.dart';
import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';

class GenerateOtpCubit extends Cubit<GenerateOTP?> {
  BuroRepository buroRepository;

  GenerateOtpCubit({required this.buroRepository}) : super(null);

  Future<GenerateOTP> getOtp(String userId) async {
    var response = await buroRepository.getOtp(userId);

    emit(response);

    return response;
  }
}
