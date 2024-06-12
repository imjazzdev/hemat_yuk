import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hemat_yuk/constants/const.dart';
import 'package:hemat_yuk/models/data_input_model.dart';
import 'package:hemat_yuk/pages/detail.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _potonganController = TextEditingController();
  //
  final TextEditingController _cashbackdanaController = TextEditingController();
  final TextEditingController _admindanaController = TextEditingController();
  final TextEditingController _diskondanaController = TextEditingController();
  //
  final TextEditingController _cashbackgopayController =
      TextEditingController();
  final TextEditingController _admingopayController = TextEditingController();
  final TextEditingController _diskongopayController = TextEditingController();
  //
  final TextEditingController _cashbackovoController = TextEditingController();
  final TextEditingController _adminovoController = TextEditingController();
  final TextEditingController _diskonovoController = TextEditingController();
  //
  final formatter =
      NumberFormat.decimalPatternDigits(locale: 'id', decimalDigits: 3);
  //
  var resultDana;
  var totalHargaDana;
  var resultGopay;
  var totalHargaGopay;
  var resultOvo;
  var totalHargaOvo;

  @override
  void dispose() {
    _hargaController.dispose();
    _potonganController.dispose();
    _cashbackdanaController.dispose();
    _admindanaController.dispose();
    _diskondanaController.dispose();
    _cashbackgopayController.dispose();
    _admingopayController.dispose();
    _diskongopayController.dispose();
    _cashbackovoController.dispose();
    _adminovoController.dispose();
    _diskonovoController.dispose();

    super.dispose();
  }

  void _hapusSemuaInputs() {
    _hargaController.clear();
    _potonganController.clear();
    _cashbackdanaController.clear();
    _admindanaController.clear();
    _diskondanaController.clear();
    _cashbackgopayController.clear();
    _admingopayController.clear();
    _diskongopayController.clear();
    _cashbackovoController.clear();
    _adminovoController.clear();
    _diskonovoController.clear();
  }

  Future createData() async {
    final doc = FirebaseFirestore.instance.collection('HISTORY').doc(
        DateFormat('dd-MM-yyyy - HH:mm:ss').format(DateTime.now()).toString());
    final formatter = NumberFormat.decimalPatternDigits(
      locale: 'id',
    );
    final data = DataInput(
        dana: formatter.format(resultDana).toString(),
        gopay: formatter.format(resultGopay).toString(),
        ovo: formatter.format(resultOvo).toString(),
        date_time: DateFormat('dd-MM-yyyy - HH:mm:ss')
            .format(DateTime.now())
            .toString(),
        user: Constants.currentUser.toString());

    final json = data.toJson();
    await doc.set(json);
  }

  void _rumus() {
    totalHargaDana = (double.parse(_hargaController.text) -
        double.parse(_potonganController.text));

    resultDana = totalHargaDana -
        (double.parse(_cashbackdanaController.text) / totalHargaDana * 100) -
        (double.parse(_diskondanaController.text) / totalHargaDana * 100) +
        (double.parse(_admindanaController.text) / totalHargaDana * 100);
//
    totalHargaGopay = (double.parse(_hargaController.text) -
        double.parse(_potonganController.text));

    resultGopay = totalHargaGopay -
        (double.parse(_cashbackgopayController.text) / totalHargaGopay * 100) -
        (double.parse(_diskongopayController.text) / totalHargaGopay * 100) +
        (double.parse(_admingopayController.text) / totalHargaGopay * 100);
//
    totalHargaOvo = (double.parse(_hargaController.text) -
        double.parse(_potonganController.text));

    resultOvo = totalHargaOvo -
        (double.parse(_cashbackovoController.text) / totalHargaOvo * 100) -
        (double.parse(_diskonovoController.text) / totalHargaOvo * 100) +
        (double.parse(_adminovoController.text) / totalHargaOvo * 100);

    // print(resultDana.toString());
    // print(resultGopay.toString());
    // print(resultOvo.toString());

    print(formatter.format(resultDana));
    print(formatter.format(resultGopay));
    print(formatter.format(resultOvo));

    createData();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailPage(
              dana: formatter.format(resultDana).toString(),
              gopay: formatter.format(resultGopay).toString(),
              ovo: formatter.format(resultOvo).toString())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 10,
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            title: Text(
              "Try Filter",
              style: TextStyle(color: Colors.white),
            )),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _hargaController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        hintText: 'Masukan Harga',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _potonganController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Minimal Potongan',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Metode Dana",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _cashbackdanaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'masukan cash back',
                        suffixIcon: Text('%'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _admindanaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'masukan admin',
                        suffixIcon: Text('%'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _diskondanaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: Text('%'),
                        hintText: 'masukan diskon',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Metode Gopay",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _cashbackgopayController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'masukan cash back',
                        suffixIcon: Text('%'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _admingopayController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'masukan admin',
                        suffixIcon: Text('%'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _diskongopayController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'masukan diskon',
                        suffixIcon: Text('%'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Metode Ovo",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _cashbackovoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'masukan cash back',
                        suffixIcon: Text('%'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _adminovoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'masukan admin',
                        suffixIcon: Text('%'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: _diskonovoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'masukan diskon',
                        // suffixText: '%',
                        // suffix: Text('%'),
                        suffixIcon: Text('%'),
                        isDense: true,

                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _hapusSemuaInputs,
                        child: Text('Batal'),
                      ),
                      ElevatedButton(
                        onPressed: _rumus,
                        child: Text('Simpan'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
