import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/usecases/use_cases.dart';
import 'package:waster/features/impact/domain/entity/impact_entity.dart';
import 'package:waster/features/impact/domain/usecase/get_impact_use_case.dart';

part 'impact_state.dart';

class ImpactCubit extends Cubit<ImpactState> {
  ImpactCubit({required this.getImpactUseCase}) : super(const ImpactInitial());
  final GetImpactUseCase getImpactUseCase;

  Future<void> loadImpactStats() async {
    emit(const ImpactLoading());
    final result = await getImpactUseCase.call(NoParams());
    result.fold(
      (failure) => emit(ImpactFailure(errorMessage: failure.message)),
      (impactModel) => emit(ImpactSuccess(impactEntity: impactModel)),
    );
  }
}
