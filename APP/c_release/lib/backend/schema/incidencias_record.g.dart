// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incidencias_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IncidenciasRecord> _$incidenciasRecordSerializer =
    new _$IncidenciasRecordSerializer();

class _$IncidenciasRecordSerializer
    implements StructuredSerializer<IncidenciasRecord> {
  @override
  final Iterable<Type> types = const [IncidenciasRecord, _$IncidenciasRecord];
  @override
  final String wireName = 'IncidenciasRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, IncidenciasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.titulo;
    if (value != null) {
      result
        ..add('titulo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.resumen;
    if (value != null) {
      result
        ..add('resumen')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foto;
    if (value != null) {
      result
        ..add('foto')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ubicacion;
    if (value != null) {
      result
        ..add('ubicacion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  IncidenciasRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IncidenciasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'titulo':
          result.titulo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'resumen':
          result.resumen = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'foto':
          result.foto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ubicacion':
          result.ubicacion = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$IncidenciasRecord extends IncidenciasRecord {
  @override
  final String? titulo;
  @override
  final String? resumen;
  @override
  final String? foto;
  @override
  final LatLng? ubicacion;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IncidenciasRecord(
          [void Function(IncidenciasRecordBuilder)? updates]) =>
      (new IncidenciasRecordBuilder()..update(updates))._build();

  _$IncidenciasRecord._(
      {this.titulo, this.resumen, this.foto, this.ubicacion, this.ffRef})
      : super._();

  @override
  IncidenciasRecord rebuild(void Function(IncidenciasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IncidenciasRecordBuilder toBuilder() =>
      new IncidenciasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IncidenciasRecord &&
        titulo == other.titulo &&
        resumen == other.resumen &&
        foto == other.foto &&
        ubicacion == other.ubicacion &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, titulo.hashCode), resumen.hashCode), foto.hashCode),
            ubicacion.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IncidenciasRecord')
          ..add('titulo', titulo)
          ..add('resumen', resumen)
          ..add('foto', foto)
          ..add('ubicacion', ubicacion)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IncidenciasRecordBuilder
    implements Builder<IncidenciasRecord, IncidenciasRecordBuilder> {
  _$IncidenciasRecord? _$v;

  String? _titulo;
  String? get titulo => _$this._titulo;
  set titulo(String? titulo) => _$this._titulo = titulo;

  String? _resumen;
  String? get resumen => _$this._resumen;
  set resumen(String? resumen) => _$this._resumen = resumen;

  String? _foto;
  String? get foto => _$this._foto;
  set foto(String? foto) => _$this._foto = foto;

  LatLng? _ubicacion;
  LatLng? get ubicacion => _$this._ubicacion;
  set ubicacion(LatLng? ubicacion) => _$this._ubicacion = ubicacion;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IncidenciasRecordBuilder() {
    IncidenciasRecord._initializeBuilder(this);
  }

  IncidenciasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _titulo = $v.titulo;
      _resumen = $v.resumen;
      _foto = $v.foto;
      _ubicacion = $v.ubicacion;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IncidenciasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IncidenciasRecord;
  }

  @override
  void update(void Function(IncidenciasRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IncidenciasRecord build() => _build();

  _$IncidenciasRecord _build() {
    final _$result = _$v ??
        new _$IncidenciasRecord._(
            titulo: titulo,
            resumen: resumen,
            foto: foto,
            ubicacion: ubicacion,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
