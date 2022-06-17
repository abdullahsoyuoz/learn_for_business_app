import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final formatterBirthday = MaskTextInputFormatter(
    filter: {"#": RegExp(r'[0-9]')},
    mask: '##.##.####',
    type: MaskAutoCompletionType.lazy);

final formatterCreditCard = MaskTextInputFormatter(
  filter: {"#": RegExp(r'[0-9]')},
  mask: '#### #### #### ####',
  type: MaskAutoCompletionType.lazy,
);

final formatterExpiredDate = MaskTextInputFormatter(
  filter: {"#": RegExp(r'[0-9]')},
  mask: '## / ##',
  type: MaskAutoCompletionType.lazy,
);


final formatterCVV = MaskTextInputFormatter(
  filter: {"#": RegExp(r'[0-9]')},
  mask: '###',
  type: MaskAutoCompletionType.lazy,
);


final formatterPhoneWithCode = MaskTextInputFormatter(
    filter: {"#": RegExp(r'[0-9]')},
    mask: '+90 ### ### ## ##',
    type: MaskAutoCompletionType.lazy);

final formatterPhone = MaskTextInputFormatter(
    filter: {"#": RegExp(r'[0-9]')},
    mask: '### ### ## ##',
    type: MaskAutoCompletionType.lazy);

final formatterTckn = MaskTextInputFormatter(
    filter: {"#": RegExp(r'[0-9]')},
    mask: '###########',
    type: MaskAutoCompletionType.lazy);