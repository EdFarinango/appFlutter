import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../data.dart';

const PdfColor green = PdfColor.fromInt(0xff9ce5d0);
const PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
const sep = 120.0;

Future<Uint8List> generateResume(PdfPageFormat format, CustomData data) async {
  final doc =
      pw.Document(title: 'Currículum Vitae', author: 'Eduardo Farinango');
final profileImage = pw.MemoryImage(
    (await rootBundle.load('assets/Fairnango.jpg')).buffer.asUint8List(),
  );
 
 

  final pageTheme = await _myPageTheme(format);

  doc.addPage(
    pw.MultiPage(
      pageTheme: pageTheme,
      build: (pw.Context context) => [
        pw.Partitions(
          children: [
            pw.Partition(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: <pw.Widget>[
                  pw.Container(
                    padding: const pw.EdgeInsets.only(left: 30, bottom: 20),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: <pw.Widget>[
                        pw.Text('Eduardo Farinango',
                            textScaleFactor: 2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(fontWeight: pw.FontWeight.bold)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 10)),
                        pw.Text('Full Stack Developer',
                            textScaleFactor: 1.2,
                            style: pw.Theme.of(context)
                                .defaultTextStyle
                                .copyWith(
                                    fontWeight: pw.FontWeight.bold,
                                    color: green)),
                        pw.Padding(padding: const pw.EdgeInsets.only(top: 20)),
                        pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: <pw.Widget>[
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Text('Virgen del Pilar'),
                                pw.Text('San Antonio de Pichincha'),
                                pw.Text('Sexta transversal'),
                              ],
                            ),
                            pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: <pw.Widget>[
                                pw.Text('+593 996164952'),
                                _UrlText('epfarinango@gmail.com',
                                    'mailto:epfarinango@gmail.com'),
                               
                              ],
                            ),
                            pw.Padding(padding: pw.EdgeInsets.zero)
                          ],
                        ),
                      ],
                    ),
                  ),
                  _Category(title: 'Experiencia laboral'),
                  _Block(
                      title: 'Asistente de Administración de Redes',
                      icon: const pw.IconData(0xe762)),
                  pw.Container(
                    decoration: const pw.BoxDecoration(
                        border: pw.Border(
                            left: pw.BorderSide(color: green, width: 2))),
                    padding:
                        const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    margin: const pw.EdgeInsets.only(left: 5),
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Text('Asistente de administración de redes en la empresa de telecomunicaciones Claro Ecuador.'),
                        ]),
                  ),
                  _Block(
                      title: 'TI en la empresa de telecomunicaciones Claro Ecuador',
                      icon: const pw.IconData(0xe30d)),
                  pw.Container(
                    decoration: const pw.BoxDecoration(
                        border: pw.Border(
                            left: pw.BorderSide(color: green, width: 2))),
                    padding:
                        const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    margin: const pw.EdgeInsets.only(left: 5),
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Text('Asistente de administración de redes en la empresa de telecomunicaciones Claro Ecuador.'),
                        ]),
                  ),
                  pw.SizedBox(height: 20),
                  _Category(title: 'Educación'),
                  _Block(title: 'Intituto Tecnológico Superior de Pichincha'),
                  pw.Container(
                    decoration: const pw.BoxDecoration(
                        border: pw.Border(
                            left: pw.BorderSide(color: green, width: 2))),
                    padding:
                        const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    margin: const pw.EdgeInsets.only(left: 5),
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Text('Bachiller en Ciencias de la Computación 2015-2019'),
                        ]),
                  ),
                  _Block(title: 'Escuela Politécnica Nacional'),
                  pw.Container(
                    decoration: const pw.BoxDecoration(
                        border: pw.Border(
                            left: pw.BorderSide(color: green, width: 2))),
                    padding:
                        const pw.EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    margin: const pw.EdgeInsets.only(left: 5),
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: <pw.Widget>[
                          pw.Text('Tecnólogo Superior en Desarrollo de Software 2019-2023'),
                        ]),
                  ),
                ],
              ),
            ),
            pw.Partition(
              width: sep,
              child: pw.Column(
                children: [
                  pw.Container(
                    height: pageTheme.pageFormat.availableHeight,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: <pw.Widget>[
                        pw.ClipOval(
                          child: pw.Container(
                            width: 100,
                            height: 100,
                            color: lightGreen,
                            child: pw.Image(profileImage),
                          ),
                        ),
                        pw.Column(children: <pw.Widget>[
                          _Percent(
                              size: 60,
                              value: .7,
                              title: pw.Text('Maven',
                                  style: pw.TextStyle(fontSize: 10))),                            _Percent(
                              size: 50, value: .6, title: pw.Text('Laravel')),
                          _Percent(
                              size: 50, value: .5, title: pw.Text('Reack')),
                          _Percent(
                              size: 50, value: .4, title: pw.Text('Ionic')),
                          _Percent(
                              size: 50, value: .3, title: pw.Text('Flutter')),
                          _Percent(
                              size: 50, value: .6, title: pw.Text('Docker')),
                        ]),
                        //log 
                        



                        
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
  return doc.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString('assets/resume.svg');

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 4.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      base: await PdfGoogleFonts.openSansRegular(),
      bold: await PdfGoogleFonts.openSansBold(),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

class _Block extends pw.StatelessWidget {
  _Block({
    required this.title,
    this.icon,
  });

  final String title;

  final pw.IconData? icon;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: <pw.Widget>[
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: <pw.Widget>[
                pw.Container(
                  width: 6,
                  height: 6,
                  margin: const pw.EdgeInsets.only(top: 5.5, left: 2, right: 5),
                  decoration: const pw.BoxDecoration(
                    color: green,
                    shape: pw.BoxShape.circle,
                  ),
                ),
                pw.Text(title,
                    style: pw.Theme.of(context)
                        .defaultTextStyle
                        .copyWith(fontWeight: pw.FontWeight.bold)),
                pw.Spacer(),
                if (icon != null) pw.Icon(icon!, color: lightGreen, size: 18),
              ]),
        ]);
  }
}

class _Category extends pw.StatelessWidget {
  _Category({required this.title});

  final String title;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      decoration: const pw.BoxDecoration(
        color: lightGreen,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      margin: const pw.EdgeInsets.only(bottom: 10, top: 20),
      padding: const pw.EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: pw.Text(
        title,
        textScaleFactor: 1.5,
      ),
    );
  }
}

class _Percent extends pw.StatelessWidget {
  _Percent({
    required this.size,
    required this.value,
    required this.title,
  });

  final double size;

  final double value;

  final pw.Widget title;

  static const fontSize = 1.2;

  PdfColor get color => PdfColors.blue;

  static const backgroundColor = PdfColors.grey300;

  static const strokeWidth = 5.0;

  @override
  pw.Widget build(pw.Context context) {
    final widgets = <pw.Widget>[
      pw.Container(
        width: size,
        height: size,
        child: pw.Stack(
          alignment: pw.Alignment.center,
          fit: pw.StackFit.expand,
          children: <pw.Widget>[
            pw.Center(
              child: pw.Text(
                '${(value * 100).round().toInt()}%',
                textScaleFactor: fontSize,
              ),
            ),
            pw.CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ],
        ),
      )
    ];

    widgets.add(title);

    return pw.Column(children: widgets);
  }
}

class _UrlText extends pw.StatelessWidget {
  _UrlText(this.text, this.url);

  final String text;
  final String url;

  @override
  pw.Widget build(pw.Context context) {
    return pw.UrlLink(
      destination: url,
      child: pw.Text(text,
          style: const pw.TextStyle(
            decoration: pw.TextDecoration.underline,
            color: PdfColors.blue,
          )),
    );
  }
}
