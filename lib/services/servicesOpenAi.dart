import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

// ignore: constant_identifier_names
const _OPEN_API_KEY = "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";

Future<String> getMessagePlace(String place) async {
  OpenAI opAi = _initOpenAi();
  final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: getHistoryMsg(place),
      maxToken: 200);
  final response = await opAi.onChatCompletion(request: request);
  for (var element in response!.choices) {
    if (element.message != null) {
      return element.message!.content;
    }
  }
  return "Exception:";
}

Future<String> getCoordsPlace(String place) async {
  OpenAI opAi = _initOpenAi();
  final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: [
        Messages(
            role: Role.system,
            content:
                "Tienes que proporcionar unicamente coordenadas de lugares turisticos que hayan en los lugares que te indiquen"),
        Messages(
            role: Role.system,
            content:
                "El formato debe ser exclusivamente asi, sin agregar mas texto: 37.769263, -122.450727 "),
        Messages(role: Role.user, content: place)
      ],
      maxToken: 200);
  final response = await opAi.onChatCompletion(request: request);
  for (var element in response!.choices) {
    if (element.message != null) {
      return element.message!.content;
    }
  }
  return "Exception:";
}

OpenAI _initOpenAi() {
  return OpenAI.instance.build(
    token: _OPEN_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 5),
    ),
    enableLog: true,
  );
}

List<Messages> getHistoryMsg(String place) {
  return [
    Messages(
        role: Role.system,
        content:
            "You are an assistant tour guide focused on all the cultural stories of the places covered by the Mayan train route in southeastern Mexico and who gives me the stories in Spanish taking requests in Spanish"),
    Messages(role: Role.system, content: "Max 50 words"),
    Messages(role: Role.user, content: place)
  ];
}
