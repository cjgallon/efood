import 'package:efood/FirebaseCentral.dart';
import 'package:efood/controllers/auth_controller.dart';
import 'package:efood/controllers/product_controller.dart';
import 'package:efood/controllers/ui_controller.dart';
import 'package:efood/pages/LetsBegin.dart';
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
  // final _unfocusNode = FocusNode();
  List<Map<String, dynamic>> productList = [];
  final AuthenticationController authenticationController = Get.find();
  final UIController uiController = Get.find();
  final Product_Controller product_controller = Get.find();

  @override
  void initState() {
    super.initState();
    print("Init homepage");
    getProducts();
    setState(() {
      productList = product_controller.products;
    });
  }

  void showQuickProducts() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (bottomSheetContext) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: DefaultProductsWidget(),
                );
                // return GestureDetector(
                //   onTap: () =>
                //       FocusScope.of(context).requestFocus(_unfocusNode),
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(
                //         horizontal: MediaQuery.of(context).size.width * 0.05),
                //     child: DefaultProductsWidget(),
                //   ),
                // );
              },
            ));
  }

  @override
  void dispose() {
    // _unfocusNode.dispose();
    super.dispose();
  }

  getProducts() async {
    product_controller.cleanProducts();
    await product_controller
        .getUserProducts(authenticationController.getUid())
        .then((value) {
      if (!uiController.quickProductsModalShown) {
        uiController.closeQuickProductsModal();
        showQuickProducts();
      }
    });
  }

  void _logout() async {
    try {
      uiController.reset();
      await authenticationController.logout();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(productList);

    return Scaffold(
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
                    print("IconButton pressed ...");
                    _logout();
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
                      children: productList
                          .map((e) => InkWell(
                                onTap: () {
                                  product_controller.selectedProduct = e;
                                  Navigator.pushNamed(
                                      context, "/productdetails");
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        e["nombre"],
                                      ),
                                      Icon(
                                        Icons.fastfood_rounded,
                                        color: Colors.black,
                                        size: 60,
                                      ),
                                      Text(
                                        "${DateTime.parse(e["fecha"]).difference(DateTime.now())}",
                                        style: TextStyle(fontSize: 9),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                          .toList()

                      //   Container(
                      //     decoration: (BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       color: Color(0xFF72D67E),
                      //     )),
                      //     child: IconButton(
                      //       icon: const Icon(
                      //         Icons.add_rounded,
                      //         color: Colors.white,
                      //         size: 100,
                      //       ),
                      //       onPressed: () {
                      //         Navigator.pushNamed(context, "/addproduct");
                      //       },
                      //     ),
                      //   )
                      // ],
                      ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/recipes");
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
                        Icons.format_list_bulleted,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
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
      )),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 95),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "/addproduct");
            },
            backgroundColor: Color(0xFF368C72),
            child: Icon(Icons.add_rounded, size: 40),
          )),
    );
    // return GestureDetector(
    //   onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
    //   child: Scaffold(
    //     key: scaffoldKey,
    //     backgroundColor: Colors.white,
    //     body: SafeArea(
    //         child: Padding(
    //       padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.max,
    //         children: [
    //           Row(
    //             mainAxisSize: MainAxisSize.max,
    //             children: [
    //               IconButton(
    //                 icon: Icon(
    //                   Icons.filter_list,
    //                   color: Colors.black,
    //                   size: 30,
    //                 ),
    //                 onPressed: () {
    //                   print("IconButton pressed ...");
    //                   _logout();
    //                 },
    //               ),
    //               Expanded(
    //                 child: TextFormField(
    //                   autofocus: true,
    //                   obscureText: false,
    //                   decoration: InputDecoration(
    //                     hintText: '[Some hint text...]',
    //                     enabledBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(
    //                         color: Colors.black,
    //                         width: 2,
    //                       ),
    //                       borderRadius: BorderRadius.circular(40),
    //                     ),
    //                     focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(
    //                         color: Color(0x00000000),
    //                         width: 2,
    //                       ),
    //                       borderRadius: BorderRadius.circular(40),
    //                     ),
    //                     errorBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(
    //                         color: Color(0x00000000),
    //                         width: 2,
    //                       ),
    //                       borderRadius: BorderRadius.circular(40),
    //                     ),
    //                     focusedErrorBorder: OutlineInputBorder(
    //                       borderSide: BorderSide(
    //                         color: Color(0x00000000),
    //                         width: 2,
    //                       ),
    //                       borderRadius: BorderRadius.circular(40),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               IconButton(
    //                 icon: Icon(
    //                   Icons.search,
    //                   color: Colors.black,
    //                   size: 30,
    //                 ),
    //                 onPressed: () {
    //                   print('IconButton pressed ...');
    //                 },
    //               ),
    //             ],
    //           ),
    //           Expanded(
    //             child: Align(
    //               alignment: AlignmentDirectional(0, 0),
    //               child: Padding(
    //                 padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
    //                 child: GridView(
    //                     padding: EdgeInsets.zero,
    //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                       crossAxisCount: 3,
    //                       crossAxisSpacing: 10,
    //                       mainAxisSpacing: 10,
    //                       childAspectRatio: 1,
    //                     ),
    //                     scrollDirection: Axis.vertical,
    //                     children: product_controller.products
    //                         .map((e) => InkWell(
    //                               onTap: () {
    //                                 Navigator.pushNamed(
    //                                     context, "/productdetails");
    //                               },
    //                               child: Container(
    //                                 width: 100,
    //                                 height: 100,
    //                                 decoration: BoxDecoration(
    //                                   color: Colors.white,
    //                                   borderRadius: BorderRadius.circular(30),
    //                                   shape: BoxShape.rectangle,
    //                                   border: Border.all(
    //                                     color: Colors.black,
    //                                   ),
    //                                 ),
    //                                 child: Column(
    //                                   mainAxisSize: MainAxisSize.max,
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceEvenly,
    //                                   children: [
    //                                     Text(
    //                                       e["nombre"],
    //                                     ),
    //                                     Icon(
    //                                       Icons.fastfood_rounded,
    //                                       color: Colors.black,
    //                                       size: 60,
    //                                     ),
    //                                     Text(
    //                                       e["fecha"],
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ))
    //                         .toList()

    //                     //   Container(
    //                     //     decoration: (BoxDecoration(
    //                     //       borderRadius: BorderRadius.circular(30),
    //                     //       color: Color(0xFF72D67E),
    //                     //     )),
    //                     //     child: IconButton(
    //                     //       icon: const Icon(
    //                     //         Icons.add_rounded,
    //                     //         color: Colors.white,
    //                     //         size: 100,
    //                     //       ),
    //                     //       onPressed: () {
    //                     //         Navigator.pushNamed(context, "/addproduct");
    //                     //       },
    //                     //     ),
    //                     //   )
    //                     // ],
    //                     ),
    //               ),
    //             ),
    //           ),
    //           Align(
    //               alignment: AlignmentDirectional(0, 0),
    //               child: Padding(
    //                 padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 30),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     IconButton(
    //                       icon: Icon(
    //                         Icons.ad_units_outlined,
    //                         color: Color(0xFF74D482),
    //                         size: 50,
    //                       ),
    //                       onPressed: () {
    //                         print('IconButton pressed ...');
    //                       },
    //                     ),
    //                     IconButton(
    //                       icon: Icon(
    //                         Icons.format_list_bulleted,
    //                         color: Color(0xFF74D482),
    //                         size: 50,
    //                       ),
    //                       onPressed: () {
    //                         print('IconButton pressed ...');
    //                       },
    //                     ),
    //                     IconButton(
    //                       icon: Icon(
    //                         Icons.person,
    //                         color: Color(0xFF74D482),
    //                         size: 50,
    //                       ),
    //                       onPressed: () {
    //                         print('IconButton pressed ...');
    //                       },
    //                     ),
    //                   ],
    //                 ),
    //               )),
    //         ],
    //       ),
    //     )),
    //     floatingActionButton: Padding(
    //         padding: EdgeInsets.only(bottom: 70),
    //         child: FloatingActionButton(
    //           onPressed: () {
    //             Navigator.pushNamed(context, "/addproduct");
    //           },
    //           backgroundColor: Color(0xFF74D482),
    //           child: Icon(Icons.add_rounded, size: 40),
    //         )),
    //   ),
    // );
  }
}
