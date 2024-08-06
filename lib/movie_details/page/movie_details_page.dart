import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviemot/home/bloc/home_bloc.dart';
import 'package:moviemot/movie/models/movie/movie.dart';
import 'package:moviemot/movie/models/movie_video/movie_video.dart';
import 'package:moviemot/trailer/page/trailer_page.dart';
import 'package:moviemot/utils/constant.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<HomeBloc, HomeState, Option<Movie>>(
        selector: (state) {
          return state.selectedMovie;
        },
        builder: (context, state) {
          return switch (state) {
            None() => const Center(
                child: Text("No Data Found"),
              ),
            Some(:final value) => Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 350,
                          width: double.infinity,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Hero(
                                tag: value.posterPath,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${Constant.imageUrl}${value.posterPath}"),
                                    ),
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: const Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Constant.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              value.title,
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 27,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${value.id}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          value.releaseDate
                                              .split('-')
                                              .join('/'),
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Constant.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 8,
                                        ),
                                        child: Text(
                                          "Action",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            value.overview,
                            style: GoogleFonts.poppins(
                              color: const Color(0xff7A7A7A),
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "Cast",
                            style: GoogleFonts.poppins(
                              color: const Color(0xff4D4C4C),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: BlocBuilder<HomeBloc, HomeState>(
                            buildWhen: (previous, current) {
                              return previous.isCastLoading !=
                                      current.isCastLoading ||
                                  previous.casts != current.casts;
                            },
                            builder: (context, state) {
                              if (state.isCastLoading) {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final cast = state.casts[index];
                                  return SizedBox(
                                    width: 150,
                                    child: Card(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: cast.profilePath == ""
                                                    ? const Icon(
                                                        Icons.person,
                                                        size: 50,
                                                      )
                                                    : Image.network(
                                                        "${Constant.imageUrl}${cast.profilePath}",
                                                        fit: BoxFit.cover,
                                                        width: 100,
                                                      ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              cast.name,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: state.casts.length,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: BlocSelector<HomeBloc, HomeState, List<MovieVideo>>(
                      selector: (state) {
                        return state.videos;
                      },
                      builder: (context, videos) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (videos.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TrailerPage(),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Constant.primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "Play Trailer",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: Align(
                                child: Text(
                                  "Download",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}
