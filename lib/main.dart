import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => GirisEkrani(),
        "/ProfilSayfasiRotasi": (context) => ProfilEkrani(),
      },
    );
  }
}

class GirisEkrani extends StatefulWidget {
  @override
  _GirisEkraniState createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  girisYap() {
    if (t1.text == "admin" && t2.text == "1234") {
      Navigator.pushNamed(context, "/ProfilSayfasiRotasi",
          arguments: VeriModeli(kullaniciAdi: t1.text, sifre: t2.text));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Yanlış kullanıcı adı veya şifre"),
              content: new Text("Lütfen giriş bilgilerinizi gözden geçiriniz"),
              actions: [
                new TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("Kapat"),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giriş Ekrani")),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: t1,
                decoration: InputDecoration(hintText: "Kullanıcı Adı"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Şifre"),
                controller: t2,
              ),
              ElevatedButton(onPressed: girisYap, child: Text("Giriş Yap")),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  @override
  _ProfilEkraniState createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  cikisYap() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    VeriModeli iletilenArgumanlar = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Profil Sayfası")),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: cikisYap,
              child: Text("Çıkış Yap"),
            ),
            Text(iletilenArgumanlar.kullaniciAdi),
            Text(iletilenArgumanlar.sifre),
          ],
        ),
      ),
    );
  }
}

class VeriModeli {
  String kullaniciAdi, sifre;
  VeriModeli({this.kullaniciAdi, this.sifre});
}
