import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:signup_flutter_app/modelClass/productListmodel.dart';
import 'package:signup_flutter_app/widget_customize/MainDrawer.dart';

import 'ProductDetails.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    int _selectNavPosition = 1;

  final List<String> imagelist = [
    'https://cdn.pixabay.com/photo/2021/08/23/18/37/tea-6568547_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/09/26/09/09/hipster-958806_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/12/23/18/03/watch-3891591_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/07/31/14/52/ecommerce-3575280_1280.jpg',
    'https://cdn.pixabay.com/photo/2020/10/31/06/41/cosmetics-5700385_1280.png',
    'https://cdn.pixabay.com/photo/2021/04/20/11/13/product-photography-6193556_1280.jpg',
    'https://cdn.pixabay.com/photo/2021/12/09/20/58/christmas-cookies-6859116_1280.jpg',
    'https://cdn.pixabay.com/photo/2021/01/03/13/57/gingerbread-5884607_1280.jpg',
    'https://cdn.pixabay.com/photo/2010/12/13/10/05/berries-2277_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/10/24/07/13/mask-2883635_1280.jpg'
  ];

  /*All product list */
  final List<productListModel> productlist = [
    productListModel(1, "Product 1", "গ্রিন টি হল স্বাস্থ্যকর পানীয় গুলির মধ্যে একটি যা আপনি আপনার শরীরে সুস্থ রাখতে পারে। এটি আপনার বয়স বাড়ানোর বিরুদ্ধে লড়াই করতে এবং দেহের শক্তি তৈরি করতে সহায়তা করতে পারে । আপনার শরীর এবং মনকে প্রভাবিত করে এর ভিতরে থাকা অ্যান্টিঅক্সিডেন্ট এবং পুষ্টি উপাদান । নিজেকে সুন্দর ও সতেজ রাখতে গ্রিন টি এর ব্যাপক চাহিদা। প্রতিদিন সকালে ঘুম থেকে ওঠার পরে যদি আপনি গ্রিন টি খান থাহলে আপনার মন সুন্দর ও সতেজ লাগবে। মনের উন্নতি করতে প্রতিদিন চা অবশ্যই খাবেন।গ্রিন টি এটি প্রথমে চিনে তৈরি হলেও, তবে এখন এটি এশিয়া জুড়ে সমগ্র বিশ্বে এখন ব্যবহৃত হয়। গ্রিন টি অন্যান্য পানীয়ের চেয়ে সবচেয়ে উপকারী পানীয়। গ্রিন টি হাজার বছর ধরে ওষুধ হিসাবে ব্যবহৃত হয়ে আসছে। ভারতে ওষুধ হিসাবে এর চাহিদা ব্যপক। শরীরের বিভিন্ন সমস্যা যেমন রক্তচাপ, ক্যান্সার এবং ডায়াবেটিস প্রতিরোধ করতে গ্রিন টি এর উপকারিতা অসীম । এটি ত্বকের যে কোনও সমস্যা, হার্টের সমস্যা, এবং চুলের সমস্যা জন্য দুর্দান্ত প্রতিরোধক মূলক কাজ করে। আপনি যদি সকালে একবার এটি পান করেন তবে এটি আপনার পুরো শরীরের যত্ন নেবে। গ্রিন টি লাল চায়ের চেয়ে বেশি স্বাস্থ্যকর উপকারিতা রয়েছে কারণ লাল চা প্রক্রিয়াজাতের জন্য জারণ বিক্রিয়া করা হয় যার ফলে অ্যান্টিঅক্সিডেন্ট এবং পলিফেনল অল্প পরিমানে থাকে কিন্তু গ্রিন টি প্রক্রিয়াজাতের এর সময় জারণ প্রক্রিয়াটিকে এড়িয়ে চলা হয়। ফলস্বরূপ, গ্রিন টিতে সর্বাধিক পরিমাণে অ্যান্টিঅক্সিডেন্ট এবং পলিফেনল ধরে রাখে যা স্বাস্থ্যের জন্য উপকারী।তাছাড়া, গ্রিন টিতে লাল চায়ের তুলনায় উল্লেখযোগ্যভাবে কম ক্যাফিন রয়েছে, যার অর্থ লাল চা পান করার পরে এটি দেহের প্রবণতা কমিয়ে দেয়। লাল চা এবং কফিতে প্রায়শই তীব্র ক্যাফিন থাকে যা দেহের প্রবণতা কমিয়ে দেয়। দৈনিক ১০ টি সবুজ চায়ের পাতা আপনার শরীর এবং মনকে তাজা করে তোল। গ্রিন টি এর কিছু উপকার নিচে দেওয়া হল।১ . ক্যান্সার প্রতিরোধে সহায়তা করে গ্রিন টির অন্যতম প্রধান সুবিধা হল এটি যে কোনও ধরনের ক্যান্সার প্রতিরোধে সহায়তা করে। যেমন ত্বকের ক্যান্সার, স্তন ক্যান্সার, ফুসফুসের ক্যান্সার, যকৃতের ক্যান্সার, পিত্তথলির ক্যান্সার, প্রোস্টেট ক্যান্সার ইত্যাদি যে কোনও ক্যান্সার প্রতিরোধ করতে পারে। গ্রিন টি দেহে ক্যান্সার ছড়াতে বাধা দেয়। এটি ক্যান্সার থেকে রক্ষা করে। এতে প্রচুর অ্যান্টিঅক্সিডেন্টস এবং খনিজ রয়েছে যা শরীরকে সতেজ ও স্বাস্থ্যকর রাখতে খুব কার্যকর।২. হার্ট সুস্থ থাকে যে ব্যক্তিরা দিনে ১ কাপ গ্রিন টি পান করেন তাদের হার্ট অনেক সুস্থ হয় এবং যারা দিনে ৫ কাপ গ্রিন টি খান তাদের হৃদরোগ হওয়ার সম্ভাবনা কম থাকে। এটি আমাদের হার্টকে সুস্থ রাখতে এবং শরীর থেকে খারাপ কোলেস্টেরল কমিয়ে হার্টকে স্ট্রোক থেকে রক্ষা করতে সহায়তা করে।৩. ত্বক ও চুলের যত্ন গ্রিন টি ত্বক এবং চুল সুন্দর রাখতে খুব উপকারী। এটি কেবল সুন্দরই নয়, এটি ত্বকের বিভিন্ন সমস্যা যেমন ব্রণ, প্যাচযুক্ত ত্বক, ত্বকের ব্রেকআউট এবং খুশকি থেকে মুক্তি পেতে সহায়তা করে যা থেকে মুক্তি পাওয়া খুব কঠিন হয় ঝলমলে ত্বকের অন্যতম রহস্য হল এই গ্রিন টি । এটি ভিতর থেকে ত্বক এবং চুল উজ্জ্বল করতে সহায়তা করে। গ্রিন টি দিয়ে মুখ পরিষ্কার করলে মুখে ব্রণ উঠে না। আপনি যদি সুন্দর এবং ফিট থাকতে চান তবে আপনার গ্রিন টি খাওয়া দরকার। ৪. ওজন কমাতে সাহায্য করেঅতিরিক্ত ওজন কমাতে গ্রিন টি ব্যাপক সহায়তা করে । এই গ্রিন টি শরীরের বিভিন্ন অংশ থেকে অতিরিক্ত ফ্যাট সরিয়ে দেয়। শরীরের অতিরিক্ত মেদ কমাতে গ্রিন টি কাযকর সমাধান করে । ,", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2021/08/23/18/37/tea-6568547_1280.jpg'),
    productListModel(2, "Product 2", "Product 2 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2015/09/26/09/08/hipster-958805_1280.jpg'),
    productListModel(3, "Product 3", "Product 3 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2015/09/26/09/09/hipster-958806_1280.jpg'),
    productListModel(4, "Product 4", "Product 4 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2018/12/23/18/03/watch-3891591_1280.jpg'),
    productListModel(5, "Product 5", "Product 5 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2018/07/31/14/52/ecommerce-3575280_1280.jpg'),
    productListModel(4, "Product 4", "Product 4 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2020/10/31/06/41/cosmetics-5700385_1280.png'),
    productListModel(5, "Product 5", "Product 5 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(6, "Product 6", "Product 6 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2021/04/20/11/13/product-photography-6193556_1280.jpg'),
    productListModel(7, "Product 7", "Product 7 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2021/12/09/20/58/christmas-cookies-6859116_1280.jpg'),
    productListModel(8, "Product 8", "Product 8 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2021/01/03/13/57/gingerbread-5884607_1280.jpg'),
    productListModel(9, "Product 9", "Product 9 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2010/12/13/10/05/berries-2277_1280.jpg'),
    productListModel(10, "Product 10", "Product 10 desc", 5, 2, 20, 100, 5, 'https://cdn.pixabay.com/photo/2017/10/24/07/13/mask-2883635_1280.jpg')

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Maindrawer(),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Home'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.format_list_bulleted_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 150,
              child: CarouselSlider.builder(
                  slideBuilder: (index){
                    return Container(
                      child: Image.network(imagelist[index], fit: BoxFit.fill,),
                    );
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                      padding: EdgeInsets.only(bottom: 8)
                  ),
                  autoSliderDelay: Duration(seconds: 5),
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  itemCount: imagelist.length
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                //physics: NeverScrollableScrollPhysics(),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  itemCount: productlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      //childAspectRatio:  .90,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                  ),
                  itemBuilder: (BuildContext context, index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(productlist[index])));
                      },
                      child: Card(
                        elevation: 20,
                        child: Column(
                          children: [
                            Container(
                              child: Image.network(productlist[index].imageUrl),
                            ),
                            Text(productlist[index].title)
                          ],
                        ),
                      ),
                    );
                  }),
            )

          ],
        ),
      ),

    );
  }


}

class AppBars extends AppBar {
  AppBars():super(
    iconTheme: IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: Colors.white,
    title: Text(
      "this is app bar",
      style: TextStyle(color: Colors.black),
    ),
    elevation: 0.0,
    automaticallyImplyLeading: false,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () => null,
      ),
      IconButton(
        icon: Icon(Icons.person),
        onPressed: () => null,
      ),
    ],
  );
}