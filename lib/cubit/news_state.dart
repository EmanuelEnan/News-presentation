part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> allNews;

  NewsLoaded({required this.allNews});
}

class NewsErrors extends NewsState {
  final String errors;

  NewsErrors({required this.errors});
}
