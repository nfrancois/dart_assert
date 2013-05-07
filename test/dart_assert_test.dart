library dart_assert_test;

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

import 'package:unittest/unittest.dart';
import 'package:dart_assert/dart_assert.dart';

part 'abstract_assert_test.dart';
part 'failure_test.dart';

main(){
  run_object_assert_test();
  run_failure_test();
}

failWithoutAssertionFailed() => fail("AssertionFailed not throwed");