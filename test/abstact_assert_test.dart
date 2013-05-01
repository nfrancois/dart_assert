part of dart_assert_test;

// A very simple assert class
class DummyAssert extends AbstractAssert<String> {
  
  DummyAssert(actual) : super(actual);
  
}

run_object_assert_test() =>
  group('DummyAssert Test',(){
    test('isNotNul ok', () {
      // Given
      var DummyAssert = new DummyAssert("Dart");
      
      // Then
      DummyAssert.isNotNull();
    });
    test('isNotNul ko', () {
      // Given
      var DummyAssert = new DummyAssert(null);
      
      // Then
      try {
        DummyAssert.isNotNull();
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting to be not null.");
      }
    });   
    test('isNul ko', () {
      // Given
      var DummyAssert = new DummyAssert("Dart");
      
      // Then
      try {      
        DummyAssert.isNull();
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting null but was:\nDart.");
      }
    });  
    test('isEqualTo ok', () {
      // Given
      var DummyAssert = new DummyAssert("Dart");
      // Then
      DummyAssert.isEqualTo("Dart");
    });    
    test('isEqualTo ok', () {
      // Given
      var DummyAssert = new DummyAssert("Dart");
      
      DummyAssert.isNotEqualTo("dart");
    });    
    test('isNotEqualTo ko', () {
      // Given
      var DummyAssert = new DummyAssert("Dart");
      
      try {      
        DummyAssert.isEqualTo("dart");
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\nto be equal to:\n dart\nbut was not.");
      }
    }); 
    test('isSameAs ok', () {
      // Given
      var Dart = "Dart";
      var DummyAssert = new DummyAssert(Dart);
      
      // Then
      DummyAssert.isSameAs(Dart);
    });    
    test('isSameAs ko', () {
      // Given
      var Dart = "Dart";
      var Dart2 = new String.fromCharCodes("Dart".codeUnits);// equals but not are not same
      var DummyAssert = new DummyAssert(Dart);
      
      // Then
      expect(Dart, Dart2);
      try {           
        DummyAssert.isSameAs(Dart2);
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\n to be same as:\nDart\n but was not.");
      }      
    });   
    test('isNotSameAs ok', () {
      // Given
      var Dart = "Dart";
      var Dart2 = new String.fromCharCodes("Dart".codeUnits);// equals but not are not same
      var DummyAssert = new DummyAssert(Dart);
      
      // Then
      expect(Dart, Dart2);
      DummyAssert.isNotSameAs(Dart2);
    });    
    test('isNotSameAs ko', () {
      // Given
      var Dart = "Dart";
      var DummyAssert = new DummyAssert(Dart);
      
      // Then
      try {           
        DummyAssert.isNotSameAs(Dart);
        failWithoutAssertionFailed();
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\n to be same as:\nDart");
      }      
    });     
    
  });
