library dart_assert_test;

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

import 'package:unittest/unittest.dart';
import 'package:dart_assert/dart_assert.dart';

part 'abstract_assert_test.dart';
part 'failure_test.dart';

main(){
  run_contains_test();
  run_same_test();
  run_equality_test();
  run_nullity_test();
  run_conditions_test();
  run_failure_test();
}

failWithoutAssertionFailed() => fail("AssertionFailed not throwed");

// A very simple assert class
class DummyAssert extends AbstractAssert<String> {
  
  DummyAssert(actual) : super(actual);
  
}