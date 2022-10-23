import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight/ui/auth/interauth.dart';
import 'package:flight/ui/auth/signIn.dart';
import 'package:flight/ui/review.dart';
import 'package:flight/ui/seats.dart';
import 'package:flutter/material.dart';
import 'package:flight/my_globals.dart';

class freeFlight extends StatefulWidget {
  String fromis;
  String tois;
  String rd;
  String dd;
  freeFlight({
    Key? key,
    required this.fromis,
    required this.tois,
    required this.dd,
    required this.rd,
  }) : super(key: key);

  @override
  State<freeFlight> createState() => _freeFlightState();
}

class _freeFlightState extends State<freeFlight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('availables').snapshots(),
        builder: ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];

                ///////////////////////////////////////////////////

                if (widget.fromis.toString() == documentSnapshot['location'] &&
                    widget.tois.toString() == documentSnapshot['destination'] &&
                    widget.rd.toString() == documentSnapshot['RD'] &&
                    widget.dd.toString() == documentSnapshot['DD']) {
                  return Container(
                    decoration: BoxDecoration(
                        color: greeny,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('-CONGRATS Flight FOUND'),
                            Text('--------------------------------------'),
                            Text('Starting Location: ' + widget.fromis),
                            Text('Destination Location: ' + widget.tois),
                            Text(
                                'Depature date is :  ${documentSnapshot['DD']}'),
                            Text('Return date is :  ${documentSnapshot['RD']}'),
                            Text('--------------------------------------'),
                          ],
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => seats(
                                          dd: documentSnapshot['DD'],
                                          from: documentSnapshot['location'],
                                          pn: documentSnapshot['pn'],
                                          to: documentSnapshot['destination'],
                                          rd: documentSnapshot['RD'],
                                          price: documentSnapshot['price'],
                                        )),
                              );
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                            label: Text('Procced'))
                      ],
                    ),
                  );
                }

                ///////////////////////////////////////////////////

                else if ((widget.fromis.toString() ==
                            documentSnapshot['location'] &&
                        widget.tois.toString() ==
                            documentSnapshot['destination']) &&
                    (widget.rd.toString() != documentSnapshot['RD'] ||
                        widget.dd.toString() != documentSnapshot['DD'])) {
                  return Container(
                    decoration: BoxDecoration(
                        color: greeny,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '-No Available at the moment',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '-Available flights in the given citys-',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '--------------------------------------',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Starting Location: ' + widget.fromis,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Destination Location: ' + widget.tois,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Depature date is :  ${documentSnapshot['DD']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Return date is :  ${documentSnapshot['RD']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '--------------------------------------',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              /*  print(documentSnapshot['DD']);
                              print(documentSnapshot['location']);
                              print(documentSnapshot['destination']);
                              print(documentSnapshot['RD']);
                              print(documentSnapshot['price']);
                              print(documentSnapshot['pn']); */
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => seats(
                                        dd: documentSnapshot['DD'],
                                        from: documentSnapshot['location'],
                                        pn: documentSnapshot['pn'],
                                        to: documentSnapshot['destination'],
                                        rd: documentSnapshot['RD'],
                                        price: documentSnapshot['price'])),
                              );

                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => interauth())); */

                              // Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                            label: Text('Procced'))
                      ],
                    ),
                  );
                }

                return Container(
                    height: 0,
                    child: Center(
                      child: Text(
                        'No Data Found',
                      ),
                    ));
              });
        }),
      ),
    );
  }
}
