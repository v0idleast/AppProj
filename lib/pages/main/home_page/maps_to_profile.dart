import '/flutter_flow/flutter_flow_util.dart';

Future navigateToProfile(
  int points,
) async {
  // Обчислюємо знижку
  String discount;
  if (points < 2000) {
    discount = "5%";
  } else if (points >= 2000 && points < 5000) {
    discount = "10%";
  } else {
    discount = "15%";
  }

  // Формуємо фінальний текст
  String finalOutput = "Знижка на снасті: $discount";

  // Перехід на сторінку Profile
  context.pushNamed(
    'ProfilePage',
    queryParameters: {
      'infoText': serializeParam(finalOutput, ParamType.String),
    }.withoutNulls,
  );
}