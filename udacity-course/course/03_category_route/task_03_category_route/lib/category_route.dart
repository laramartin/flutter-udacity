// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:task_03_category_route/category.dart';

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.

    var categories = List<Category>();

    for (var i = 0; i < _baseColors.length; i++) {
      categories.add(Category(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: Icons.cake));
    }

    final listView = ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return categories[index];
      },
    );

    final appBar = AppBar(
      title: new Text(
        'Unit Converter',
        style: TextStyle(fontSize: 30.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.green[100],
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
      backgroundColor: Colors.green[100],
    );
  }
}
