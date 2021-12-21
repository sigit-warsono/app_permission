import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:userpermission/api/sopirs_api.dart';
import 'package:userpermission/model/sopir.dart';
import 'package:userpermission/widget/search_widget_sopir.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:userpermission/page/dasboard.dart';

import 'approve_sopir.dart';

class Filtersopir extends StatefulWidget {


  @override
  _FiltersopirState createState() => _FiltersopirState();
}

class _FiltersopirState extends State<Filtersopir> {

  List<Sopir> sopirs = [];
  String query = '';
  Timer? debouncer;


  @override
  void initState() {
    super.initState();
    initPlatformState();
    init();
  }
  static final String oneSignalAppId= "b0e1d78d-bced-4e02-a3d0-65507ee6ece8";


  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final sopirs = await SopirsApi.getSopirs(query);

    setState(() => this.sopirs = sopirs);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List Sopir"),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TempMyApp()),
              );
              // do something
            },
          )
        ],
        // centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(

              itemCount: sopirs.length,
              itemBuilder: (context, i) {
                final sopir = sopirs[i];

                return buildSopir(sopir);
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget buildSearch() =>
      SearchWidget(
        text: query,
        hintText: 'Nik or Author Name',
        onChanged: searchSopir,
      );

  Future searchSopir(String query) async =>
      debounce(() async {
        final sopirs = await SopirsApi.getSopirs(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.sopirs = sopirs;
        });
      });

  Widget buildSopir(Sopir sopir) {
    // late String aproved =book.aprove;

    return Container(

      child: new GestureDetector(
        onTap: () =>
            Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new Approve_sopir(supir: sopir)
                  // new Detail(list:list , index: i,)
                )
            ),

        child: new Card(
          margin: const EdgeInsets.all(8.0),

          child: ListTile(

              leading: Image.network(
                sopir.image,
                fit: BoxFit.cover,
                width: 55,
                height: 55,
              ),


              title: Text(sopir.name),
              subtitle:  Text('Izin: ${sopir.tujuan}'),


              trailing:
              (sopir.approve=='0')?
              RaisedButton(
                onPressed: () {},
                //**this line is underlined in red. Error is here**
                color: Colors.yellow,
                child: Text('Waiting'),
              ):(sopir.approve=='1')?
              RaisedButton(
                onPressed: () {},
                //**this line is underlined in red. Error is here**
                color: Colors.green,
                child: Text('Approve'),
              ):RaisedButton(
                onPressed: () {},
                //**this line is underlined in red. Error is here**
                color: Colors.red,
                child: Text('Reject'),
              )






          ),

        ),

      ),
    );


  }

  Future<void> initPlatformState() async {


    /// Get the Onesignal userId and update that into the firebase.
    /// So, that it can be used to send Notifications to users later.̥
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    // We will update this once he logged in and goes to dashboard.
    ////updateUserProfile(osUserID);
    // Store it into shared prefs, So that later we can use it.

    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    await OneSignal.shared.promptUserForPushNotificationPermission(
      fallbackToSettings: true,
    );

    /// Calls when foreground notification arrives.


    OneSignal.shared.setAppId(oneSignalAppId);



  }
}
