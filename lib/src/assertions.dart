part of dart_assert;

ObjectAssert assertThisObject(Object o) => new ObjectAssert(o);

failBecauseWasNotThrown(Type type) => throw new AssertionFailed("Expected $type to be thrown");

/**
 * Base class for all assertions.
 * 
 */
abstract class AbstractAssert<T> {
  
  T _actual;
  
  AbstractAssert(this._actual);
  
  isEqualTo(T other) {
    if(_actual != other){
      throw new AssertionFailed("Expecting:\n $_actual\nto be equal to:\n $other\nbut was not.");
    }
  }  
  
  isNotEqualTo(T other) {
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

  isSameAs(T expected) {
    if(!identical(_actual, expected)){
      throw new AssertionFailed("Expecting:\n $_actual\n to be same as:\n$expected\n but was not.");
    }
  }
  
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