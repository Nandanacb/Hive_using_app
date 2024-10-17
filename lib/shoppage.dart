import 'package:flutter/material.dart';
import 'package:hive_app_new/database.dart';

class FirstPage extends StatefulWidget{
  @override
  State<FirstPage> createState()=> _FirstPageState();
}
class _FirstPageState extends State<FirstPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("SWEATSHIRT"),
      actions: [
        Icon(Icons.shopping_bag),
      ],),
      
      body: Column(
        children: [
          

          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(border:Border.all(color: const Color.fromARGB(255, 226, 223, 223))),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                     Icon(Icons.search,color: const Color.fromARGB(255, 134, 127, 127),),
                     Text("Search",style: TextStyle(fontSize: 12,color:const Color.fromARGB(255, 134, 127, 127) ),),
                     Spacer(),
                     Text("Filter",style: TextStyle(fontSize: 12,color: const Color.fromARGB(255, 134, 127, 127)),),
                     SizedBox(width: 10),
                     Text("sort",style: TextStyle(fontSize: 12,color: const Color.fromARGB(255, 134, 127, 127)),),
                ],
              ),
            ),),

          Expanded(child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,crossAxisSpacing: 5,mainAxisSpacing: 5), 
            itemCount: 8,
            itemBuilder: (context,index){
              return SizedBox(
                height: 20,
                child: Container(
                  
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                       decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Database.myList[index]["image"]))),
                        
                      ),
                      
                      Text(Database.myList[index]["text1"],style: TextStyle(fontSize: 13,color: const Color.fromARGB(255, 145, 142, 142)),),
                    
                      Text(Database.myList[index]["text2"],style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        
                        children: [
                          Icon(Icons.currency_rupee,size: 13,),
                          Text(Database.myList[index]["price"]),
                        ],
                      ),
                      
                      
                    ],
                  ),
                ),
              );
            })
          )

          ])
        
      );
    
  }
}