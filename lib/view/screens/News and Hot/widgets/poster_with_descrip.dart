import 'package:flutter/material.dart';
import 'package:netflix_/controller/movie_data_geting.dart';
import 'package:netflix_/models/movies.dart';
import 'package:netflix_/view/screens/News%20and%20Hot/widgets/newmovie.dart';

class Describtion extends StatefulWidget {
  const Describtion({super.key});

  @override
  State<Describtion> createState() => _DescribtionState();
}

class _DescribtionState extends State<Describtion> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MovieData().getTrendingMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Center(
                child: Text('No data available'),
              ),
            );
          } else {
            List<Movie> movie = snapshot.data!;
            return Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Newmovies(
                      movie: movie[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: movie.length),
            );
          }
        });
  }
}
