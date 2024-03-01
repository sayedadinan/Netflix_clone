import 'package:flutter/material.dart';
import 'package:netflix_/models/movies.dart';

class Newmovies extends StatelessWidget {
  final Movie movie;
  const Newmovies({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mar',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              Text(
                '1',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          movie.movieBackdrop,
                          width: double.infinity,
                          height: 50,
                          fit: BoxFit.cover,
                        ))),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Coming ${movie.releaseDate}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  movie.movieOverview,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 190, 190, 190)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
