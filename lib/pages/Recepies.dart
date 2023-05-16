import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecipesWidget extends StatefulWidget {
  const RecipesWidget({Key? key}) : super(key: key);

  @override
  _RecipesWidgetState createState() => _RecipesWidgetState();
}

class _RecipesWidgetState extends State<RecipesWidget> {
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                  child: Text(
                    'Mis Listas',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color(0xFF368C72),
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Align(
              //         alignment: AlignmentDirectional(-1, 0),
              //         child: Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
              //           child: FFButtonWidget(
              //             onPressed: () {
              //               print('Button pressed ...');
              //             },
              //             text: 'Todo',
              //             options: FFButtonOptions(
              //               width: 100,
              //               height: 30,
              //               padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              //               iconPadding:
              //                   EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              //               color: Color(0xFF9D9D9D),
              //               textStyle: FlutterFlowTheme.of(context)
              //                   .titleSmall
              //                   .override(
              //                     fontFamily: 'Raleway',
              //                     color: Colors.white,
              //                   ),
              //               borderSide: BorderSide(
              //                 color: Colors.transparent,
              //                 width: 1,
              //               ),
              //               borderRadius: BorderRadius.circular(30),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Align(
              //         alignment: AlignmentDirectional(-1, 0),
              //         child: Padding(
              //           padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
              //           child: FFButtonWidget(
              //             onPressed: () {
              //               print('Button pressed ...');
              //             },
              //             text: 'Carpetas',
              //             options: FFButtonOptions(
              //               width: 100,
              //               height: 30,
              //               padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              //               iconPadding:
              //                   EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              //               color: Color(0xFF9D9D9D),
              //               textStyle: FlutterFlowTheme.of(context)
              //                   .titleSmall
              //                   .override(
              //                     fontFamily: 'Raleway',
              //                     color: Colors.white,
              //                   ),
              //               borderSide: BorderSide(
              //                 color: Colors.transparent,
              //                 width: 1,
              //               ),
              //               borderRadius: BorderRadius.circular(30),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    return [][index]();
                  },
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
      ),
    );
  }
}
