part of dart_assert_test;

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

class UnbelievableError {}

run_failure_test(){
  test('failWhenException', (){
    try {
      failBecauseWasNotThrown(UnbelievableError);
      failWithoutAssertionFailed();
    } on AssertionFailed catch(e){
      expect(e.message, "Expected UnbelievableError to be thrown");
    }
  });
}