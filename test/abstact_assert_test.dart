part of dart_assert_test;

// A very simple assert class
class DummyAssert extends AbstractAssert<String> {
  
  DummyAssert(actual) : super(actual);
  
}

run_object_assert_test() =>
  group('DummyAssert Test',(){
    test('isNotNul ok', () {
      // Given
      var dummyAssert = new DummyAssert("Dart");
      
      // Then
      dummyAssert.isNotNull();
    });
    test('isNotNul ko', () {
      // Given
      var dummyAssert = new DummyAssert(null);
      
      // Then
      try {
        dummyAssert.isNotNull();
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting to be not null.");
      }
    });   
    test('isNul ko', () {
      // Given
      var dummyAssert = new DummyAssert("Dart");
      
      // Then
      try {      
        dummyAssert.isNull();
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting null but was:\nDart.");
      }
    });  
    test('isEqualTo ok', () {
      // Given
      var dummyAssert = new DummyAssert("Dart");
      // Then
      dummyAssert.isEqualTo("Dart");
    });    
    test('isEqualTo ok', () {
      // Given
      var dummyAssert = new DummyAssert("Dart");
      
      dummyAssert.isNotEqualTo("dart");
    });    
    test('isNotEqualTo ko', () {
      // Given
      var dummyAssert = new DummyAssert("Dart");
      
      try {      
        dummyAssert.isEqualTo("dart");
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\nto be equal to:\n dart\nbut was not.");
      }
    }); 
    test('isSameAs ok', () {
      // Given
      var dart = "Dart";
      var dummyAssert = new DummyAssert(dart);
      
      // Then
      dummyAssert.isSameAs(dart);
    });    
    test('isSameAs ko', () {
      // Given
      var dart = "Dart";
      var dart2 = new String.fromCharCodes("Dart".codeUnits);// equals but not are not same
      var dummyAssert = new DummyAssert(dart);
      
      // Then
      expect(dart, dart2);
      try {           
        dummyAssert.isSameAs(dart2);
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\n to be same as:\nDart\n but was not.");
      }      
    });   
    test('isNotSameAs ok', () {
      // Given
      var dart = "Dart";
      var dart2 = new String.fromCharCodes(dart.codeUnits);// equals but not are not same
      var dummyAssert = new DummyAssert(dart);
      
      // Then
      expect(dart, dart2);
      dummyAssert.isNotSameAs(dart2);
    });    
    test('isNotSameAs ko', () {
      // Given
      var dart = "Dart";
      var dummyAssert = new DummyAssert(dart);
      
      // Then
      try {           
        dummyAssert.isNotSameAs(dart);
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\n to be same as:\nDart");
      }      
    });  
    
  });
