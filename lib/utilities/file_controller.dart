import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';

class FileController {
  static final FileController _instance = FileController._internal();
  final DaysController daysController = DaysController();
  File? file;

  FileController._internal();

  factory FileController() => _instance;

  void loadFile() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      lockParentWindow: true,
    );

    if (filePickerResult != null) file = File(filePickerResult.files.single.path!);

    if (file != null) daysController.loadfromJson(json: jsonDecode(file!.readAsStringSync()));
  }

  void writeFile() async {
    JsonEncoder jsonEncoder = const JsonEncoder.withIndent("\t");

    Uint8List newFile = Uint8List.fromList(jsonEncoder.convert(daysController).codeUnits);

    if (file != null) {
      file?.writeAsBytesSync(newFile);
    } else {
      String? path = await FilePicker.platform.saveFile(
        lockParentWindow: true,
        dialogTitle: 'Save notes',
        fileName: 'Notes.schedule',
        type: FileType.custom,
        allowedExtensions: ['schedule'],
      );

      if (path != null) {
        File json = File(path);

        json.writeAsBytesSync(newFile);
      }
    }
  }
}
