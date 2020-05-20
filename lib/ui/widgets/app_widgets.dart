import 'package:flutter/material.dart';
import 'package:chlcov/ui/constant/constant.dart';
import 'package:chlcov/ui/constant/typography.dart';

class AppWidget extends StatelessWidget {
  final String image;
  final String tagline;
  final double imageTop;

  const AppWidget({Key key, this.image, this.imageTop, this.tagline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(375),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            height: 375,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [darkSalmon, seaGreen,midnightBlue, steelBlue, slateGray],
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 1.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
               
                Positioned(
                  top: spacing(7.5),
                  left: spacing(2.5),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Positioned(
                  top: imageTop,
                  left: spacing(1),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                 Positioned(
                  top: spacing(7.5),
                  right: spacing(5.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: 'CHL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 44),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'COV',
                              style: TextStyle(color: txtPink),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing(5)),
                      headingTextMedium(
                          text: tagline,
                          color: white,
                          fontWeight: FontWeight.w700)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
