import 'package:flutter/cupertino.dart';
import 'package:slamdunk/SizeConfig.dart';
import 'package:flutter/material.dart';
import '../../AppTheme.dart';
import 'package:slamdunk/screens/form.dart';

class CategoryQuestion extends StatefulWidget {
  static const String id = 'category_question';


  @override
  _CategoryQuestionState createState() => _CategoryQuestionState();
}

class _CategoryQuestionState extends State<CategoryQuestion> {
  late ThemeData themeData;
  late CustomAppTheme customAppTheme;
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    MySize().init(context);
    customAppTheme = CustomAppTheme.lightCustomAppTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                body: Stack(
                children: [
                  ClipPath(

                      clipper: _MyCustomClipper(context),
                      child: Container(
                        alignment: Alignment.center,
                      )),
                  ListView(

                    padding: EdgeInsets.all(24),
                    children: <Widget>[Container(
                        child: Text(
                          "Hey Jojo,",
                          ),

                        ),

                      _singleNews(
                        author: "Jojo",
                        date: "Mar 19, 2021",
                        headline: "I really didnt want to tweet stuff like this. However, ive had a few important ppl ask me cuz they werent sure, so: I am looking for work in basketball and hope to be able to make enough from this to support my family someday. So any opportunity is appreciated.",
                      ),
                      _singleNews(
                        author: "Blasto",
                        date: "MAR 26, 2021",
                        headline: "Over the last 7 years, basketball has become #1. But would be interested in rookie development and how new coaches are influencing that, Klay rehab & roster moves. Not to mention next season is only a few months away.",
                      ),
                      _singleNews(
                        author: "Abix",
                        date: "Nov 1, 2021",
                        headline: "I really didnt want to tweet stuff like this. However, ive had a few important ppl ask me cuz they werent sure, so: I am looking for work in basketball and hope to be able to make enough from this to support my family someday. So any opportunity is appreciated.",
                      ),
                      _singleNews(
                        author: "Ash",
                        date: "AUG 3, 2021",
                        headline: "Our 2021 Elite was a HUGE success! Thank you to all our camp participants!!! We love having you all on campus today!#MakeltCount",
                      ),

                    ],
                  ),
                ],
                ),
              floatingActionButton: FloatingActionButton(

                onPressed: () => Navigator.pushNamed(context,FormScreen.id),
                child: Icon(Icons.add),
                backgroundColor: Colors.black,
              ),
            ),
        ),

    );
  }

  _singleNews({
    required String author,
    required String headline,
    required String date,
  }) {
    return InkWell(
      onTap: () {
       // Navigator.push(context,
            //MaterialPageRoute(builder: (context) => SpecificQuestionScreen(headline:headline,author:author,date:date)));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8!)),
            boxShadow: [
              BoxShadow(
                color: customAppTheme.shadowColor,
                spreadRadius: 2,
                blurRadius: MySize.size10!,
                offset: Offset(0, MySize.size8!),
              ),
            ]),
        margin: Spacing.top(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headline,
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.primaryVariant,
                        fontWeight: 600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    author,
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        color: themeData.colorScheme.primaryVariant,
                        fontWeight: 600),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            date,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.primaryVariant,
                                fontSize: 11,
                                xMuted: true),
                          )),
                      Container(
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.primaryVariant
                                .withAlpha(100),
                            shape: BoxShape.rectangle),
                        width: 4,
                        height: 4,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  final BuildContext _context;

  _MyCustomClipper(this._context);

  @override
  Path getClip(Size size) {
    final path = Path();
    Size size = MediaQuery.of(_context).size;
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(0, size.height * 0.6);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}