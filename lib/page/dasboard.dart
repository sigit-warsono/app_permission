import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:userpermission/page/filter_network_list_page.dart';
import 'package:userpermission/page/filter_sopir.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class TempMyApp extends StatefulWidget {


  @override
  _TempMyAppState createState() => _TempMyAppState();
}

class _TempMyAppState extends State<TempMyApp> {

  String username = "";
  String data_confirm_izin = "";
  String data_confirm_izin_sopir = "";


  Future getUsername()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username')!;
    });
  }


  Future logOut(BuildContext context)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0
    );
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context)=>MyApp(),), (route) => false,);
  }


  Future<void> initPlatformState() async {


    var url =Uri.parse('http://103.83.179.38:8900/hrd/android/permission/list_vew_izin.php');

    // Store all data with Param Name.

    // Starting Web API Call.
    var response = await http.get(url);

    // Getting Server response into variable.
    var data_izin = jsonDecode(response.body);
    setState(() {
      data_confirm_izin = data_izin.toString();
    });


  }




  Future<void> initPlatformState_2() async {


    var url =Uri.parse('http://103.83.179.38:8900/hrd/android/permission/list_view_sopir.php');

    // Store all data with Param Name.

    // Starting Web API Call.
    var response = await http.get(url);

    // Getting Server response into variable.
    var data_izin_sopir = jsonDecode(response.body);
    setState(() {
      data_confirm_izin_sopir = data_izin_sopir.toString();
    });


  }

  @override
  void initState() {
    super.initState();
    getUsername();
    initPlatformState();
    initPlatformState_2();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',

      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Hai, $username", style: TextStyle(fontSize: 10),),
              GestureDetector(
                  child: Text('Logout',
                    style: TextStyle(fontSize: 15),),
                onTap: () {
                  logOut(context);
                },
                // child: RaisedButton(
                //   color: Colors.redAccent,
                //   onPressed: () {
                //     logOut(context);
                //   },
                //   child: Text("Logout",style: TextStyle(fontSize: 10),),
                // ),

              )

            ],
          ),

          // title: Text(
          //   'Test App',
          // ),
          elevation: 0,
          backgroundColor: Colors.red,
        ),
        body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
              color: Colors.white,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(47.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        // "Welcome, $email \nLeave Permission",
                        "PERMISSION APP",
                        style: TextStyle(

                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Image.asset("assets/iws.jpeg",width: 30.0, height: 30,)
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(left: 35.0),

                  child: Text(
                    // "Welcome, $email \nLeave Permission",
                    "Dasboard",
                    // style: TextStyle(
                    //
                    //     color: Colors.black,
                    //     fontSize: 22.0,
                    //     fontWeight: FontWeight.bold
                    // ),
                    textAlign: TextAlign.start,
                  ),

                ),



                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing:20,
                      runSpacing: 20.0,
                      children: <Widget>[
                        SizedBox(
                          width:140.0,
                          height: 150.0,
                          child: new GestureDetector(
                            onTap: ()=>Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context)=> new FilterNetworkListPage()
                                )
                            ),
                            child: Card(
                              color: Colors.cyan.shade600,
                              elevation: 2.0,




                              child:Center(

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset("assets/permission.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          " Izin Keluar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "$data_confirm_izin Person",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:140.0,
                          height: 150.0,

                          child: new GestureDetector(
                            onTap: ()=>Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (BuildContext context)=> new Filtersopir()
                                )
                            ),
                            child: Card(

                              color: Colors.cyan.shade600,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child:Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image.asset("assets/car.png",width: 64.0,),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Sopir",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "$data_confirm_izin_sopir Person",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                )
              ],
            )

        ),
      ),
    );
  }

}
