import 'package:flutter_test/flutter_test.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';

void main() {
  test('All necessary types are exported', () {
    // Test that all the types mentioned in the error are available
    expect(() => MobileScannerController(), returnsNormally);
    expect(() => DetectionSpeed.noDuplicates, returnsNormally);
    expect(() => BarcodeCapture(barcodes: []), returnsNormally);
    expect(() => BarcodeType.unknown, returnsNormally);
    expect(() => BarcodeFormat.unknown, returnsNormally);
    expect(() => AiBarcodeScanner(), returnsNormally);
  });

  test('BarcodeCapture properties are accessible', () {
    final capture = BarcodeCapture(barcodes: []);
    expect(capture.barcodes, isA<List<Barcode>>());
    expect(capture.image, isNull);
    expect(capture.raw, isNull);
  });

  test('Barcode properties are accessible', () {
    final barcode = Barcode(format: BarcodeFormat.unknown, rawValue: 'test', displayValue: 'test', type: BarcodeType.unknown);
    expect(barcode.format, equals(BarcodeFormat.unknown));
    expect(barcode.rawValue, equals('test'));
    expect(barcode.displayValue, equals('test'));
    expect(barcode.type, equals(BarcodeType.unknown));
  });
}
