import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LetsBeginWidget extends StatefulWidget {
  const LetsBeginWidget({Key? key}) : super(key: key);

  @override
  _LetsBeginWidgetState createState() => _LetsBeginWidgetState();
}

class _LetsBeginWidgetState extends State<LetsBeginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
              child: Text(
                'VAMOS A COMENZAR!',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Color(0xFF368C72),
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
              child: Image.network(
                'https://picsum.photos/seed/310/600',
                width: 300,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text(
                    'INICIAR SESION',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF368C72),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Text(
                    'REGISTRAR',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF368C72),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    minimumSize: Size(200, 55),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
