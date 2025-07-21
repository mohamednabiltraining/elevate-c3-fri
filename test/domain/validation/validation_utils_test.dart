import 'package:c3_offline/domain/validation/validation_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  // isValid email test
  // when call then expected result
  group("test isValidEmail", (){
    test("when call isValidEmail with valid it should return true", (){
      // test here
      // Arrange // prepare test data
      var email = "mohamed@Elevate.com";
      // Act // call the method
      ValidationUtils validationUtils = ValidationUtils();
      var actualResult = validationUtils.isValidEmail(email);
      // Assert // check the result
      expect(actualResult, isTrue);

    });
    test("when call isValid with email without @ it should return false", (){
      // Arrange
      var email = "mohamedElevate.com";
      // Act
      ValidationUtils validationUtils = ValidationUtils();
      var actualResult = validationUtils.isValidEmail(email);
      // Assert
      expect(actualResult, isFalse);
    });
    test("when call isValid with email without dot it should return false", (){
      // Arrange
      var email = "mohamedElevate@com";
      // Act
      ValidationUtils validationUtils = ValidationUtils();
      var actualResult = validationUtils.isValidEmail(email);
      // Assert
      expect(actualResult, isFalse);
    });
    test("when call isValid with wrong formatted email it should return false", (){
      // Arrange
      var email = "mohamed.Elevate@com";
      // Act
      ValidationUtils validationUtils = ValidationUtils();
      var actualResult = validationUtils.isValidEmail(email);
      // Assert
      expect(actualResult, isFalse);
    });
    test("when call isValid with Nullable email it should return false", (){
      // Arrange
      var email = null;
      // Act
      ValidationUtils validationUtils = ValidationUtils();
      var actualResult = validationUtils.isValidEmail(email);
      // Assert
      expect(actualResult, isFalse);
    });
    test("when call isValid with empty email it should return false", (){
      // Arrange
      var email = "";
      // Act
      ValidationUtils validationUtils = ValidationUtils();
      var actualResult = validationUtils.isValidEmail(email);
      // Assert
      expect(actualResult, isFalse);
    });
    test("when call isValid with @. only email it should return false", (){
      // Arrange
      var email = "@.";
      // Act
      ValidationUtils validationUtils = ValidationUtils();
      var actualResult = validationUtils.isValidEmail(email);
      // Assert
      expect(actualResult, isFalse);
    });
    test("when call isValid with Special character in email it should return false", (){
      // Arrange
      var email = "mohamed@Elevate!com";
      // Act
      ValidationUtils validationUtils = ValidationUtils();
      var actualResult = validationUtils.isValidEmail(email);
      // Assert
      expect(actualResult, isFalse);
    });
  });


  group("test isValidPassword", (){

  });

}