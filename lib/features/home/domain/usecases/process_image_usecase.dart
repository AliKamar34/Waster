import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:dartz/dartz.dart';
import 'package:waster/core/errors/failure.dart';

class ProcessedImage {
  final String mimeType;
  final String base64Data;

  const ProcessedImage({required this.mimeType, required this.base64Data});
}

class ProcessImageUseCase {
  Future<Either<Failure, ProcessedImage>> call(File imageFile) async {
    try {
      final mimeType =
          lookupMimeType(imageFile.path) ?? 'application/octet-stream';
      final bytes = await imageFile.readAsBytes();
      final base64Data = base64Encode(bytes);

      return Right(ProcessedImage(mimeType: mimeType, base64Data: base64Data));
    } catch (e) {
      return Left(Failure('Failed to process image: ${e.toString()}'));
    }
  }
}
