part of dart_assert;

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

/**
 * Provide a [ObjectAssert].
 */
ObjectAssert assertThisObject(Object o) => new ObjectAssert(o);

/**
 * Fail method when something is not throwned.
 */
failBecauseWasNotThrown(Type type) => throw new AssertionFailed("\nExpected $type to be thrown");

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
      throw new AssertionFailed("\nExpecting:\n $_actual\nto be equal to:\n $other\nbut was not.");
    }
  }  
 
  /**
   * Verifies that the actual value is not equal to the given one.
   */  
  isNotEqualTo(T other) {
    if(_actual == other){
      throw new AssertionFailed("\nExpecting:\n $_actual\nnot to be equal to:\n$other\n.");
    }
  }

  /**
   * Verifies that the actual value is null.
   */
  isNull() {
    if(_actual != null){
      throw new AssertionFailed("\nExpecting null but was:\n$_actual.");
    }
  }

  /**
   * Verifies that the actual value is not null.
   */
  isNotNull() {
    if(_actual == null){
      throw new AssertionFailed("\nExpecting to be not null.");
    }
  }

  /**
   * Verifies that the actual value is the same as the given one.
   */
  isSameAs(T expected) {
    if(!identical(_actual, expected)){
      throw new AssertionFailed("\nExpecting:\n $_actual\n to be same as:\n$expected\n but was not.");
    }
  }
  
  /**
   * Verifies that the actual value is not the same as the given one.
   */
  isNotSameAs(T expected) {
    if(identical(_actual, expected)){
      throw new AssertionFailed("\nExpecting:\n $_actual\n to be same as:\n$expected.");
    }
  }  
  
  /**
   * Verifies that the actual value is present in the given array of values. 
   */
  isIn(Iterable<T> values) {
    if(!values.contains(_actual)){
      throw new AssertionFailed("\nExpecting:\n $_actual\nto be in:\n$values.");
    }
  }

  /**
   * Verifies that the actual value is not present in the given array of values. 
   */  
  isNotIn(Iterable<T> values) {
    if(values.contains(_actual)){
      throw new AssertionFailed("\nExpecting:\n $_actual\nnot to be in:\n$values.");
    }
  }
  
  /**
   * Verifies that the actual valie satisfies a condition. 
   */
  satisfies(bool condition(T value), {String description: "condition"}){
    if(!condition(_actual)){
      throw new AssertionFailed("\nExpecting:\n Dart\nsatisfies $description.");      
    }
  }
  
  /**
   * Verifies that the actual valie satisfies a condition. 
   */
  doesNotSatisfies(bool condition(T value), {String description: "condition"}){
    if(condition(_actual)){
      throw new AssertionFailed("\nExpecting:\n Dart\ndoes not satisfies $description.");      
    }
  }  
  
}

/**
 * Throw when assertion fail.
 */
class AssertionFailed {
  
  String _message;

  AssertionFailed(this._message);
  
  String get message => _message;

  String toString() => _message;  
  
}