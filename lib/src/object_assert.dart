part of dart_assert;

/**
 * Assertion methods for [Object].
 * <p>
 * To create a new instance of this class, invoke [assertThis(Object)].
 * </p>
 * 
 */
class ObjectAssert extends AbstractAssert {
  
    
  ObjectAssert(Object actual) : super(actual);
  
  isEqualTo(Object other) {
    if(_actual != other){
      throw new AssertionFailed("Expecting:\n $_actual\nto be equal to:\n $other\nbut was not.");
    }
  }  
  
  isNotEqualTo(Object other) {
    if(_actual == other){
      throw new AssertionFailed("Expecting:\n $_actual\nnot to be equal to:\n$other\n.");
    }
  }

  isNull() {
    if(_actual != null){
      throw new AssertionFailed("Expecting null but was:\n$_actual.");
    }
  }

  isNotNull() {
    if(_actual == null){
      throw new AssertionFailed("Expecting to be not null.");
    }
  }

  isSameAs(Object expected) {
    if(!identical(_actual, expected)){
      throw new AssertionFailed("Expecting:\n $_actual\n to be same as:\n$expected\n but was not.");
    }
  }
  
  isNotSameAs(Object expected) {
    if(identical(_actual, expected)){
      throw new AssertionFailed("Expecting:\n $_actual\n to be same as:\n$expected");
    }
  }
  
  
}