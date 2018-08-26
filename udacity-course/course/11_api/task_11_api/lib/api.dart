// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'unit.dart';


/// The REST API retrieves unit conversions for [Categories] that change.
///
/// For example, the currency exchange rate, stock prices, the height of the
/// tides change often.
/// We have set up an API that retrieves a list of currencies and their current
/// exchange rate (mock data).
///   GET /currency: get a list of currencies
///   GET /currency/convert: get conversion from one currency amount to another
class Api {
  // https://flutter.udacity.com/currency

  /// Gets all the units and conversion rates for a given category.
  ///
  /// The `category` parameter is the name of the [Category] from which to
  /// retrieve units. We pass this into the query parameter in the API call.
  ///
  /// Returns a list. Returns null on error.

  final String _url = "flutter.udacity.com";
  final HttpClient _httpClient = HttpClient();

  Future<List<Unit>> getUnits(String category) async {
    String path = "/$category".toLowerCase();
    Uri uri = Uri.https(_url, path);
    Map<String, dynamic> data;
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode == 200) {
        String jsonResponse = await httpResponse.transform(utf8.decoder).join();

        // hashMap with key "units" and value list of units
        data = json.decode(jsonResponse);

        print(_url + path);
        print(data);
      }
    } catch (e) {
      log("Error retrieving and parsing json getting units: " + e.toString());
      return null;
    }
    return data["units"].map<Unit>((dynamic unit) => Unit.fromJson(unit)).toList();
  }

  /// Given two units, converts from one to another.
  ///
  /// Returns a double, which is the converted amount. Returns null on error.
  ///
  /// https://flutter.udacity.com/currency/convert?from=US Dollar&to=Gold Bar&amount=500.0
  /// this returns {"status":"ok","conversion":0.4022439422705965}
  Future<double> convert(
      String category, Unit fromUnit, Unit toUnit, double amount) async {
    var uri = Uri.https(_url, '/$category/convert'.toLowerCase(),
        {'amount': amount.toString(), 'from': fromUnit.name, 'to': toUnit.name});
    var conversion;
    print(uri.toString());
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode == 200) {
        var jsonResponse = await httpResponse.transform(utf8.decoder).join();

        conversion = json.decode(jsonResponse);
        print(conversion);
      }
      return conversion["conversion"];
    } catch (e) {
      log("Error fetching parsing conversion: " + e.toString());
      return null;
    }
  }
}
