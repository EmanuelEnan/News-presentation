import 'package:bloc_3/models/news.dart';
import 'package:bloc_3/repos/news_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo newsRepo;
  NewsCubit({required this.newsRepo}) : super(NewsInitial());

  void fetchNews() {
    newsRepo.getNews().then((n) {
      emit(
        NewsLoaded(allNews: n),
      );
    });
  }
}
