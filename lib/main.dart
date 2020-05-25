import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // theme: new ThemeData(
      //   brightness: Brightness.light,
      //   primarySwatch:Colors.yellow,
      //   primaryColor: Color(0xFFFFBB54),
      //   accentColor: Color(0xFFECEFF1),
      // ),
      title: "supermarket manager",
      home: new Home(),
      // theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String> _nebulae;
  List<String> _filterList;

  @override
  void initState() {
    super.initState();
    _nebulae = new List<String>();
    _nebulae = [
      " بانيه اطياب 1ك = 65",
      " بانيه اطياب ننص كيلو = 42",
      " استربس نص كيلو = 53",
      " استربس اطياب 1 كيلو = 92",
      " ناجتس اطياب = 42",
      " سجق أطياب = 38",
      " كفته اطياب = 34",
      " برجر عائلي اطياب = 63",
      " سوسيس عائلي اطياب = 62",
      " برجر ميتلاند = 27",
      " كفته ميتلاند = 25",
      "سجق ميتلامد = 26",
      " موزيرلا 400 جرام = 25",
      " ملوخية فيدويكو = 10",
      " مفروم حلواني = 40",
      " كوكتيل سوسيس حلواني = 35",
      " برجر توابل شرقية 43",
      " بانيه شرقي حلواني = 50",
      " بانيه كوكي 400 جرام = 40",
      " استربس حلواني 400 جرام = 40",
      " فرنك (هوت دوج) = 20",
      " هوت دوج = 45",
      " موزيرلا 325 جرام = 25",
      " موزيرلا بنبو 200 جرام = 14",
      " بانيه توابل شرقية = 45",
      " برجر 8 قطع حلواني = 40",
      " كفتة حلواني = 35",
      " مفروم حلواني = 40",
      " بسلة سادة 14",
      " بسلة جزر = 12",
      " بامية = 12",
      " بسلة سادة صن شاين = 15",
      " بسلة جزر صن شايل = 13",
      " خضار مشكل صن شاين = 10",
      " بامية وسط صن شاين = 13",
      " ملوخية صن شاين = 10",
      " بطاطس فارم = 25",
      " دبوس كوكي = 55",
      " نورجتس = 43",
      " جلاش = 6",
      " موزيرلا 1ك = 50",
      " هوت دوج اطياب 1ك = 65",
      " زبدة فيؤن = 40",
      " كريمة لباني 28",
      " سمبوسه = 14",
      " استربس حلواني = 90",
      " برجر حلواني = 75",
      " كيلو مخلل = 10 ",
      "نص كيلو مخلل = 5",
      " ربع كيلو مخلل = 2.5",
      " لانشون بالزيتون 1ك = 40",
      " لانشون جريلو = 60",
      " جبن دبل = 60",
      " جبنه كازابلانكا = 40",
      " جبنة سلطة = 40",
      " الزيتون = 40",
      " جبنة شهاب طازة = 40",
      " جبنة طازة الطيب = 48",
      " جبنة رومي وسط = 88",
      " جبنة رومي قديمة = 100",
      " جيلاتيي اسكويز = 2.5",
      " جيلاتيي كيت كات كونو = 10",
      " جيلاتيي اسكويز اب = 6",
      " جيلاتيي ميجا اوريو = 15",
      " جيلاتيي أوبشة اوريو = 15",
      " جيلاتيي ميجا هورو = 8",
      " جيلاتيي كوباية شفاف = 2.5",
      " جيلاتيي كوباية ازرق = 8",
      " كيمو كونو = 5",
      " ميني ميجا = 5",
      " جيلاتيي عائلي = 20",
      " زبادي العطاء = 2.5",
      " لبن بخيره نص كيلو = 8",
      " لبن بخيره 1ك = 14",
      " دانيت = 4",
      " شيكولاته ديري ميلك = 25",
      " زبادي دانون = 3.5",
      " زبادي دانون فواكه = 4",
      " زبادي اكتافيتا = 4",
      " بيست كبير = 14",
      " بيست = 2.5",
      " قهوة ارابيا صغير 5",
      " قهوة ارابيا وسط = 12",
      " قهوة ارابيا كبير = 17",
      " جبنة دبل 1ك = 60",
      " فلفل اسمر = 9",
      " قرنفل = 8",
      " كمون = 8",
      " سمسم = 7.5",
      " توابل = 7",
      " كانز = 5",
      " كانز صغير = 4",
      " كانز بريل = 7",
      " راني = 6",
      " لمار عصير = 4",
      "عصير بست اخضر = 3 ",
      " عصير طعمه = 4",
      " كولا زجاج = 5",
      " عصير أجا برتقال = 7",
      " عصير أجا برتقال = 8",
      " شوبيس لتر = 10",
      " بيبسي لتر = 10",
      " لتر كوكاكولا = 9",
      " لتر 2 كولا = 13",
      " بافريا = 15",
      " لين بخيرة 1ك = 14",
      " لبن بخيرة نص كيلو = 7",
      " زبادي دانون كبير = 5",
      " زبادي دانون صغير = 3.5",
      " جبن الطيب = 46",
      " فيروز كبير = 10",
      " لمار لتر مانجو = 13",
      " لمار لتر = 11",
      " بست لتر مانجو = 15.5",
      " لمار صغير بيور 6.5",
      " شيكولاتة دانيت = 4",
      " بيتي لتر كوكتيل = 11",
      " بيتي لتر مانجو = 12",
      " فسدق = 270",
      " اراسيا = 50",
      " كاجو = 220",
      " عين جمل = 210",
      " لوز = 160",
      " مشمشية = 60",
      " جوز هند خشن = 60",
      " جوز هند ناعم = 50",
      " فول = 40",
      " زبيب = 40",
      " قمر الدين = 13",
      " بلح = 25",
      " نشا = 2.5",
      " نيدو لبن = 4",
      " مرقة شريط = نص",
      " بن اليمني محوج وسط = 18",
      " بن اليمني محوج غامق = 18",
      " بن اليمني سادة فاتح = 14",
      " شاي العروسة صغير = 4",
      " شاي العروسة وسط = 8.5",
      " شاي ليبتون = 5",
      " شاي العروسة كبير = 20",
      " شاي ليبتون كبير = 25",
      " شاي أخضر فتلة صغير = 12",
      " نعناع فتلة صغير = 12",
      " مستردة = 14.5",
      " كاتشب = 10",
      " علبة جبنة بريزدو صغير = 23",
      " علبة جبنة بريزدو وسط = 33",
      " نعناع فتلة صغير = 7.5",
      " كركدية فتلة صغير = 7.5",
      " مايونيز = 22",
      " ينسون فتلة صغير = 7.5",
      " علية جبنة بريزدو كبير = 62",
      " جرين لاند بالفلفل = 13",
      " شيدر جرين لاند = 13",
      " علبة نستو مثلثات = 5",
      " نستو بريزدو دبل = 26.75",
      " نستو طعمه دبل = 13.75",
      " نستو طعمه = 8",
      " نستو ابو الولد = 7.5",
      " نستو بريزدو = 15",
      " شيدر طعمه = 25",
      "علبة جبنه دومتي صغير = 7 ",
      "علبة جبنه دومتي وسط = 13",
      " برطمان مربي = 15",
      " نيوسا شيكولاته برطمان = 35",
      " علبة جبنة جرين لاند وسط = 13",
      " علبة طحينة وسط = 21",
      " علبة حلاوة اسبريد = 23",
      " جبنة مربعات بريدو = 35",
      " جبنة مربعات طعمه =25",
      " علبة اسبريد فلفل = 17",
      " علبة جبنة عبور لاند وسط = 7",
      " علبة جبنة عبور لاند كبير = 14.5",
      " حلاوة البوادي = 18",
      " حلاوة الميزان = 18",
      " حلاوة كبير + عرض علبة = 35",
      " الشوفان = 30",
      " حليب المراعي 1ك = 15",
      " حليب المراعي 1ك ونص = 23",
      " علبة جبن ابيض بريزدو = 39",
      " علبة جبن مش جررين لاند = 62",
      " علبة جبن دمياطي جرين لاند = 30",
      " علبة طحينة صغيرة = 11.5",
      " جركن برسيل اسود = 32",
      " زجاجة معطر = 25",
      " برسيل جل = 75",
      " فيبا = 40",
      " داوني = 35",
      " راجون = 10",
      " كيروكس = 38",
      " بيرسول = 14",
      " كلوركس = 11",
      " كلوريل = 7.5",
      " كلوركس الوان = 20",
      " زيت كريستال = 22",
      " زيت ميني = 15",
      " زيت سلايت = 16",
      " زيت الاصيل = 16",
      " تايد = 69",
      " اريال = 85",
      " اوكسي = 75",
      " عسل اسود = 10",
      " درة حلوه كاملة = 20",
      " فول = 8",
      " سردين = 10",
      " تونه برتقالي = 22",
      " فانيش كيس = 10",
      " برسل 5*1 = 48",
      " مورال تلميع = 15",
      " ايفريكس = 12",
      " جنيرال = 17",
      " خل = 8",
      " ماء ورد = 5",
      " ورق عنب = 21.5",
      " كورونا شيكولاته عرض = 15",
      " جيلي = 4.5",
      " كريم كارميل = 7.5",
      " ورق المونيوم كبير = 13",
      " ورق المونيوم = 7",
      " مناديل مطبخ وسط = 12.5",
      " مناديل مطبخ كبير = 23.5",
        ];
    _nebulae.sort();
  }

  _HomeState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

//Build our Home widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("ادارة منتجات السوبر ماركت"),
        centerTitle: true,
      ),
      body: new Container(
        //  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: new Column(
          children: <Widget>[
            _createSearchView(),
            _firstSearch ? _createListView() : _performSearch(),
          ],
        ),
      ),
    );
  }

  //Create a SearchView
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child: new TextField(
        controller: _searchview,
        decoration: InputDecoration(
          hintText: "اكتب اسم المنتج",
          hintStyle: new TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  //Create a ListView widget
  Widget _createListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _nebulae.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              // color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_nebulae[index]}"),
              ),
            );
          }),
    );
  }

  Widget _performSearch() {
    _filterList = new List<String>();
    for (int i = 0; i < _nebulae.length; i++) {
      var item = _nebulae[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  //Create the Filtered ListView
  Widget _createFilteredListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              // color: Colors.white,
              elevation: 5.0,
              child: new Container(
                margin: EdgeInsets.all(15.0),
                child: new Text("${_filterList[index]}"),
              ),
            );
          }),
    );
  }
}
