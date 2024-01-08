import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movies.dart';
import 'constants.dart';
import 'colors.dart';
class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: CustomScrollView(
         slivers: [
           SliverAppBar(
             leading:Container(height:70 ,
                 width: 70,
                 decoration:  BoxDecoration(
                   color: Colours.scaffoldBgColor,
                   borderRadius: BorderRadius.circular(8),
                   
                 ),
                 
                 
                 margin: const EdgeInsets.only(
                   top: 8,
                     left:8 ,
             ),
                 child: IconButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   icon: const Icon(Icons.arrow_back_ios_new_rounded),
                 )
                 
             ),
             backgroundColor: Colours.scaffoldBgColor,
             expandedHeight: 500,
             pinned:  true,
             floating: true,
             flexibleSpace: FlexibleSpaceBar(
               title: Text(movie.title,style: GoogleFonts.belleza(fontSize: 17,fontWeight: FontWeight.w600),),
               background: ClipRRect(
                 borderRadius: const BorderRadius.only(
                   bottomLeft: Radius.circular(24),
                   bottomRight: Radius.circular(24),
                 ),
                 child: Image.network('${constants.imagePath}${movie.backDropPath}'
                 ,filterQuality: FilterQuality.high,
                   fit: BoxFit.cover,
                 ),
               ),
             ),
           ),
           SliverToBoxAdapter(
             child: Padding(
               padding: const EdgeInsets.all(12),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Text('Overview',style: GoogleFonts.openSans(
                         fontSize: 30,
                         fontWeight: FontWeight.w800,
                       ),
                       ),

                     ],


                   ),
                   const SizedBox(height: 16,),
                   Text(movie.overview,style: GoogleFonts.roboto(fontSize: 25,fontWeight: FontWeight.w400),),
                   const SizedBox(height: 16,),
                   SizedBox(
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                           padding: const EdgeInsets.all(8),
                           decoration: BoxDecoration(
                             border: Border.all(color:Colors.grey),
                             borderRadius: BorderRadius.circular(10),
                           ),
                           child: Column(
                             children: [
                               Text('Release date: ' ,style: GoogleFonts.openSans(
                                       fontSize: 17,
                                  fontWeight: FontWeight.w800,
                                ),
                               ),
                               Text(movie.releaseDate,style: GoogleFonts.openSans(
                                 fontSize: 17,
                                 fontWeight: FontWeight.w800,
                               ),
                               ),

                             ],
                           ),
                         ),
                            Container(
                                 padding: const EdgeInsets.all(8),
                                 decoration: BoxDecoration(
                                 border: Border.all(color:Colors.grey),
                                 borderRadius: BorderRadius.circular(10),
                         ),
                              child: Row(
                                children: [
                                  Text('Rating',style: GoogleFonts.openSans(
                                  fontSize: 17,
                                    fontWeight: FontWeight.w800,),
                                 ),
                                 const Icon(Icons.star,color: Colors.amber,),
                                  Text('${movie.voteAverage.toString()}/10' ,style: GoogleFonts.openSans(
                                       fontSize: 17,
                                   fontWeight: FontWeight.w800,),)
                                ],
                              ),
                        ),
                       ],
                     ),
                   )
                 ],
               ),
             ),
           )
         ],
       ),
    );
  }
}
