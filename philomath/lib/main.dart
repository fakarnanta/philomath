import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'philomath', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 37),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Header(),
                SizedBox(
                  height: 26,
                ),
                SearchBar(),
                SizedBox(height: 10),
                Container(
                width: 120,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0x49848586)),),
                SizedBox(
                  height: 10,
                ),
                Banner(),
                SizedBox(
                  height: 60,
                ),
                TilesHome(),
                SizedBox(height: 36),
                PhiloBotHome()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hi, Dev!',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)))
          ],
        )
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});
  //jangan lupa kerjakan fungsinya, state, delegate, dan list view(mungkin ke page lain)

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFFF0EEEE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              child: Icon(
                LineIcons.search,
                size: 22,
                color: Colors.black,
              )),
          Text(
            'Search',
            style: GoogleFonts.poppins(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class SpacedTextWidget extends StatelessWidget {
  final String text;
  final double maxWidth;

  SpacedTextWidget({required this.text, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    List<String> lines = _splitTextIntoLines(text, maxWidth);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        return Text(
          line,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        );
      }).toList(),
    );
  }

  List<String> _splitTextIntoLines(String text, double maxWidth) {
    List<String> lines = [];
    List<String> words = text.split(' ');
    String currentLine = '';

    for (String word in words) {
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: currentLine.isEmpty ? word : '$currentLine $word',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout(minWidth: 0, maxWidth: maxWidth);

      if (textPainter.width <= maxWidth) {
        currentLine = currentLine.isEmpty ? word : '$currentLine $word';
      } else {
        lines.add(currentLine);
        currentLine = word;
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    return lines;
  }
}

class Banner extends StatefulWidget {
  const Banner({super.key});

  @override
  State<Banner> createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: -25,
          child: Container(
            width: 276,
            height: 175,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFA6D0ED)),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            width: MediaQuery.of(context).size.width,
            height: 186,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFF446386),
            ),
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Let's continue\nour lesson with\nexcitement!",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      SimpleCircularProgressBar(
                        size: 48,
                        progressStrokeWidth: 5,
                        backStrokeWidth: 5,
                      ),
                      SimpleCircularProgressBar(
                        size: 48,
                        progressStrokeWidth: 5,
                        backStrokeWidth: 5,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Continue',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      SizedBox(width: 8),
                      LineIcon.arrowRight(size: 14, color: Colors.white,)
                    ],
                  )
                ],
              ),
            ])),
        Positioned(
          bottom: -48,
          right: -0,
          child: SvgPicture.asset('assets/orang1.svg'),
        ),
      ],
    );
  }
}

class TilesHome extends StatelessWidget {
  const TilesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommended',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Text(
              'See All',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFA09F9F)),
            )
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFA6D0ED),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        left: 21,
                        bottom: 19,
                        child: Text(
                          'Linear\nAlgebra',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: Image.asset('assets/doodle1.png'))
                  ],
                )),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFA6D0ED),
              ),
              child: Stack(children: [
                Positioned(
                    left: 21,
                    bottom: 19,
                    child: Text(
                      'Calculus',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: Image.asset('assets/doodle2.png'))
              ]),
            )
          ],
        ), 
        SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFA6D0ED),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        left: 21,
                        bottom: 19,
                        child: Text(
                          'Linear\nAlgebra',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )),
                        Positioned(
                          top: -10,
                          right: -10,
                          child: Image.asset('assets/doodle3.png'))
                  ],
                )),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFA6D0ED),
              ),
              child: Stack(children: [
                Positioned(
                    left: 21,
                    bottom: 19,
                    child: Text(
                      'Calculus',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    )),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: Image.asset('assets/doodle4.png'))
                 
              ]),
            )
          ],
        )
      ],
    );
  }
}

class PhiloBotHome extends StatelessWidget {
  const PhiloBotHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Try Our\nNew Math\nHelper', 
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),),
           Expanded(
            child: Image.asset(
              'assets/blink.png',
              width: 115,
              height: 121,))
          ],
        ),
        SizedBox(height: 36),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 31),
          height: 184,
          width:  MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            color: Color(0xFF446386),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Introducing, ',
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400)
                      ),
                      TextSpan(
                        text: 'philoBOT 🤖',
                        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700)
                      )
                  ]
                )),
                SizedBox(height: 11,),
                Text('A math specialty bot powered by GPT 5',
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 150,
                    height: 30,
                    child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                       ),
                      ),
                      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Color(0xFF446386); // Color when the button is pressed
                        }
                        return Color(0xFFD9D9D9); // Default color
                      },
                    ),
                    ),
                    onPressed: () {}, 
                    child: Text("Try it now（￣︶￣）",
                    style: GoogleFonts.poppins(
                      fontSize: 8,
                      color: Colors.black,
                  
                    ),
                  
                    )),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}