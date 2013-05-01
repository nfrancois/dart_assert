part of dart_assert_test;

run_object_assert_test() =>
  group('ObjectAssert Test',(){
    test('isNotNul ok', () {
      // Given
      var objectAssert = new ObjectAssert("Dart");
      
      // Then
      objectAssert.isNotNull();
    });
    test('isNotNul ko', () {
      // Given
      var objectAssert = new ObjectAssert(null);
      
      // Then
      try {
        objectAssert.isNotNull();
        fail("AssertionFailed not throwed");
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting to be not null.");
      }
    });   
    test('isNul ko', () {
      // Given
      var objectAssert = new ObjectAssert("Dart");
      
      // Then
      try {      
        objectAssert.isNull();
        fail("AssertionFailed not throwed");
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting null but was:\nDart.");
      }
    });  
    test('isEqualTo ok', () {
      // Given
      var objectAssert = new ObjectAssert("Dart");
      // Then
      objectAssert.isEqualTo("Dart");
    });    
    test('isEqualTo ok', () {
      // Given
      var objectAssert = new ObjectAssert("Dart");
      
      objectAssert.isNotEqualTo("dart");
    });    
    test('isNotEqualTo ko', () {
      // Given
      var objectAssert = new ObjectAssert("Dart");
      
      try {      
        objectAssert.isEqualTo("dart");
        fail("AssertionFailed not throwed");
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\nto be equal to:\n dart\nbut was not.");
      }
    }); 
    test('isSameAs ok', () {
      // Given
      var Dart = "Dart";
      var objectAssert = new ObjectAssert(Dart);
      
      // Then
      objectAssert.isSameAs(Dart);
    });    
    test('isSameAs ko', () {
      // Given
      var Dart = "Dart";
      var Dart2 = new String.fromCharCodes("Dart".codeUnits);// equals but not are not same
      var objectAssert = new ObjectAssert(Dart);
      
      // Then
      expect(Dart, Dart2);
      try {           
        objectAssert.isSameAs(Dart2);
        fail("AssertionFailed not throwed");
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\n to be same as:\nDart\n but was not.");
      }      
    });   
    test('isNotSameAs ok', () {
      // Given
      var Dart = "Dart";
      var Dart2 = new String.fromCharCodes("Dart".codeUnits);// equals but not are not same
      var objectAssert = new ObjectAssert(Dart);
      
      // Then
      expect(Dart, Dart2);
      objectAssert.isNotSameAs(Dart2);
    });    
    test('isNotSameAs ko', () {
      // Given
      var Dart = "Dart";
      var objectAssert = new ObjectAssert(Dart);
      
      // Then
      try {           
        objectAssert.isNotSameAs(Dart);
        fail("AssertionFailed not throwed");
      } on AssertionFailed catch(e){
        expect(e.message, "Expecting:\n Dart\n to be same as:\nDart");
      }      
    });     
    
  });
