import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditRecipeWidget extends StatefulWidget {
  const EditRecipeWidget({Key? key}) : super(key: key);

  @override
  _EditRecipeWidgetState createState() => _EditRecipeWidgetState();
}

class _EditRecipeWidgetState extends State<EditRecipeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final bool value = true;

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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.chevron_left_outlined,
                      color: Color(0xFF368C72),
                      size: 30,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: Text(
                            'Título de receta',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Color(0xFF368C72),
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Productos',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Color(0xFF9D9D9D),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.85, 0),
                                child: Text(
                                  'Cantidad',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF9D9D9D),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        unselectedWidgetColor: Colors.white,
                                      ),
                                      child: Checkbox(
                                        value: value,
                                        onChanged: (newValue) async {
                                          setState(() {});
                                        },
                                        activeColor: Color(0xFF368C72),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(-0.9, 0),
                                      child: Text(
                                        'Producto #1',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.8, 0),
                                      child: Text(
                                        'x Litros',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 130,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF368C72),
                                  border: Border.all(
                                    color: Color(0xFF368C72),
                                  ),
                                ),
                                child: Icon(
                                  Icons.format_list_bulleted,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/homepage");
                              },
                              child: Container(
                                width: 130,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF368C72),
                                  border: Border.all(
                                    color: Color(0xFF368C72),
                                  ),
                                ),
                                child: Icon(
                                  Icons.all_inbox_sharp,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/user");
                              },
                              child: Container(
                                width: 130,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF368C72),
                                  border: Border.all(
                                    color: Color(0xFF368C72),
                                  ),
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
