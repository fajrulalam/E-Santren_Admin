import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void kesehatanDetail_BS(BuildContext context, String nama, String id,
    {String? keluhan,
    String? keterangan,
    String? dirawatDi,
    bool? sudahPeriksa,
    String? periksaDi,
    int? suhuTubuh,
    String? tensi,
    String? diagnosa,
    String? preskripsi}) {
  bool isCheckboxChecked = false;
  if (sudahPeriksa != null) {
    isCheckboxChecked = sudahPeriksa;
  }

  String selectedValue = "";

  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          id,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              color: Colors.black38),
                        ),
                        Text(
                          nama,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: keluhan,
                        decoration: InputDecoration(
                          labelText: 'Inti Keluhan',
                          helperText: "mis: Demam, radang, diare",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        initialValue: dirawatDi,
                        decoration: InputDecoration(
                          labelText: "Dirawat di",
                          helperText: "mis: Demam, radang, diare",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: keterangan,
                  decoration: InputDecoration(
                    labelText: "Keterangan tambahan",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sudah periksa",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    Checkbox(
                      value: isCheckboxChecked,
                      onChanged: (isChecked) {
                        setState(() {
                          isCheckboxChecked = isChecked!;
                        });
                      },
                    ),
                  ],
                ),
                if (isCheckboxChecked)
                  DottedBorder(
                    color: Colors.grey,
                    strokeWidth: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            initialValue: periksaDi,
                            decoration: InputDecoration(
                              labelText: "Diperiksa oleh/di",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  initialValue: suhuTubuh != null
                                      ? suhuTubuh.toString()
                                      : null,
                                  decoration: InputDecoration(
                                    labelText: "Suhu tubuh (°C)",
                                    suffixText: '°C',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: TextFormField(
                                  initialValue: tensi,
                                  decoration: InputDecoration(
                                    labelText: "Tensi (mm/Hg)",
                                    suffixText: 'mm/Hg',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            initialValue: diagnosa,
                            decoration: InputDecoration(
                              labelText: "Diagnosa",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            maxLines: 1,
                            initialValue: preskripsi,
                            decoration: InputDecoration(
                              labelText: "Preskripsi",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Add logic to save data and dismiss bottom sheet
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}
