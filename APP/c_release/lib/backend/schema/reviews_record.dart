import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reviews_record.g.dart';

abstract class ReviewsRecord
    implements Built<ReviewsRecord, ReviewsRecordBuilder> {
  static Serializer<ReviewsRecord> get serializer => _$reviewsRecordSerializer;

  @BuiltValueField(wireName: 'nombre_lugar')
  String? get nombreLugar;

  String? get descripcion;

  LatLng? get ubicacion;

  String? get foto;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReviewsRecordBuilder builder) => builder
    ..nombreLugar = ''
    ..descripcion = ''
    ..foto = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReviewsRecord._();
  factory ReviewsRecord([void Function(ReviewsRecordBuilder) updates]) =
      _$ReviewsRecord;

  static ReviewsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReviewsRecordData({
  String? nombreLugar,
  String? descripcion,
  LatLng? ubicacion,
  String? foto,
}) {
  final firestoreData = serializers.toFirestore(
    ReviewsRecord.serializer,
    ReviewsRecord(
      (r) => r
        ..nombreLugar = nombreLugar
        ..descripcion = descripcion
        ..ubicacion = ubicacion
        ..foto = foto,
    ),
  );

  return firestoreData;
}
