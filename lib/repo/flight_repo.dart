import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FlightRepo {
  final _flights = FirebaseFirestore.instance.collection('flights');

  Future<void> create({
    required String from,
    required String to,
    required String depature,
    required String returndate,
    required String planenum,
    required String seatnum,
    required String pricepaid,
    required String classing,
    required String mail,
  }) async {
    try {
      await _flights.add({
        'mail': mail,
        'from': from,
        'to': to,
        'depature': depature,
        'return': returndate,
        'planenumber': planenum,
        'seats': seatnum,
        'paidprice': pricepaid,
        'class': classing
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Faild with error: '${e.code}' ");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
