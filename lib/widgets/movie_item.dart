import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/movie_model.dart';

class MovieItem extends StatefulWidget {
  final Movie movie;
  final double pageNumber;
  final double index;
  //positional
  MovieItem(this.movie, this.pageNumber, this.index);

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.movie.name!),
            background: Image.asset(widget.movie.image!,width: double.infinity,height: 200,fit: BoxFit.cover,),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Stack(
              children: [
                Card(
                  color: Colors.deepPurple.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left:10, right:10, top:100, bottom: 10),
                    child: Text(widget.movie.description!, style: TextStyle(fontSize: 18,color: Colors.white),),

                  ),
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
