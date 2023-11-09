import 'package:flutter_tts/flutter_tts.dart';

FlutterTts ftts = FlutterTts();

Future getAudio(String msj) async {
  await ftts.setLanguage("es");
  await ftts.setSpeechRate(0.5); //speed of speech
  await ftts.setVolume(1.0); //volume of speech
  await ftts.setPitch(1); //pitc of sound
  await ftts.speak(msj);
}

Future seStopAudio() async {
  await ftts.stop();
}

Future setPauseAudio() async {
  await ftts.pause();
}
