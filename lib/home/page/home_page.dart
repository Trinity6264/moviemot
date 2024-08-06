import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviemot/home/bloc/home_bloc.dart';
import 'package:moviemot/home/components/home_section_title.dart';
import 'package:moviemot/home/components/movie_card.dart';
import 'package:moviemot/utils/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Constant.scaffoldBackground,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'Hello',
              style: GoogleFonts.poppins(
                color: Constant.textBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset('assets/wave.png'),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  color: Constant.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Millions of movies, TV shows to explore now.",
              style: GoogleFonts.poppins(
                color: Constant.textBlackColor,
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for movies, TV shows...',
                filled: true,
                fillColor: const Color(0xffF6F6F6),
                hintStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffcccccc),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xffcccccc),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                    color: Color(0xffF6F6F6),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: const BorderSide(
                    color: Color(0xffF6F6F6),
                  ),
                ),
              ),
            ),
          ),

          // whats popular
          const HomeSectionTitle(
            section: "Streaming",
            title: "What's Popular",
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 280,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) {
                return previous.isPopularMoviesLoading !=
                        current.isPopularMoviesLoading ||
                    previous.popularMovie != current.popularMovie;
              },
              builder: (context, state) {
                if (state.isPopularMoviesLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.popularMovie.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovie[index];
                    return MovieCard(movie: movie);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const HomeSectionTitle(
            section: "Movie",
            title: "Free To Watch",
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 280,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) {
                return previous.isFreeMoviesLoading !=
                        current.isFreeMoviesLoading ||
                    previous.freeMovie != current.freeMovie;
              },
              builder: (context, state) {
                if (state.isFreeMoviesLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.freeMovie.length,
                  itemBuilder: (context, index) {
                    final movie = state.freeMovie[index];
                    return MovieCard(movie: movie);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
