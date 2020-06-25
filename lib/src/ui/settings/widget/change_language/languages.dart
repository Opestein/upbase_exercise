// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class UpbaseLanguages {
  const UpbaseLanguages(this.index, this.label);

  final int index;
  final String label;

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final UpbaseLanguages typedOther = other;
    return index == typedOther.index && label == typedOther.label;
  }

  @override
  int get hashCode => hashValues(index, label);

  @override
  String toString() {
    return '$runtimeType($label)';
  }
}

const List<UpbaseLanguages> kAllUpbaseLanguageValues = <UpbaseLanguages>[
  UpbaseLanguages(0, 'English'),
  UpbaseLanguages(1, 'French'),
  UpbaseLanguages(2, 'Pidgin'),
];
