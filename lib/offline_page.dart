import 'package:flutter/material.dart';

class OfflinePageUser extends StatelessWidget {
  const OfflinePageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('images/offline.png', fit: BoxFit.contain)),
            SizedBox(height: 10,),
            Text("No internet connection",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
            SizedBox(height: 5,),
            Text("Please check your Internet",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
            SizedBox(height: 25,),
            InkWell(onTap: (){}, child: Container(
              height: 40,
                width: 250,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.red),
                child: Center(child: Text("Try Again", style: TextStyle(fontSize:17, fontWeight: FontWeight.bold, color: Colors.white),))))
          ],
        ),
      ),
    );
  }
}
