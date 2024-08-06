import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviemot/home/bloc/home_bloc.dart';
import 'package:moviemot/movie/models/movie/movie.dart';
import 'package:moviemot/movie_details/page/movie_details_page.dart';
import 'package:moviemot/utils/constant.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Movie(:posterPath, :title, :releaseDate) = movie;
    return Container(
      width: 180,
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(
                    HomeEvent.movieSelected(movie: movie),
                  );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MovieDetailsPage();
                  },
                ),
              );
            },
            child: Hero(
              tag: posterPath,
              child: Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${Constant.imageUrl}$posterPath",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, top: 4),
            child: Text(
              title,
              maxLines: 2,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xff272727),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, top: 4),
            child: Text(
              releaseDate.split('-').join('/'),
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xff7A7A7A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
