import 'dart:ui';

enum StatusEnum {
  operating(Color(0xFF52C41A)),
  alert(Color(0xFFED3833));

  final Color color;
  const StatusEnum(this.color);
}
