// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class UpbaseTextScaleValue {
  const UpbaseTextScaleValue(this.scale, this.label);

  final double scale;
  final String label;

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final UpbaseTextScaleValue typedOther = other;
    return scale == typedOther.scale && label == typedOther.label;
  }

  @override
  int get hashCode => hashValues(scale, label);

  @override
  String toString() {
    return '$runtimeType($label)';
  }
}

const List<UpbaseTextScaleValue> kAllUpbaseTextScaleValues =
    <UpbaseTextScaleValue>[
  UpbaseTextScaleValue(null, 'System Default'),
  UpbaseTextScaleValue(0.8, 'Small'),
  UpbaseTextScaleValue(1.0, 'Normal'),
  UpbaseTextScaleValue(1.2, 'Large'),
//  TimbalaTextScaleValue(2.0, 'Huge'),
];
