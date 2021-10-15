import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/hotmail.dart';
import 'package:sizer/sizer.dart';

class Buzon extends StatefulWidget {
  @override
  _BuzonState createState() => _BuzonState();
}

class _BuzonState extends State<Buzon> {
  @override
  Widget build(BuildContext context) {
    final buzonController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 2.h, left: 2.w),
          child: Text(
            "BÚZON DE SUGERENCIAS",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: "MontserratExtraBold"),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 15,
            left: 10,
            right: 10,
          ),
          child: Container(
            padding:
                EdgeInsets.only(top: 1.h, left: 2.w, right: 2.w, bottom: 3.h),
            child: const Text(
              "Puede escribir alguna sugerencia, esta será recibida de manera anónima.",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 3.h, right: 3.h, top: 1.h, bottom: 3.h),
                height: 30.h,
                child: TextFormField(
                  maxLines: 25,
                  controller: buzonController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '',
                      hintText: 'Escriba su sugerencia'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 1.h, right: 1.h),
                height: 5.h,
                width: 70.w,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        String username = 'utic_emi_scz@est.emi.edu.bo';
                        String password = 'Emiutic2021*';
                        String mensaje = buzonController.text;
                        final smtpServer = hotmail(username, password);
                        final message = Message()
                          ..from = Address(
                              username, 'Escuela Militar de Ingeniería UASC')
                          ..recipients.add("vhurtadop@adm.emi.edu.bo")
                          ..subject = 'Buzón de Sugerencias'
                          ..html = "  <body>"
                          "<p>$mensaje</p>"
                              ' <img alt="Qries" src="https://www.emi.edu.bo/images/emi-900.png"width=180" height="90" >'
                              "  <p>UNIDAD DE TECNOLOGIA DE INFORMACION Y TELECOMUNICACION</p><p>Aplicacion Escuela Militar de Ingenieria Unidad Academica Santa Cruz</p> <p>Telefono Interno : 3057 </p>  <p>Celular : +591 70833778 </p> <p>Mail: utic_emi_scz@est.emi.edu.bo </p> <p>Website: https://www.emi.edu.bo/</p>   </body>";
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Email enviado')));
                        var connection = PersistentConnection(smtpServer);

                        await connection.send(message);

                        await connection.close();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(color: Color(0xff034692))),

                      primary: const Color(0xff034692),
                      // background
                      onPrimary: Colors.white,
                    ),
                    child: const Text(
                      "Enviar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "MontserratSemiBold",
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
