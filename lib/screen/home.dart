import 'file:///D:/blog/lib/screen/login.dart';
import 'package:blog/model/category_subcategory.dart';
import 'package:blog/provider/data_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  hitApi() async {
    Gagro gagro =
        await Provider.of<DataProvider>(context, listen: false).fetchApi();
    Provider.of<DataProvider>(context, listen: false).setData(gagro);
  }

  @override
  Widget build(BuildContext context) {
    hitApi();
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: Icon(
              Icons.sort,
              color: Colors.black,
              size: 27.0,
            ),
            title: Text(
              'Blog',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans',
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.grey[800],
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        bottom: 32.0,
                        child: Container(
                          height: 8.0,
                          width: 8.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.close,
                    size: 35,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ]),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.lightGreen,
          backgroundColor: Colors.white24,
          buttonBackgroundColor: Colors.lightGreen,
          height: 50,
          index: 0,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_cart,
              size: 23,
              color: Colors.white,
            ),
            Icon(
              Icons.favorite,
              size: 20,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        body: Container(
          child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: Provider.of<DataProvider>(context)
                    .getData()
                    .data
                    .dataList
                    .length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(Provider.of<DataProvider>(context)
                        .getData()
                        .data
                        .dataList[index]
                        .name),
                  );
                },
              )),
        ));
  }
}
