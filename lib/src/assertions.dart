part of dart_assert;

ObjectAssert assertThisObject(Object o) => new ObjectAssert(o);

/**
 * Base class for all assertions.
 * 
 */
abstract class AbstractAssert {
  
  Object _actual;
  
  AbstractAssert(this._actual);  
  
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