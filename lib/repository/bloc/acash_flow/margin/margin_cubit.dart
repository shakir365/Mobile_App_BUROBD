import 'package:bloc/bloc.dart';
import 'package:buro_employee/repository/models/OutputSheet.dart';
import 'package:equatable/equatable.dart';

import '../../../network/buro_repository.dart';

part 'margin_state.dart';

class MarginCubit extends Cubit<MarginState> {

  final BuroRepository repository;


  MarginCubit(this.repository) : super(MarginInitialState());












}
