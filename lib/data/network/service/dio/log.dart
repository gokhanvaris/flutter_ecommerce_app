import 'dart:developer';

import 'package:logging/logging.dart';

class Log {
  const Log._();

  static Logger? _logger;

  static void init() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      log('${rec.level.name}: ${rec.time}: ${rec.message}');
    });
    _logger ??= Logger("LOGGER NAME");
  }

  static void api(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.INFO,
        message,
        error,
        stackTrace,
      );

  static void info(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.INFO,
        message,
        error,
        stackTrace,
      );

  static void warning(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.WARNING,
        message,
        error,
        stackTrace,
      );

  static void config(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.CONFIG,
        message,
        error,
        stackTrace,
      );

  static void finest(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.FINEST,
        message,
        error,
        stackTrace,
      );

  static void finer(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.FINER,
        message,
        error,
        stackTrace,
      );

  static void fine(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.FINE,
        message,
        error,
        stackTrace,
      );

  static void severe(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.SEVERE,
        message,
        error,
        stackTrace,
      );

  static void shout(
    message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      _logger?.log(
        Level.SHOUT,
        message,
        error,
        stackTrace,
      );
}
