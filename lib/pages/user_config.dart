import 'package:efood/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserConfigWidget extends StatefulWidget {
  const UserConfigWidget({Key? key}) : super(key: key);

  @override
  _UserConfigWidgetState createState() => _UserConfigWidgetState();
}

class _UserConfigWidgetState extends State<UserConfigWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final bool value = true;
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://picsum.photos/seed/524/600',
                            width: 200,
                            height: 200,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Javier Pizarro',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color(0xFF368C72),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Color(0xFFCACACA),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 30,
                            icon: Icon(
                              Icons.notifications,
                              color: Color(0xFF9D9D9D),
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              child: Text(
                                'Notificaciones',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xFF9D9D9D),
                                  fontSize: 20,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onPrimary: Colors.white,
                                padding: EdgeInsets.zero,
                                minimumSize: Size(130, 40),
                                side: BorderSide(width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Switch(
                                  value: true,
                                  onChanged: (newValue) async {
                                    // setState(
                                    //     () => _model.switchValue = newValue!);
                                  },
                                  activeColor: Color(0x00FFFFFF),
                                  activeTrackColor: Color(0xFF368C72),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Color(0xFFCACACA),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Color(0xFFCACACA),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 30,
                            icon: Icon(
                              Icons.notifications_active,
                              color: Color(0xFF9D9D9D),
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              child: ElevatedButton(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                child: Text(
                                  'Personalizar alertas',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF9D9D9D),
                                    fontSize: 20,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onPrimary: Color(0x00FFFFFF),
                                  elevation: 0,
                                  side: BorderSide(
                                    color: Color(0xFF9D9D9D),
                                    width: 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  minimumSize: Size(130, 40),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Color(0xFFCACACA),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Color(0xFFCACACA),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 30,
                            icon: Icon(
                              Icons.language_sharp,
                              color: Color(0xFF9D9D9D),
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: TextButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              child: Text(
                                'Idioma',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xFF9D9D9D),
                                  fontSize: 20,
                                ),
                              ),
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color(0x00FFFFFF),
                                ),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(width: 1),
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  Size(130, 40),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Color(0xFFCACACA),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Color(0xFFCACACA),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            iconSize: 30,
                            icon: Icon(
                              Icons.restore,
                              color: Color(0xFF9D9D9D),
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              child: Text(
                                'Restablecer Datos',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xFF9D9D9D),
                                  fontSize: 20,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0x00FFFFFF),
                                onPrimary: Color(0xFF9D9D9D),
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(width: 1),
                                ),
                                minimumSize: Size(130, 40),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10,
                        thickness: 1,
                        endIndent: 0,
                        color: Color(0xFFCACACA),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(36, 36, 36, 36),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'E',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Color(0xFF368C72),
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '- FOOD',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Color(0xFF6DD1AE),
                              fontSize: 45,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 50,
                          icon: Icon(
                            Icons.format_list_bulleted,
                            color: Colors.white,
                          ),
                          color: Color(0xFF368C72),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 50,
                          icon: Icon(
                            Icons.all_inbox_sharp,
                            color: Colors.white,
                          ),
                          color: Color(0xFF368C72),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 50,
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          color: Color(0xFF368C72),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
