import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:syncfusion_line_chart_demo/main.dart';

void main() {
  testWidgets('line chart demo supports mode and range switching', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SyncfusionLineChartApp());
    await tester.pumpAndSettle();

    expect(find.text('Syncfusion 折线图实验室'), findsOneWidget);
    expect(find.text('当前模式：基础折线 · 数据范围：上半年'), findsOneWidget);
    expect(find.byType(SfCartesianChart), findsOneWidget);

    await tester.tap(find.text('全年'));
    await tester.pumpAndSettle();
    expect(find.text('当前模式：基础折线 · 数据范围：全年'), findsOneWidget);

    await tester.tap(find.text('渐变面积'));
    await tester.pumpAndSettle();
    expect(find.text('当前模式：渐变面积 · 数据范围：全年'), findsOneWidget);
  });
}
