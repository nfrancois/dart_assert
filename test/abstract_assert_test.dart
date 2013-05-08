part of dart_assert_test;

//Copyright (C) 2013 Nicolas François. All Rights Reserved.

run_equality_test() =>
    group('Equality Test', (){
      test('isEqualTo ok', () {
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isEqualTo("Dart");
      });
      test('isEqualTo ko', () {
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isEqualTo("dart");
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nto be equal to:\n dart\nbut was not.");
        }
      });       
      test('isNotEqualTo ok', () {
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isNotEqualTo("dart");
      });          
      test('isNotEqualTo ok', () {
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isNotEqualTo("dart");
      });    
      test('isNotEqualTo ko', () {
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isNotEqualTo("Dart");
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nnot to be equal to:\nDart\n.");
        }
      }); 
    });

run_nullity_test() =>
    group('Nullity Test', (){
      test('isNull ok', () {
        // Given
        var dummyAssert = new DummyAssert(null);
        
        // Then
        dummyAssert.isNull();        
      });
      test('isNull ko', () {
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.isNull();
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting null but was:\nDart.");
        }
      }); 
      test('isNotNull ok', () {
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.isNotNull();
      });
      test('isNotNull ko', () {
        // Given
        var dummyAssert = new DummyAssert(null);
        
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
      test('isIn ok', () {
        // Given
        var dart = "Dart";
        var dummyAssert = new DummyAssert(dart);
        
        // Then
        dummyAssert.isIn(["Dart","Html5", "Css3"]);
      });   
      test('isIn ko', () {
        // Given
        var dart = "Dart";
        var dummyAssert = new DummyAssert(dart);
        
        // Then
        try {           
          dummyAssert.isIn(["Html5", "Css3"]);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nto be in:\n[Html5, Css3].");
        }      
      });
      test('isNotIn ok', () {
        // Given
        var dart = "Dart";
        var dummyAssert = new DummyAssert(dart);
        
        // Then
        dummyAssert.isNotIn(["Hhtml5", "Css3"]);
      });   
      test('isNotIn ko', () {
        // Given
        var dart = "Dart";
        var dummyAssert = new DummyAssert(dart);
        
        // Then
        try {           
          dummyAssert.isNotIn(["Dart","Html5", "Css3"]);
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nnot to be in:\n[Dart, Html5, Css3].");
        }      
      });  
    });

run_same_test() =>
    group('Same Test', () {
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
          expect(e.message, "\nExpecting:\n Dart\n to be same as:\nDart\n but was not.");
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
          expect(e.message, "\nExpecting:\n Dart\n to be same as:\nDart.");
        }      
      });        
    });

run_conditions_test() =>
    group('Conditions Test', (){
      test('Satifies condition ok',(){
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.satisfies((String word) => word.startsWith("D"));
      });
      test('satifies condition ko',(){
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.satisfies((String word) => word.startsWith("d"));
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nsatisfies condition.");
        }      
      }); 
      test('satifies condition ko with description',(){
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.satisfies((String word) => word.startsWith("d"), description: "Start with 'd'");
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\nsatisfies Start with 'd'.");
        }      
      });  
      
      
      test('doesNotSatifies condition ok',(){
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        dummyAssert.doesNotSatisfies((String word) => word.startsWith("d"));
      });
      test('doesNotSatifies condition ko',(){
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {      
          dummyAssert.doesNotSatisfies((String word) => word.startsWith("D"));
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\ndoes not satisfies condition.");
        }      
      }); 
      test('doesNotSatifies condition ko with description',(){
        // Given
        var dummyAssert = new DummyAssert("Dart");
        
        // Then
        try {
          dummyAssert.doesNotSatisfies((String word) => word.startsWith("D"), description: "Start with 'D'");
          failWithoutAssertionFailed();
        } on AssertionFailed catch(e){
          expect(e.message, "\nExpecting:\n Dart\ndoes not satisfies Start with 'D'.");
        }      
      });  
    });
    
