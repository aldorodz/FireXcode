import 'dart:io';

extension Laravels on String {
  String toEncrpt() {
    return 'bcrypt($this)';
  }

  /// Alias of $table->unsignedBigInteger('user_id')
  String toForeignId() {
    return "\$table->foreignId('$this');";
  }

  /// Auto-incrementing UNSIGNED BIGINT (primary key) equivalent column.
  String toBigIncrements() {
    return "\$table->bigIncrements('$this');";
  }

  /// BIGINT equivalent column.
  String toBigInteger() {
    return "\$table->bigInteger('$this');";
  }

  /// BLOB equivalent column.
  String toBinary() {
    return "\$table->binary('$this');";
  }

  ///BOOLEAN equivalent column.
  String toBoolean() {
    return "\$table->boolean('$this');";
  }

  /// CHAR equivalent column with a length.
  String toChar({int? length}) {
    return "\$table->char('$this', $length);";
  }

  /// DATE equivalent column.
  String toDate() {
    return "\$table->date('$this');";
  }

  /// DATETIME equivalent column with precision (total digits).
  String toDateTime({int? value}) {
    return "\$table->dateTime('$this', $value);";
  }

  ///DATETIME (with timezone) equivalent column with precision (total digits).
  String toDateTimeTz({int? value}) {
    return "\$table->dateTimeTz('$this', $value);";
  }

  ///	DECIMAL equivalent column with precision (total digits) and scale (decimal digits).
  String toDecimal({int? total, double? decimal}) {
    return "\$table->decimal('$this', $total , $decimal );";
  }

  ///DOUBLE equivalent column with precision (total digits) and scale (decimal digits).
  String toDouble({int? total, double? decimal}) {
    return "\$table->double('$this', $total , $decimal );";
  }

  ///FLOAT equivalent column with a precision (total digits) and scale (decimal digits).
  String toFloat({int? total, double? decimal}) {
    return "\$table->float('$this', $total , $decimal );";
  }

  /// ENUM equivalent column.
  String toEnum({List? value}) {
    return "\$table->enum('$this', $value);";
  }

  /// GEOMETRY equivalent column.
  String togeometry() {
    return "\$table->geometry('$this');";
  }

  ///GEOMETRYCOLLECTION equivalent column.
  String toGeometryCollection() {
    return "\$table->geometryCollection('$this');";
  }

  /// Auto-incrementing UNSIGNED INTEGER (primary key) equivalent column.
  String toIncrements() {
    return "\$table->increments('$this');";
  }

  ///INTEGER equivalent column.
  String toInteger() {
    return "\$table->integer('$this');";
  }

  ///IP address equivalent column.
  String toIpAddress() {
    return "\$table->ipAddress('$this');";
  }

  ///JSON equivalent column.
  String toJson() {
    return "\$table->json('$this');";
  }

  ///JSONB equivalent column.
  String toJsonb() {
    return "\$table->integer('$this');";
  }

  ///LINESTRING equivalent column.
  String toLineString() {
    return "\$table->lineString('$this');";
  }

  ///LONGTEXT equivalent column.
  String toLongText() {
    return "\$table->longText('$this');";
  }

  ///MAC address equivalent column.
  String toMacAddress() {
    return "\$table->longText('$this');";
  }

  ///Auto-incrementing UNSIGNED MEDIUMINT (primary key) equivalent column.
  String toMediumIncrements() {
    return "\$table->mediumIncrements('$this');";
  }

  ///MEDIUMINT equivalent column.
  String toMediumInteger() {
    return "\$table->mediumInteger('$this');";
  }

  ///MEDIUMTEXT equivalent column.
  String toMediumText() {
    return "\$table->mediumText('$this');";
  }

  ///Adds taggable_id UNSIGNED BIGINT and taggable_type VARCHAR equivalent columns.
  String toMorphs() {
    return "\$table->morphs('$this');";
  }
}

String string(value) {
  return "\$table->morphs('$value');";
}

void createFile(String path, String content, String fileNameWithExtension) {
  Directory(path).createSync(recursive: true);
  File(path + '/' + fileNameWithExtension).writeAsStringSync(content);
}

extension StringExtension on String {
  String firstCapitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

String xBetweenText(String text, String start, String end) {
  var str = text.toString();

  final startIndex = str.indexOf(start);
  final endIndex = str.indexOf(end, startIndex + start.length);

  return str.substring(startIndex + start.length, endIndex);
}

class LaraveRequiredValidation extends ValidatorList<List<String>?> {
  LaraveRequiredValidation({List<String>? tableStructure})
      : super(tableStructure);

  List<String> get code {
    var model = <String>[];
    list?.forEach((element) {
      var data = xBetweenText(element, "'", "'");
      model.add("'$data' => 'required'");
    });
    return model;
  }
}

class ValidatorList<T> {
  final T list;

  ValidatorList(this.list);
}
