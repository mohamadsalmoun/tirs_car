import 'package:async_loader/async_loader.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tirs_car/API/get_home_api.dart';
import 'package:tirs_car/model/Response/home_data_response.dart';
import 'package:tirs_car/utils/common.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final GlobalKey<AsyncLoaderState> asyncKeyGetHomeData =
    new GlobalKey<AsyncLoaderState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _asyncLoaderGetHomeData = new AsyncLoader(
      key: asyncKeyGetHomeData,
      initState: () async => await getHomeDataAPI(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => getNoConnectionWidget(),
      renderSuccess: ({data}) => setWidegtHomeData(data),
    );
    return Scaffold(
      appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff59A0CE),
                    blurRadius: 3,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
          ),
          preferredSize: Size.fromHeight(65.0)),
      body: _asyncLoaderGetHomeData,
    );
  }

  setWidegtHomeData(HomeDataResponse data) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: data.data.sliders.length > 0 ?
              CarouselSlider(
                options: CarouselOptions(
                  height: 230.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
              items: data.data.sliders.map((image) {
                return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Card(
                          elevation: 2.0,
                          child: Image.network(
                            image.image,
                            fit: BoxFit.fill,
                          ),
                          ),
                      );
                    },
                  );
                }).toList(),
              ) : AppConfig.noDataWidget()
            ),
            new SizedBox(height: 10.0),
            new Container(
              height: 50.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(right: 15.0)),
                  new Text("الاقسام",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: accentColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            data.data.cats.length > 0 ?
            new GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: PageScrollPhysics(),
              childAspectRatio: 1.0,
              children: List.generate(data.data.cats.length, (index) {
                  return _CatCell(data.data.cats.elementAt(index));
                },
              ),
            ) : AppConfig.noDataWidget(),
            new SizedBox(height: 20.0),
            new Container(
              height: 50.0,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(right: 15.0)),
                  new Text("الاكثر مبيعا",
                      style: new TextStyle(
                          fontSize: 20.0,
                          color: accentColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            data.data.proMoreArr.length > 0 ?
            new Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: new ListView.builder(
                shrinkWrap: true,
                itemCount: data.data.proMoreArr.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _productCell(data.data.proMoreArr.elementAt(index));
                },
              ),
            ): AppConfig.noDataWidget(),
            new SizedBox(height: 20.0),
          ],
        ),
      ],
    );
  }

  Widget  _CatCell(Cat model) {
    return GestureDetector(
      onTap: () {
        print("catPress");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Container(
            height: 75,
            child: Image(
              image: NetworkImage(model.image,),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Text(
                  model.title,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                )),
          ]),
        ]),
      ),
    );
  }
  Widget  _productCell(LatestProduct model) {
    return GestureDetector(
      onTap: () {
        print("one product press");
      },
      child: Container(
        margin: EdgeInsets.only(left: 10,),
        width: 300,
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xffD9D9D9)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8,bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 165,
                      height: 43,
                      child: Text(model.title,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w900),maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    Row(
                      children: [
                        Text( "جنية",style: TextStyle(fontSize: 15,color: accentColor,fontWeight: FontWeight.w800),),
                        Text(model.price.toString() ,style: TextStyle(fontSize: 15,color: accentColor,fontWeight: FontWeight.w800),),

                      ],
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                        print("add to cart press");
                        },
                        color: accentColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                            Text(
                              "اضافة للسلة",
                              style: TextStyle(color:  Colors.white,fontSize: 16),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color:  accentColor)),
                      ),
                      width: 170,
                      height: 40,
                    ),
                  ],
                    ),
                ),
              Container(
                width: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(model.image),
                        fit: BoxFit.fill)
                ),
              ),
                      ]
              )
          ),
      )
    );
  }
  Widget getNoConnectionWidget() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 130.0,
            child: new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/no-signal.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Text(
              "هناك مشكلة في الاتصال",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
           ElevatedButton(
               style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all<Color>(accentColor),
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(7.0),
                   ),
                 ),
               ),
              child: new Text(
                "حاول مرة آخري",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () => asyncKeyGetHomeData.currentState.reloadState())
        ],
      ),
    );
  }

}
