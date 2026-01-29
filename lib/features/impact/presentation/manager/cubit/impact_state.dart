part of 'impact_cubit.dart';

sealed class ImpactState extends Equatable {
  const ImpactState();

  @override
  List<Object> get props => [];
}

final class ImpactInitial extends ImpactState {
  const ImpactInitial();
}

final class ImpactLoading extends ImpactState {
  const ImpactLoading();
}

final class ImpactSuccess extends ImpactState {
  final ImpactEntity impactEntity;

  const ImpactSuccess({required this.impactEntity});

  @override
  List<Object> get props => [impactEntity];
}

final class ImpactFailure extends ImpactState {
  final String errorMessage;

  const ImpactFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
