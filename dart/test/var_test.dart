import 'package:test/test.dart';

void main() {
  // 变量测试
  group("Test variables", () {
    // 测试变量关键字
    test("key word", () {
      // 定义整型变量
      int a = 100;
      // 定义浮点型变量
      double b = 200;

      // `var` 声明的变量可以如果未初始化, 则为动态类型 `dynamic`
      var x; // 相当于 dynamic x;

      // 动态类型变量可以赋值任何类型值
      x = a;
      expect(x, equals(a));
      expect(x.runtimeType.toString(), equals("int"));
      x = b;
      expect(x, equals(b));
      expect(x.runtimeType.toString(), equals("double"));

      // `var` 变量一旦初始化, 则类型会被确定
      var y = a; // 此时 y 变量类型确认为 int
      expect(y, equals(a));
      expect(y.runtimeType.toString(), equals("int"));
      // y = b;  // 此时 y 变量无法赋值其它类型值

      // `num` 类型的变量可以为任意数值类型
      num z = a; // 使用 int 型初始化 z 变量
      expect(z, equals(a));
      expect(z.runtimeType.toString(), equals("int"));
      z = b; // z 变量还可以赋值 double 类型
      expect(z, equals(b));
      expect(z.runtimeType.toString(), equals("double"));
      // z = 'hello';  // z 变量不能赋值数值外的其它类型

      // Object 是所有类型的超类, 所以可以赋值为任意类型值
      Object o = a;
      expect(o, equals(a));
      expect(o.runtimeType.toString(), equals("int"));
      o = b;
      expect(o, equals(b));
      expect(o.runtimeType.toString(), equals("double"));
      o = 'hello';
      expect(o, equals('hello'));
      expect(o.runtimeType.toString(), equals('String'));
    });

    // 测试字符串变量
    test("strings", () {
      // 字符串可以是单引号或双引号
      var s1 = 's';
      var s2 = "s";
      expect(s1, equals(s2));

      // 连续 3 个引号表示多行文本
      var s3 = '''
Hello
World
''';
      expect(s3, equals("Hello\nWorld\n"));

      // 通过 `$` 符号可以再字符串中引用变量, `${...}` 符号可以引用表达式
      num a = 100;
      num b = 200;
      var s4 = """
  \$a + \$b
= $a + $b
= ${a + b}
""";
      expect(s4, "  \$a + \$b\n= 100 + 200\n= 300\n");
    });
  });
}
