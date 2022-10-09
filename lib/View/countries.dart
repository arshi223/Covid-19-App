// ignore_for_file: library_private_types_in_public_api, dead_code, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/Services/Utilities/state_servies.dart';
import 'package:myapp/View/detail.dart';
import 'package:shimmer/shimmer.dart';

class Countries extends StatefulWidget {
  const Countries({ Key? key }) : super(key: key);

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  TextEditingController Searchconroller = TextEditingController();
  StatesServies statesServies = StatesServies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:  TextFormField(
            onChanged: (value) {
              setState(() {
                
              });
            },
            controller: Searchconroller,
            decoration: InputDecoration(
              hintText: 'Search country by name',
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0)
              )
            ),
          )
        ),
        Expanded(child: FutureBuilder(
          future: statesServies.countrieslistModel(),
          builder: (context,AsyncSnapshot<List<dynamic>>snapshot) {
         if (!snapshot.hasData) {
           return ListView.builder(itemCount: 8,itemBuilder:(context, index) {
             return Shimmer.fromColors(baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade300
             ,child: Column(
               children: <Widget>[
                ListTile(
                  title: Container(height: 10,width: 89,color: Colors.white,),
                  subtitle: Container(height: 10,width: 89,color: Colors.white,),
                  leading: Container(height: 50,width: 50,color: Colors.white,),

                )
               ],
             ));
           });
         }else{
           return ListView.builder(itemCount: snapshot.data!.length,
            itemBuilder: (context,index){
              String name =snapshot.data![index]['country'];
              if (Searchconroller.text.isEmpty) {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail( 
                // name: snapshot.data![index]['country'], 
                // image: snapshot.data![index]['countryInfo']['flag'],
                // totalCases:  snapshot.data![index]['cases'] ,
                //  totalRecovered: snapshot.data![index]['recovered'] ,
                //  totalDeaths: snapshot.data![index]['deaths'],
                //  active: snapshot.data![index]['active'],
                //  test: snapshot.data![index]['tests'],
                //  todayRecovered: snapshot.data![index]['todayRecovered'],
                //  critical: snapshot.data![index]['critical'])));
                return Column(
              children: [
                ListTile(
                  title: Text(snapshot.data![index]['country']),
                  subtitle: Text(snapshot.data![index]['cases'].toString()),
                  leading: Image(
                    width: MediaQuery.of(context).size.width*.15,
                        height: MediaQuery.of(context).size.height*0.1,                  
                    image: 
                   NetworkImage(snapshot.data![index]['countryInfo']['flag']))
                 
                )
              ],
            );
              }else if(name.toLowerCase().contains(Searchconroller.text.toLowerCase())){
                return Column(
              children: [
                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail( 
                name: snapshot.data![index]['country'], 
                image: snapshot.data![index]['countryInfo']['flag'],
                totalCases:  snapshot.data![index]['cases'] ,
                 totalRecovered: snapshot.data![index]['recovered'] ,
                 totalDeaths: snapshot.data![index]['deaths'],
                 active: snapshot.data![index]['active'],
                 test: snapshot.data![index]['tests'],
                 todayRecovered: snapshot.data![index]['todayRecovered'],
                 critical: snapshot.data![index]['critical'])));
                  },
                  child: ListTile(
                    title: Text(snapshot.data![index]['country']),
                    subtitle: Text(snapshot.data![index]['cases'].toString()),
                    leading: Image(
                      width: MediaQuery.of(context).size.width*.15,
                          height: MediaQuery.of(context).size.height*0.1,                  
                      image: 
                     NetworkImage(snapshot.data![index]['countryInfo']['flag']))
                   
                  ),
                )
              ],
            );
              }else{
                return Container();
              }
            // return Column(
            //   children: [
            //     ListTile(
            //       title: Text(snapshot.data![index]['country']),
            //       subtitle: Text(snapshot.data![index]['cases'].toString()),
            //       leading: Image(
            //         width: MediaQuery.of(context).size.width*.15,
            //             height: MediaQuery.of(context).size.height*0.1,                  
            //         image: 
            //        NetworkImage(snapshot.data![index]['countryInfo']['flag']))
                 
            //     )
            //   ],
            // );
          });
         }
         
        }))
      ],),
    );
  }
}