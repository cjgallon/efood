import 'package:efood/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controllers/product_controller.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final Product_Controller product_controller = Get.find();
  TextEditingController nombre = TextEditingController();
  TextEditingController fecha = TextEditingController();
  String? categoria = "a";
  String? almacenamiento = "1";
  int cantidad = 1;
  @override
  void initState() {
    super.initState();
    setState(() {
      Map<String, dynamic>? selprod = product_controller.selectedProduct;
      if (selprod != null) {
        nombre.text = selprod["nombre"];
        fecha.text = selprod["fecha"];
        categoria = selprod["categoria"];
        almacenamiento = selprod["almacenamiento"];
        cantidad = selprod["cantidad"];
      }
    });
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
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Color(0xFF8C8C8C),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Text(
                          'DETALLES DEL PRODUCTO',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFF74D482),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: FaIcon(
                                  FontAwesomeIcons.utensils,
                                  color: Color(0xFF74d482),
                                  size: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextFormField(
                                  controller: nombre,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF757575),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFe0e0e0),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: Color(0xB5757575),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.start,
                                  //validator: _model.textController1Validator
                                  //    .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            FaIcon(
                              FontAwesomeIcons.solidCalendarDays,
                              color: Color(0xFF74d482),
                              size: 30,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                'Fecha aprox. de caducidad',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF757575),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(60, 0, 60, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextFormField(
                            controller: fecha,
                            autofocus: true,
                            obscureText: false,
                            decoration: const InputDecoration(
                              hintText: '[Some hint text...]',
                              hintStyle: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFF57636c),
                                fontSize: 12,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFe0e0e0),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xFF57636c),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            keyboardType: TextInputType.datetime,
                            //validator: _model.textController2Validator
                            //    .asValidator(context),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0x7D757575),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 20),
                        child: Text(
                          'Detalles',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFF74d482),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.inventory,
                              color: Color(0xFF74d482),
                              size: 40,
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Almacenamiento',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF757575),
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      value: almacenamiento,
                                      items: const [
                                        DropdownMenuItem(
                                          value: "1",
                                          child: Text('1'),
                                        ),
                                        DropdownMenuItem(
                                          value: "2",
                                          child: Text('2'),
                                        ),
                                        DropdownMenuItem(
                                          value: "3",
                                          child: Text('3'),
                                        )
                                      ],
                                      onChanged: (val) =>
                                          setState(() => almacenamiento = val),
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF757575),
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      hint: const Text('Please select...'),
                                      elevation: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0x7D757575),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.category_rounded,
                              color: Color(0xFF74d482),
                              size: 40,
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Categoría',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF757575),
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    DropdownButton<String>(
                                      value: categoria,
                                      items: const [
                                        DropdownMenuItem(
                                          value: "a",
                                          child: Text('a'),
                                        ),
                                        DropdownMenuItem(
                                          value: "b",
                                          child: Text('b'),
                                        ),
                                        DropdownMenuItem(
                                          value: "c",
                                          child: Text('c'),
                                        )
                                      ],
                                      onChanged: (val) =>
                                          setState(() => categoria = val),
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF757575),
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      hint: const Text('Please select...'),
                                      elevation: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Color(0x7D757575),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              'Cantidad',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
                              ),
                            ),
                            Container(
                                width: 160,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Color(0xFF74d482),
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (cantidad > 1) {
                                            cantidad--;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      cantidad.toString(),
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF757575),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Color(0xFF74d482),
                                        size: 30,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: TextButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFF74D482))),
                            child: const Text(
                              "GUARDAR CAMBIOS",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {
                              Map<String, dynamic> prod = {
                                "nombre": nombre.text,
                                "fecha": fecha.text,
                                "categoria": categoria,
                                "almacenamiento": almacenamiento,
                                "cantidad": cantidad
                              };
                              product_controller.updateSelected(prod);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: TextButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 150, 26, 26))),
                            child: const Text(
                              "ELIMINAR PRODUCTO",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {
                              product_controller.removeSelected();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
