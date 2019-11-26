
import 'package:flutter/services.dart';

abstract class StringValidator{
  bool isValid(String value);
}

class RegexValidator implements StringValidator{
  RegexValidator({this.regexSource});
  final String regexSource;

  @override
  bool isValid(String value) {
    try{
      final RegExp regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value);
      for(Match match in matches){
        if(match.start == 0 && match.end == value.length){
          return true;
        }
      }
      return false;
    }catch(e){
      assert(false, e.toString());
      return true;
    } 
  }
}

class ValidatorInpuFormatter implements TextInputFormatter{
  ValidatorInpuFormatter({this.editingValidator});

  final StringValidator editingValidator;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final bool oldValueValid = editingValidator.isValid(oldValue.text);
    final bool newValueValid = editingValidator.isValid(newValue.text);
    if (oldValueValid && !newValueValid){
      return oldValue;
    }
    return newValue;
  } 
}

class EmailEditingRegexValidator extends RegexValidator{
  EmailEditingRegexValidator(): super(regexSource: '^(|\\S)+\$');
}

class EmailSubmitRexValidator extends RegexValidator{
  EmailSubmitRexValidator(): super(regexSource: '^\\S+@\\S+\\.\\S+\$');
}

class NonEmptyStringValidator extends StringValidator{
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}
class MinLengthStringValidator extends StringValidator{
  MinLengthStringValidator(this.minLength);
  final int minLength;

  @override
  bool isValid(String value) {
    return value.length >= minLength;
  }
}

class EmailAndPasswordValidators{
  final TextInputFormatter emailInputFormatter =
  ValidatorInpuFormatter(editingValidator: EmailSubmitRexValidator());
  final StringValidator emailSubmitValidator = EmailSubmitRexValidator();
  final StringValidator passwordRegisterSubmitValidator = MinLengthStringValidator(8);
  final StringValidator passwordSignInSubmitValidator = NonEmptyStringValidator();
}