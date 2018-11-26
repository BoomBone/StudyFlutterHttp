import 'package:flutter/material.dart';
import 'http.dart';
import 'user.dart';

class JsonSeralizablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _JsonSeralizablePageState();
  }
}

class _JsonSeralizablePageState extends State<JsonSeralizablePage> {
  String name = "";
  String email = "";
  List<String> picList = <String>[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              email,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 250.0 * picList.length,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: picList != null && picList.length > 0
                      ? picList.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    return picList != null && picList.length > 0
                        ? Image(
                            image: NetworkImage(picList[index]),
                            width: 400.0,
                            height: 250.0,
                            fit: BoxFit.cover,
                          )
                        : Text("no pic");
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContent();
  }

  void getContent() {
    NetUtil.get("http://www.mocky.io/v2/5bfa43493200007300f2261d", (data) {
      print("<data> : " + data.toString());
      User user = User.fromJson(data);
      print("<user> : " + user.toString());
      setState(() {
        name = user.name;
        email = user.email;
        picList = user.pics;
      });
    }, errorCallBack: (errorMsg) {
      print("error:" + errorMsg);
    });
  }
}
