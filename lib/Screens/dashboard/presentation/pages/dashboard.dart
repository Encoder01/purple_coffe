import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 5,),
          Text("Mor Fincan"),
          Text("fotoğrafta belirtildiği gibi fotoları çekin"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Ionicons.cube)),
              IconButton(onPressed: () {}, icon: Icon(Ionicons.cube)),
              IconButton(onPressed: () {}, icon: Icon(Ionicons.cube)),
              IconButton(onPressed: () {}, icon: Icon(Ionicons.cube))
            ],
          ),
          Text("Artık tabak resmi çekebilirsiniz"),
          IconButton(onPressed: () {}, icon: Icon(Ionicons.cube)),
          TextButton(onPressed: (){}, child: Text("Gönder"))
        ],
      ),
    );
  }
}
