import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int stringToInt(String string) {
  // string to integer
  return int.parse(string);
}

int redondearMas(double number) {
  // round number to next int
  return number.ceil();
}

String uuid() {
  // get a uuid
  var rng = math.Random();
  var codeUnits = List.generate(16, (index) {
    final value = rng.nextInt(255);
    if (index == 6) {
      return value & 0x0f | 0x40;
    } else if (index == 8) {
      return value & 0x3f | 0x80;
    } else {
      return value;
    }
  });

  return List.generate(16, (index) {
    final byte = codeUnits[index];
    final hex = byte.toRadixString(16);
    return hex.padLeft(2, '0');
  }).join();
}

bool buscar(
  String buscarEn,
  String buscarPor,
) {
  return buscarEn.toLowerCase().contains(buscarPor.toLowerCase());
}
