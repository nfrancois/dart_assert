part of dart_assert;

/**
 * Provide a [ObjectAssert].
 */
ObjectAssert assertThisObject(Object o) => new ObjectAssert(o);

/**
 * Fail method when something is not throwned.
 */
failBecauseWasNotThrown(Type type) => throw new AssertionFailed("Expected $type to be thrown");

/**
 * Base class for all assertions.
 * 
 */
abstract class AbstractAssert<T> {
  
  T _actual;
  
  AbstractAssert(this._actual);
  
  /**
   * Verifies that the actual value is equal to the given one.
   */
  isEqualTo(T other) {
    if(_actual != other){
      throw new AssertionFailed("Expecting:\n $_actual\nto be equal to:\n $other\nbut was not.");
    }
  }  
 
  /**
   * Verifies that the actual value is not equal to the given one.
   */  
  isNotEqualTo(T other) {
    if(_actual == other){
      throw new AssertionFailed("Expecting:\n $_actual\nnot to be equal to:\n$other\n.");
    }
  }

  /**
   * Verifies that the actual value is null.
   */
  isNull() {
    if(_actual != null){
      throw new AssertionFailed("Expecting null but was:\n$_actual.");
    }
  }

  /**
   * Verifies that the actual value is not null.
   */
  isNotNull() {
    if(_actual == null){
      throw new AssertionFailed("Expecting to be not null.");
    }
  }

  /**
   * Verifies that the actual value is the same as the given one.
   */
  isSameAs(T expected) {
    if(!identical(_actual, expected)){
      throw new AssertionFailed("Expecting:\n $_actual\n to be same as:\n$expected\n but was not.");
    }
  }
  
  /**
   * Verifies that the actual value is not the same as the given one.
   */
  isNotSameAs(T expected) {
    if(identical(_actual, expected)){
      throw new AssertionFailed("Expecting:\n $_actual\n to be same as:\n$expected");
    }
  }  
  
}

/**
 * Throw when assertion fail.
 */
class AssertionFailed {
  
  String _message;

  AssertionFailed(this._message);
  
  get message => _message;

  String toString() => _message;  
  
}