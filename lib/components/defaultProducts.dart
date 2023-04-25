import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:efood/components/quickProduct.dart';

class DefaultProductsWidget extends StatefulWidget {
  const DefaultProductsWidget({Key? key}) : super(key: key);

  @override
  _DefaultProductsWidgetState createState() => _DefaultProductsWidgetState();
}

class _DefaultProductsWidgetState extends State<DefaultProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Text(
                    'INICIO RÁPIDO',
                    style: TextStyle(
                      fontFamily: GoogleFonts.getFont('Inter').fontFamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(100, 114, 214, 126)),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width * 0.2, 50),
                    ),
                  ),
                  child: Text(
                    'Finalizar',
                    style: TextStyle(
                      fontFamily: GoogleFonts.getFont('Inter').fontFamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 8),
              child: Text(
                'Selecciona tus alimentos principales y agregalos con un solo toque',
                style: TextStyle(
                  fontFamily: GoogleFonts.getFont('Inter').fontFamily,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color(0xFF7B7B7B),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    QuickProductWidget(
                      name: 'Leche',
                      description: 'Fecha de caducida: +10 dias',
                    ),
                    QuickProductWidget(
                      name: 'Huevos',
                      description: 'Fecha de caducida: +10 dias',
                    ),
                    QuickProductWidget(
                      name: 'Pan',
                      description: 'Fecha de caducida: +10 dias',
                    ),
                    QuickProductWidget(
                      name: 'Manzanas',
                      description: 'Fecha de caducida: +10 dias',
                    ),
                    QuickProductWidget(
                      name: 'Pechuga de Pollo',
                      description: 'Fecha de caducida: +10 dias',
                    ),
                    QuickProductWidget(
                      name: 'Chocolate',
                      description: 'Fecha de caducida: +10 dias',
                    ),
                    QuickProductWidget(
                      name: 'Arroz',
                      description: 'Fecha de caducida: +10 dias',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
