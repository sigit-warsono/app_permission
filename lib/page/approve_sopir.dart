import 'package:flutter/material.dart';
import 'package:userpermission/model/sopir.dart';
import 'package:http/http.dart' as http;
import 'package:userpermission/page/filter_sopir.dart';



class Approve_sopir extends StatefulWidget {

  final Sopir supir;

  Approve_sopir({required this.supir});


  @override
  _Approve_sopirState createState() => _Approve_sopirState();
}

class _Approve_sopirState extends State<Approve_sopir> {

  late TextEditingController controllerId;
  late TextEditingController controllerNip;
  late TextEditingController controllerName;
  late TextEditingController controllerTujuan;
  late TextEditingController controllerjenis_mobil;
  late TextEditingController controllerJam_keluar;


  void approved() {
    var url=Uri.parse("http://103.83.179.38:8900/hrd/android/permission/approved_supir.php");
    http.post(url,body: {
      "id": widget.supir.id.toString()
    });

  }


  void reject() {
    var url=Uri.parse("http://103.83.179.38:8900/hrd/android/permission/reject_sopir.php");
    http.post(url,body: {
      "id": widget.supir.id.toString()
    });
  }

  @override
  void initState() {
    controllerId= new TextEditingController(text: widget.supir.id.toString() );
    controllerNip= new TextEditingController(text: widget.supir.nip );
    controllerName= new TextEditingController(text: widget.supir.name );
    controllerTujuan= new TextEditingController(text: widget.supir.tujuan );
    controllerjenis_mobil= new TextEditingController(text: widget.supir.jenis_mobil );
    controllerJam_keluar= new TextEditingController(text: widget.supir.jam_keluar );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Approve Sopir"),
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

                  controller: controllerjenis_mobil,
                  decoration: new InputDecoration(
                      hintText: "Jenis Mobil", labelText: "Jenis Mobil"),
                ),
                new TextField(
                  enabled: false,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 5,
                  controller: controllerTujuan,
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
                      MaterialPageRoute(builder: (context)=>Filtersopir(),), (route) => false,);

                    // Navigator.of(context).push(
                    //     new MaterialPageRoute(
                    //         builder: (BuildContext context)=>new Filtersopir()
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
                      MaterialPageRoute(builder: (context)=>Filtersopir(),), (route) => false,);

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
