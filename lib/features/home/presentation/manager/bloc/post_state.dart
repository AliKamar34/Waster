part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {
  const PostInitial();
}

final class PostLoading extends PostState {
  const PostLoading();
}

final class PostSuccess extends PostState {
  const PostSuccess();
}

final class PostFailure extends PostState {
  final String message;

  const PostFailure({required this.message});

  @override
  List<Object> get props => [message];
}
