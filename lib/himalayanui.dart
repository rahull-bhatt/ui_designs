import 'package:flutter/material.dart';

class Himalayan extends StatefulWidget {
  const Himalayan({super.key});

  @override
  State<Himalayan> createState() => _HimalayanState();
}

class _HimalayanState extends State<Himalayan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 350,width: double.infinity,
            decoration: BoxDecoration (
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32)
              ),
              image: DecorationImage(
                  image: AssetImage('images/himalaya.jpg'),
                  fit: BoxFit.cover
              ),
            ),
            alignment: Alignment.topLeft,
          child: Padding(
            padding:EdgeInsets.all(18.0),
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white,size: 28,),
          ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("White Snow Valley",style: TextStyle(fontSize:29, fontWeight:FontWeight.bold),),
                Icon(Icons.favorite_border,color: Colors.redAccent,size: 26,)
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on,color: Colors.orange,size: 19,),
                Text("Nainital, Uttarakhand",style: TextStyle(fontSize:20, fontWeight:FontWeight.w300,color: Colors.black.withOpacity(0.6)),),
              ],
            ),
          ),
          SizedBox(height:25,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Column(
               children: [
                 Card(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                     elevation: 6,
                     child: Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: Icon(Icons.star_border,color: Colors.orange,size: 25,),
                     )),
                 Text("Rating",style: TextStyle(fontSize:18, fontWeight:FontWeight.w300,color: Colors.black.withOpacity(0.6)),),
                 Text("4.2(3.2k)",style: TextStyle(fontSize:19, fontWeight:FontWeight.w500,color: Colors.black.withOpacity(0.8)),),
               ],
             ),
             Column(
               children: [
                 Card(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                     elevation: 6,
                     child: Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: Icon(Icons.alt_route,color: Colors.green,size: 25,),
                     )),
                 Text("Distance",style: TextStyle(fontSize:18, fontWeight:FontWeight.w300,color: Colors.black.withOpacity(0.6)),),
                 Text("3000Km",style: TextStyle(fontSize:19, fontWeight:FontWeight.w500,color: Colors.black.withOpacity(0.8)),),
               ],
             ),
             Column(
               children: [
                 Card(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                     elevation: 6,
                     child: Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: Icon(Icons.food_bank,color: Colors.orange,size: 25,),
                     )),
                 Text("Restaurants",style: TextStyle(fontSize:18, fontWeight:FontWeight.w300,color: Colors.black.withOpacity(0.6)),),
                 Text("108 avail.",style: TextStyle(fontSize:19, fontWeight:FontWeight.w500,color: Colors.black.withOpacity(0.8)),),
               ],
             ),
           ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text("The Snowy Mountains experiences large natural snowfalls every winter, normally during June, July, August and early September, with the snow cover melting by late spring. It is considered to be one of the centers of the Australian ski industry during the winter months.",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.black.withOpacity(0.6)),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(child: Text("Book my trip",style: TextStyle(fontSize:22,fontWeight: FontWeight.w600,color: Colors.white ),)),
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}

