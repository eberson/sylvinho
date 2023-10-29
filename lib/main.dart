
import 'package:flutter/material.dart';
import 'package:sylvinho/src/application/repository/repositories.dart';
import 'package:sylvinho/src/application/usecases/usecases.dart';
import 'package:sylvinho/src/drivers/question/question.dart';
import 'package:sylvinho/src/drivers/storage/storage.dart';
import 'package:sylvinho/src/drivers/ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Storage.setup();
  Repositories.setup();
  Question.setup();
  UseCases.setup();

  runApp(const Application());
}


