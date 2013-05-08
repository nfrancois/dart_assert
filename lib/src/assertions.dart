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
   * Throws [AssertionFailed] when [other] is null
   * Throws [AssertionFailed] when actual is not equals to given one
   */
  isEqualTo(T other) {
    _checkNotNull(other, _PARAMETER_DESC);
    if(_actual != other){
      throw new AssertionFailed("\nExpecting:\n $_actual\nto be equal to:\n $other\nbut was not.");
    }
  }  
 
  /**
   * Verifies that the actual value is not equal to the given one.
   * Throws [AssertionFailed] when [other] is null
   * Throws [AssertionFailed] when actual is equals to given one
   */  
  isNotEqualTo(T other) {
    _checkNotNull(other, _PARAMETER_DESC);
    if(_actual == other){
      throw new AssertionFailed("\nExpecting:\n $_actual\nnot to be equal to:\n$other\n.");
    }
  }

  /**
   * Verifies that the actual value is null.
   * Throws [AssertionFailed] when actual is not null
   */
  isNull() {
    if(_actual != null){
      throw new AssertionFailed("\nExpecting null but was:\n$_actual.");
    }
  }

  /**
   * Verifies that the actual value is not null.
   * Throws [AssertionFailed] when actual is null
   */
  isNotNull() {
    if(_actual == null){
      throw new AssertionFailed("\nExpecting to be not null.");
    }
  }

  /**
   * Verifies that the actual value is the same as the given one.
   * Throws [AssertionFailed] when [expected] is null
   * Throws [AssertionFailed] when actual is not same as given one
   */
  isSameAs(T expected) {
    _checkNotNull(expected, _EXPECTED_DESC);
    if(!identical(_actual, expected)){
      throw new AssertionFailed("\nExpecting:\n $_actual\n to be same as:\n$expected\n but was not.");
    }
  }
  
  /**
   * Verifies that the actual value is not the same as the given one.
   * Throws [AssertionFailed] when [expected] is null
   * Throws [AssertionFailed] when actual same as given one
   */
  isNotSameAs(T expected) {
    _checkNotNull(expected, _EXPECTED_DESC);
    if(identical(_actual, expected)){
      throw new AssertionFailed("\nExpecting:\n $_actual\n to be same as:\n$expected.");
    }
  }  
  
  /**
   * Verifies that the actual value is present in the given array of values.
   * Throws [AssertionFailed] when [values] are null
   * Throws [AssertionFailed] when actual is not in [values]
   */
  isIn(Iterable<T> values) {
    _checkNotNull(values, _PARAMETER_DESC);
    if(!values.contains(_actual)){
      throw new AssertionFailed("\nExpecting:\n $_actual\nto be in:\n$values.");
    }
  }

  /**
   * Verifies that the actual value is not present in the given array of values. 
   * Throws [AssertionFailed] when [values] are null
   * Throws [AssertionFailed] when actual is in [values]
   */  
  isNotIn(Iterable<T> values) {
    _checkNotNull(values, _PARAMETER_DESC);
    if(values.contains(_actual)){
      throw new AssertionFailed("\nExpecting:\n $_actual\nnot to be in:\n$values.");
    }
  }
  
  /**
   * Verifies that the actual valie satisfies a condition.
   * Throws [AssertionFailed] when [condition] is null
   * Throws [AssertionFailed] when actual does not satifies condition
   */
  satisfies(Condition condition, {String description: "condition"}){
    _checkNotNull(condition, _CONDITION_DESC);
    if(!condition(_actual)){
      throw new AssertionFailed("\nExpecting:\n Dart\nsatisfies $description.");      
    }
  }
  
  /**
   * Verifies that the actual valie satisfies a condition. 
   * Throws [AssertionFailed] when [condition] is null
   * Throws [AssertionFailed] when actual does not satifies condition
   */
  doesNotSatisfies(Condition condition, {String description: "condition"}){
    _checkNotNull(condition, _CONDITION_DESC);
    if(condition(_actual)){
      throw new AssertionFailed("\nExpecting:\n Dart\ndoes not satisfies $description.");      
    }
  }  
  
}

typedef bool Condition(dynamic value);

/**
 * Throw when assertion fail.
 */
class AssertionFailed {
  
  String _message;

  AssertionFailed(this._message);
  
  String get message => _message;

  String toString() => _message;  
  
}

const _PARAMETER_DESC = "parameter";
const _EXPECTED_DESC = "expected";
const _CONDITION_DESC = "condition";

/**
 * Check parameter is not null.
 */
_checkNotNull(Object parameter, String description){
  if(parameter == null){
    throw new AssertionFailed("\n$description is null");    
  }
}