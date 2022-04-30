import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uts/widgets.dart';

// models
import '../models/keranjang_model.dart';

class BeliSekarang extends StatefulWidget {
  final image;
  final nama;
  final harga;

  const BeliSekarang({
    Key? key,
    required this.image,
    required this.nama,
    required this.harga,
  }) : super(key: key);

  @override
  State<BeliSekarang> createState() => _BeliSekarangState();
}

class _BeliSekarangState extends State<BeliSekarang> {
  int _currentStep = 0;

  TextEditingController _alamatController = TextEditingController();
  TextEditingController _namaController = TextEditingController();

  TextEditingController _creditNumber = TextEditingController();

  bool _selected = false;
  String? _radioValue;

  bool _isNamaValidated = false;
  bool _isAlamatValidated = false;
  bool _isKreditValidated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beli Sekarang"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          onStepTapped: (val) {
            setState(() {
              _currentStep = val;
            });
          },
          currentStep: _currentStep,
          elevation: 0,
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_currentStep < 2 &&
                _namaController.text.isNotEmpty &&
                _alamatController.text.isNotEmpty &&
                _creditNumber.text.isNotEmpty) {
              setState(() {
                _isAlamatValidated = true;
                _isNamaValidated = true;
                _isKreditValidated = true;
                _currentStep++;
              });
            } else if (_namaController.text.isEmpty) {
              _isNamaValidated = false;
            } else if (_alamatController.text.isEmpty) {
              _isAlamatValidated = false;
            } else if (_creditNumber.text.isEmpty) {
              _isKreditValidated = false;
            }
          },
          steps: [
            // Data Diri
            Step(
              title: Text("Data Diri dan Alamat"),
              content: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(.2),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    BNTextField(
                      controller: _namaController,
                      label: "Nama Penerima",
                      errorText: _isNamaValidated == false
                          ? "Tidak Boleh Kosong"
                          : null,
                    ),
                    BNTextField(
                      controller: _alamatController,
                      label: "Alamat",
                      errorText: _isNamaValidated == false
                          ? "Tidak Boleh Kosong"
                          : null,
                    ),
                  ],
                ),
              ),
              isActive: _currentStep == 0 ? true : false,
            ),

            // Pembayaran
            Step(
              title: Text("Pembayaran"),
              content: Column(
                children: [
                  Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(.25),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.25),
                            blurRadius: 8,
                          )
                        ]),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildListTile(
                            "MasterCard",
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/800px-MasterCard_Logo.svg.png",
                          ),
                          _buildListTile(
                            "BCA",
                            "https://cdn.iconscout.com/icon/free/png-256/bca-225544.png",
                          ),
                          _buildListTile(
                            "VISA",
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/1200px-Visa_Inc._logo.svg.png",
                          ),
                          _buildListTile(
                            "Mandiri",
                            "https://cdn3.iconfinder.com/data/icons/banks-in-indonesia-logo-badge/100/Mandiri-512.png",
                          ),
                          _buildListTile(
                            "BNI",
                            "https://cdn3.iconfinder.com/data/icons/banks-in-indonesia-logo-badge/100/BNI-512.png",
                          ),
                          _buildListTile(
                            "BRI",
                            "https://cdn3.iconfinder.com/data/icons/banks-in-indonesia-logo-badge/100/BRI-512.png",
                          ),
                          _buildListTile(
                            "Danamon",
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Danamon.svg/1200px-Danamon.svg.png",
                          ),
                          _buildListTile(
                            "MayBank",
                            "https://cdn.iconscout.com/icon/free/png-256/maybank-283362.png",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  BNTextField(
                    controller: _creditNumber,
                    label: _radioValue != null
                        ? "Masukkan Kartu Kredit $_radioValue Anda"
                        : "Silahkan Pilih Kartu Kredit",
                    border: OutlineInputBorder(),
                    keyBoardType: TextInputType.number,
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    errorText: _isKreditValidated == false
                        ? "Tidak Boleh Kosong"
                        : null,
                    enabled: _radioValue != null ? true : false,
                  ),
                ],
              ),
              isActive: _currentStep == 1 ? true : false,
            ),

            // Result
            Step(
              title: Text("Konfirmasi"),
              content: _buildResult(),
              isActive: _currentStep == 2 ? true : false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
    String text,
    String image,
  ) {
    return BNRadioLT(
      title: Row(children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Image.network(
          image,
          width: 40,
        ),
      ]),
      value: text,
      grupValue: _radioValue,
      onChanged: (val) {
        setState(() {
          _radioValue = val;
        });
      },
      selected: _radioValue == text ? true : false,
    );
  }

  Widget _buildResult() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black.withOpacity(.25)),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 8,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text("Nama Barang:"),
            trailing: Container(
              width: 150,
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  widget.nama,
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Harga Barang:"),
            trailing: Text(widget.harga),
          ),
          Divider(),
          ListTile(
            title: Text("Nama Penerima:"),
            trailing: _namaController.text.isNotEmpty
                ? Text(_namaController.text)
                : Text("-"),
          ),
          ListTile(
            title: Text("Alamat:"),
            trailing: _alamatController.text.isNotEmpty
                ? Text(_namaController.text)
                : Text("-"),
          ),
          ListTile(
            title: Text("Pembayaran:"),
            trailing:
                _radioValue != null ? Text(_radioValue.toString()) : Text("-"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (!_isAlamatValidated && !_isNamaValidated) {
                    setState(() {
                      _currentStep = 0;
                    });
                  } else {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          alignment: Alignment.center,
                          height: 300,
                          color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pembelian Berhasil",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Terima Kasih",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                child: Text(
                  "Bayar",
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Batal",
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.black.withOpacity(.5)),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 8,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
