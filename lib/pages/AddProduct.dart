import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProductWidget extends StatefulWidget {
  const AddProductWidget({Key? key}) : super(key: key);

  @override
  _AddProductWidgetState createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends State<AddProductWidget> {
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
                        print('IconButton pressed ...');
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        color: Color(0xFFB9B9B9),
                        size: 30,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
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
                            'AGREGAR PRODUCTO',
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
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextFormField(
                              //controller: _model.textController1,
                              autofocus: true,
                              obscureText: false,
                              decoration: const InputDecoration(
                                hintText: 'Nombre',
                                hintStyle: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF757575),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x8C74D482),
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
                                color: Color(0xFF57636c),
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              //validator: _model.textController1Validator
                              //.asValidator(context),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidCalendarAlt,
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
                              EdgeInsetsDirectional.fromSTEB(60, 0, 60, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextFormField(
                              //controller: _model.textController2,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
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
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: TextStyle(
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
                        Divider(
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                          color: Color(0x7D757575),
                        ),
                        Padding(
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
                          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.inventory,
                                color: Color(0xFF74d482),
                                size: 40,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        value: "1",
                                        //controller: _model
                                        //      .dropDownValueController1 ??=
                                        //FormFieldController<String>(null),
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
                                            setState(() => val = val),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.category_rounded,
                                color: Color(0xFF74d482),
                                size: 40,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        value: "a",
                                        //controller: _model
                                        //      .dropDownValueController1 ??=
                                        //FormFieldController<String>(null),
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
                                            setState(() => val = val),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
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
                                          print('IconButton pressed ...');
                                        },
                                      ),
                                      const Text(
                                        '0',
                                        style: TextStyle(
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
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: TextButton(
                              child: const Text(
                                "+ AGREGAR PRODUCTO",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                print('Button pressed ...');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                color: Color(0xFFe0e0e0),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: Color(0x8E757575),
                        size: 30,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    Text(
                      'Mostrar sugerencias',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0x8E757575),
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
