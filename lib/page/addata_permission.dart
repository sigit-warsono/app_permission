import 'package:flutter/material.dart';
import 'package:userpermission/model/book.dart';
import 'package:http/http.dart' as http;
import 'package:userpermission/page/filter_network_list_page.dart';

class Add_permission extends StatefulWidget {

  final Book employee;

  Add_permission({required this.employee});



  @override
  _Add_permissionState createState() => _Add_permissionState();



}

class _Add_permissionState extends State<Add_permission> {


  late TextEditingController controllerId;
  late TextEditingController controllerNip;
  late TextEditingController controllerName;
  late TextEditingController controllerNote;
  late TextEditingController controllerjenis_permission;
  late TextEditingController controllerJam_keluar;


  void approved() {
    var url=Uri.parse("http://103.83.179.38:8900/hrd/android/permission/approved.php");
    http.post(url,body: {
      "id": widget.employee.id.toString()
    });

  }


  void reject() {
    var url=Uri.parse("http://103.83.179.38:8900/hrd/android/permission/reject.php");
    http.post(url,body: {
      "id": widget.employee.id.toString()
    });
  }

  @override
  void initState() {
    controllerId= new TextEditingController(text: widget.employee.id.toString() );
    controllerNip= new TextEditingController(text: widget.employee.nip );
    controllerName= new TextEditingController(text: widget.employee.name );
    controllerNote= new TextEditingController(text: widget.employee.note );
    controllerjenis_permission= new TextEditingController(text: widget.employee.jenis_permission );
    controllerJam_keluar= new TextEditingController(text: widget.employee.jam_keluar );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Approve"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  enabled: false,
                  controller: controllerNip,
                  decoration: new InputDecoration(
                      hintText: "Nik", labelText: "Nik"),
                ),

                new TextField(
                  enabled: false,
                  controller: controllerId,
                  decoration: new InputDecoration(
                      hintText: "Nik", labelText: "Nik"),
                ),

                new TextField(
                  enabled: false,
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Nama", labelText: "Nama"),
                ),
                new TextField(
                  enabled: false,

                  controller: controllerjenis_permission,
                  decoration: new InputDecoration(
                      hintText: "Jenis Izin", labelText: "Jenis Izin"),
                ),
                new TextField(
                  enabled: false,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 5,
                  controller: controllerNote,
                  decoration: new InputDecoration(
                      hintText: "Keterangan", labelText: "Keterangan"),
                ),

                new TextField(
                  enabled: false,
                  controller: controllerJam_keluar,
                  decoration: new InputDecoration(
                      hintText: "Jam Keluar", labelText: "Jam Keluar"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Approved"),
                  color: Colors.green,
                  onPressed: () {
                    approved();

                    Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context)=>FilterNetworkListPage(),), (route) => false,);

                    // Navigator.of(context).push(
                    //     new MaterialPageRoute(
                    //         builder: (BuildContext context)=>new FilterNetworkListPage()
                    //     )
                    // );
                  },
                ),

                new RaisedButton(
                  child: new Text("Reject"),
                  color: Colors.red,
                  onPressed: () {
                    reject();
                    Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context)=>FilterNetworkListPage(),), (route) => false,);

                    // Navigator.of(context).push(
                    //     new MaterialPageRoute(
                    //         builder: (BuildContext context)=>new FilterNetworkListPage()
                    //     )
                    // );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
