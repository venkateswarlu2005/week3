
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/MovieSlider.dart';
import 'package:movie_app/widgets/TrendingSlider.dart';

import 'Api.dart';
import 'movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;
  @override
  void initState(){
    super.initState();
    trendingMovies = Api().getTrendingMovies() as Future<List<Movie>>;
    topRatedMovies = Api().gettopRated() as Future<List<Movie>>;
    upComingMovies= Api().getupComing() as Future<List<Movie>>;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        title: Image.asset('Assets/Logo.jpg',
        fit: BoxFit.cover,
        height: 150
          ,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20,),
          Text('Trending Movies',style: GoogleFonts.aBeeZee(fontSize: 25),),
          const SizedBox(height: 32,),

          SizedBox(
            child: FutureBuilder(
              future: trendingMovies,
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){

                  return TrendingSlider(snapshot: snapshot,);
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        const SizedBox(height:32),
          Text('Top Rated Movies',style: GoogleFonts.aBeeZee(fontSize:25 ),),
          SizedBox(
            child: FutureBuilder(
              future: topRatedMovies,
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){

                  return MovieSlider(snapshot: snapshot,);
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          const SizedBox(height:32),
          Text('Upcoming movies',style: GoogleFonts.aBeeZee(fontSize:25 ),),

           SizedBox(
            child: FutureBuilder(
              future: Api().getupComing(),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){

                  return MovieSlider(snapshot: snapshot,);
                }else{
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    )
    );

  }
}

