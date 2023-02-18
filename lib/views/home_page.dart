import 'package:bloc_3/cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<NewsCubit>(context);

    cubit.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEWS'),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
        if (state is NewsInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsLoaded) {
          final newsValue = state.allNews;

          return ListView.builder(
            itemCount: newsValue.length,
            itemBuilder: (context, index) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: newsValue[index].articles.length,
                itemBuilder: (context, index1) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          Text(newsValue[index].articles[index1].title),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(newsValue[index].articles[index1].description),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else if (state is NewsErrors) {
          return Text(state.errors);
        } else {
          return const Text('errors');
        }
      }),
    );
  }
}
