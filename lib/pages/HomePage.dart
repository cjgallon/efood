import 'package:efood/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:efood/components/defaultProducts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final AuthenticationController authenticationController = Get.find();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) async => await showModalBottomSheet(
    //           isScrollControlled: true,
    //           backgroundColor: Colors.transparent,
    //           enableDrag: false,
    //           context: context,
    //           builder: (bottomSheetContext) {
    //             return GestureDetector(
    //               onTap: () =>
    //                   FocusScope.of(context).requestFocus(_unfocusNode),
    //               child: Padding(
    //                 padding: EdgeInsets.symmetric(
    //                     horizontal: MediaQuery.of(context).size.width * 0.05),
    //                 child: DefaultProductsWidget(),
    //               ),
    //             );
    //           },
    //         ));
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
            child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      // print('IconButton pressed ...');
                      //TODO: move to a different button
                      authenticationController.logout();
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: '[Some hint text...]',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      scrollDirection: Axis.vertical,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/productdetails");
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Hello World',
                                ),
                                Icon(
                                  Icons.fastfood_rounded,
                                  color: Colors.black,
                                  size: 60,
                                ),
                                Text(
                                  'Hello World',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: (BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFF72D67E),
                          )),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 100,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/addproduct");
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.ad_units_outlined,
                            color: Color(0xFF72D67E),
                            size: 50,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.format_list_bulleted,
                            color: Color(0xFF72D67E),
                            size: 50,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFF72D67E),
                            size: 50,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
