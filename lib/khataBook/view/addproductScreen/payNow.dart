import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rojmel/khataBook/controller/homeController.dart';
import 'package:rojmel/khataBook/controller/prodController.dart';
import 'package:rojmel/khataBook/utils/dataBase.dart';
import 'package:rojmel/khataBook/view/customerScreen.dart';

class PayNowScreen extends StatefulWidget {
  const PayNowScreen({Key? key}) : super(key: key);

  @override
  State<PayNowScreen> createState() => _PayNowScreenState();
}

class _PayNowScreenState extends State<PayNowScreen> {
  TextEditingController _txtname = TextEditingController();
  TextEditingController _txtqa = TextEditingController();
  TextEditingController _txtprice = TextEditingController();
  TextEditingController _txtpurdate = TextEditingController();
  String? price;

  Mydb _pdb = Mydb();
  HomeController _controller = Get.put(HomeController());
  ProdController prodController = Get.put(ProdController());

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    prodController.Prodlist.value = await _pdb.readData();
    print(_controller.Cuslist);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.off(CustomerInfo());
              },
              icon: Icon(Icons.arrow_back)),
          primary: false,
          toolbarHeight: 65,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            margin: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade900),
          ),
          elevation: 00,
          centerTitle: true,
          title: Text('Paynow'),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    _txtpurdate.clear();
                    _txtname.clear();
                    _txtprice.clear();
                    _txtqa.clear();
                  },
                  icon: Icon(Icons.restart_alt)),
            )
          ],
        ),
        body: WillPopScope(
          onWillPop: dialog,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Column(
                  children: [
                    Text(
                      'Enter Product Details',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _txtname,
                      cursorColor: Color(0xff000000),
                      style: TextStyle(color: Color(0xff000000)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.propane_tank_outlined,
                          color: Color(0xff919191),
                        ),
                        hintStyle: TextStyle(color: Color(0xff919191)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter Product Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _txtqa,
                      cursorColor: Color(0xff000000),
                      style: TextStyle(color: Color(0xff000000)),
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.production_quantity_limits,
                          color: Color(0xff919191),
                        ),
                        focusColor: Color(0xff000000),
                        fillColor: Color(0xff000000),
                        hintStyle: TextStyle(color: Color(0xff919191)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter Quantity',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: _txtprice,
                      cursorColor: Color(0xff000000),
                      style: TextStyle(color: Color(0xff000000)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.currency_rupee,
                          color: Color(0xff919191),
                        ),
                        hintStyle: TextStyle(color: Color(0xff919191)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter Price',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      readOnly: true,
                      onTap: () {
                        datepick();
                      },
                      controller: _txtpurdate,
                      cursorColor: Color(0xff000000),
                      style: TextStyle(color: Color(0xff000000)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.date_range_sharp,
                          color: Color(0xff919191),
                        ),
                        focusColor: Color(0xff000000),
                        fillColor: Color(0xff000000),
                        hintStyle: TextStyle(color: Color(0xff919191)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Enter Purchase Date',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff000000)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.40,
                                MediaQuery.of(context).size.height * 0.06)),
                        onPressed: () {
                         
                          _pdb.ProinsertData(
                              _txtname.text,
                              _txtqa.text,
                              _txtprice.text,
                              _txtpurdate.text,
                              int.parse(_controller.dataModal!.id!),
                              1);
                          getdata();
                          _txtpurdate.clear();
                          _txtname.clear();
                          _txtprice.clear();
                          _txtqa.clear();

                          Get.off(CustomerInfo());


                          Get.snackbar('Product Data Added Sucessfully',
                              'You Can Pay Now',
                              duration: Duration(seconds: 1));
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> dialog() async {
    back();
    return await false;
  }

  void back() {
    Get.off(CustomerInfo());
  }

  void datepick() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //get today's date
      firstDate: DateTime(2020),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2999),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue.shade900, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        _txtpurdate = TextEditingController(text: "$formattedDate");
      });
    } else {
      print("Date is not selected");
    }
  }
}
