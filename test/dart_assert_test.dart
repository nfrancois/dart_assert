library dart_assert_test;

import 'package:unittest/unittest.dart';
import 'package:dart_assert/dart_assert.dart';

part 'abstact_assert_test.dart';
part 'failure_test.dart';

main(){
  run_object_assert_test();
  run_failure_test();
}

failWithoutAssertionFailed() => fail("AssertionFailed not throwed");