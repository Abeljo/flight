import 'package:flight/my_globals.dart';
import 'package:flight/ui/process.dart';
import 'package:flutter/material.dart';

class review extends StatefulWidget {
  String from;
  String to;
  String dd;
  String rd;
  String pn;
  String price;
  review(
      {Key? key,
      required this.from,
      required this.to,
      required this.dd,
      required this.rd,
      required this.pn,
      required this.price})
      : super(key: key);

  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Details'),
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 20,
        shadowColor: Colors.white.withOpacity(0.5),
        backgroundColor: greeny,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'Please select Your class',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
            child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                //value: 'Select Your Class',
                hint: Text('Select Your Class'),
                items: classes.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    classchoise = newValue!;
                    slectedSeats = 0;
                  });
                }),
          ),
          const Center(
            child: Text(
              'Slecet Seat Number',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          classchoise.toString() == 'First Class'
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      //value: 'Select Your Class',
                      hint: Text('Select Seat Number'),
                      items: seatnumberA.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          choosenseat = newValue!;
                        });
                      }),
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      //value: 'Select Your Class',
                      hint: Text('Select Seat Number'),
                      items: seatnumberB.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          choosenseat = newValue!;
                        });
                      }),
                ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 315,
            padding: EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Starting Location :   ',
                      style: TextStyle(fontSize: 20, color: greeny),
                    ),
                    Text(widget.from)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Destination :   ',
                        style: TextStyle(fontSize: 20, color: greeny)),
                    Text(widget.to)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Depature Date  : ',
                        style: TextStyle(fontSize: 20, color: greeny)),
                    Text(widget.dd)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Return Date   : ',
                        style: TextStyle(fontSize: 20, color: greeny)),
                    Text(widget.rd)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Plane Number :  ',
                        style: TextStyle(fontSize: 20, color: greeny)),
                    Text(widget.pn)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price for single person:  ',
                        style: TextStyle(fontSize: 20, color: greeny)),
                    Text(widget.price)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Selected Class:  ',
                        style: TextStyle(fontSize: 20, color: greeny)),
                    Text(classchoise)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Seate Numbers:  ',
                        style: TextStyle(fontSize: 20, color: greeny)),
                    Text(choosenseat)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Price:  ',
                        style: TextStyle(fontSize: 20, color: greeny)),
                    Text(mytotal.toString())
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            margin: EdgeInsets.only(top: 180),
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => process(
                            planenum: widget.pn.toString(),
                            dd: widget.dd.toString(),
                            finalprice: mytotal.toString(),
                            fromis: widget.from.toString(),
                            classing: classchoise.toString(),
                            rd: widget.rd.toString(),
                            tois: widget.to.toString(),
                            seatnum: choosenseat.toString())),
                  );
                },
                icon: Icon(Icons.payment),
                label: Text('Process Payment')),
          ),
        ],
      ),
    );
  }
}
