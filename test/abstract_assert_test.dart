part of dart_assert_test;

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

run_equality_test() =>
    group('Equality Test', (){
      test('isEqualTo success', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isEqualTo("Dart");
      });
      test('isEqualTo success', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isEqualTo("dart");
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nto be equal to:\n dart\nbut was not.");
        }
      });
      test('isEqualTo fails when param is null', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isEqualTo(null);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nparameter is null");
        }
      });      
      test('isNotEqualTo success', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isNotEqualTo("dart");
      });    
      test('isNotEqualTo fails', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isNotEqualTo("Dart");
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nnot to be equal to:\nDart\n.");
        }
      }); 
      test('isNotEqualTo fails when param is null', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isNotEqualTo(null);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nparameter is null");
        }
      });       
    });

run_nullity_test() =>
    group('Nullity Test', (){
      test('isNull success', () {
        // Given
        final dummyAssert = new DummyAssert(null);
        
        // Then
        dummyAssert.isNull();        
      });
      test('isNull fails', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isNull();
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting null but was:\nDart.");
        }
      }); 
      test('isNotNull success', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isNotNull();
      });
      test('isNotNull fails', () {
        // Given
        final dummyAssert = new DummyAssert(null);
        
        // Then
        try {
          dummyAssert.isNotNull();
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting to be not null.");
        }
      });   
    });

run_contains_test() =>
    group('Contains Test ',(){
      test('isIn success', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isIn(["Dart","Html5", "Css3"]);
      });   
      test('isIn fails', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {           
          dummyAssert.isIn(["Html5", "Css3"]);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nto be in:\n[Html5, Css3].");
        }      
      });
      test('isIn fails when param is null', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isIn(null);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nparameter is null");
        }
      });        
      test('isNotIn success', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isNotIn(["Hhtml5", "Css3"]);
      });   
      test('isNotIn fails', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {           
          dummyAssert.isNotIn(["Dart","Html5", "Css3"]);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nnot to be in:\n[Dart, Html5, Css3].");
        }      
      }); 
      test('isNotIn fails when param is null', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isNotIn(null);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nparameter is null");
        }
      });        
    });

run_same_test() =>
    group('Same Test', () {
      test('isSameAs success', () {
        // Given
        final dart = "Dart";
        final dummyAssert = new DummyAssert(dart);
        
        // Then
        dummyAssert.isSameAs(dart);
      });    
      test('isSameAs fails', () {
        // Given
        final dart = "Dart";
        final dart2 = new String.fromCharCodes("Dart".codeUnits);// equals but not are not same
        final dummyAssert = new DummyAssert(dart);
        
        // Then
        expect(dart, dart2);
        try {           
          dummyAssert.isSameAs(dart2);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\n to be same as:\nDart\n but was not.");
        }      
      });
      test('isIn fails when param is null', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isSameAs(null);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nexpected is null");
        }
      });       
      test('isNotSameAs success', () {
        // Given
        final dart = "Dart";
        final dart2 = new String.fromCharCodes(dart.codeUnits);// equals but not are not same
        final dummyAssert = new DummyAssert(dart);
        
        // Then
        expect(dart, dart2);
        dummyAssert.isNotSameAs(dart2);
      });    
      test('isNotSameAs fails', () {
        // Given
        final dart = "Dart";
        final dummyAssert = new DummyAssert(dart);
        
        // Then
        try {           
          dummyAssert.isNotSameAs(dart);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\n to be same as:\nDart.");
        }      
      });
      test('isIn fails when param is null', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isNotSameAs(null);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nexpected is null");
        }
      });      
    });

run_conditions_test() =>
    group('Conditions Test', (){
      test('Satifies condition success',(){
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.satisfies((String word) => word.startsWith("D"));
      });
      test('satifies condition fails',(){
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.satisfies((String word) => word.startsWith("d"));
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nsatisfies condition.");
        }      
      }); 
      test('satifies condition fails with description',(){
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.satisfies((String word) => word.startsWith("d"), description: "Start with 'd'");
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nsatisfies Start with 'd'.");
        }      
      });  
      test('isIn fails when param is null', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.satisfies(null);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\ncondition is null");
        }
      });      
      test('doesNotSatifies condition success',(){
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.doesNotSatisfies((String word) => word.startsWith("d"));
      });
      test('doesNotSatifies condition fails',(){
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.doesNotSatisfies((String word) => word.startsWith("D"));
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\ndoes not satisfies condition.");
        }      
      }); 
      test('doesNotSatifies condition fails with description',(){
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {
          dummyAssert.doesNotSatisfies((String word) => word.startsWith("D"), description: "Start with 'D'");
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\ndoes not satisfies Start with 'D'.");
        }      
      });
      test('isIn fails when param is null', () {
        // Given
        final dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.doesNotSatisfies(null);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\ncondition is null");
        }
      }); 
    });
    
