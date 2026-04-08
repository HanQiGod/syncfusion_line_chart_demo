import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const SyncfusionLineChartApp());
}

class SyncfusionLineChartApp extends StatelessWidget {
  const SyncfusionLineChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Syncfusion 折线图 Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          brightness: Brightness.light,
        ),
      ),
      home: const LineChartSample(),
    );
  }
}

enum ChartMode { basic, compare, smooth, area }

enum TimeGranularity { week, month, year }

enum MonthRange { firstHalf, fullYear, secondHalf }

extension ChartModeExtension on ChartMode {
  String get label {
    switch (this) {
      case ChartMode.basic:
        return '基础折线';
      case ChartMode.compare:
        return '多线对比';
      case ChartMode.smooth:
        return '平滑曲线';
      case ChartMode.area:
        return '渐变面积';
    }
  }

  String get chartTitle {
    switch (this) {
      case ChartMode.basic:
        return '基础折线图';
      case ChartMode.compare:
        return '多条折线对比图';
      case ChartMode.smooth:
        return '平滑曲线图';
      case ChartMode.area:
        return '渐变面积图';
    }
  }

  String get description {
    switch (this) {
      case ChartMode.basic:
        return '还原文章里的核心结构，适合从零理解 X/Y 轴、图例、提示框和标签。';
      case ChartMode.compare:
        return '用双折线同时看两个周期的走势差异，最适合做同比或方案对比。';
      case ChartMode.smooth:
        return '把折线换成更流畅的 Spline 曲线，视觉上更适合展示趋势变化。';
      case ChartMode.area:
        return '用颜色强度突出走势累计感，更适合表达体量与波动。';
    }
  }

  IconData get icon {
    switch (this) {
      case ChartMode.basic:
        return Icons.show_chart_rounded;
      case ChartMode.compare:
        return Icons.multiline_chart_rounded;
      case ChartMode.smooth:
        return Icons.timeline_rounded;
      case ChartMode.area:
        return Icons.area_chart_rounded;
    }
  }
}

extension TimeGranularityExtension on TimeGranularity {
  String get label {
    switch (this) {
      case TimeGranularity.week:
        return '周';
      case TimeGranularity.month:
        return '月';
      case TimeGranularity.year:
        return '年';
    }
  }

  String get sectionTitle {
    switch (this) {
      case TimeGranularity.week:
        return '周维度';
      case TimeGranularity.month:
        return '月维度';
      case TimeGranularity.year:
        return '年维度';
    }
  }

  IconData get icon {
    switch (this) {
      case TimeGranularity.week:
        return Icons.view_week_rounded;
      case TimeGranularity.month:
        return Icons.calendar_view_month_rounded;
      case TimeGranularity.year:
        return Icons.date_range_rounded;
    }
  }
}

extension MonthRangeExtension on MonthRange {
  String get label {
    switch (this) {
      case MonthRange.firstHalf:
        return '上半年';
      case MonthRange.fullYear:
        return '全年';
      case MonthRange.secondHalf:
        return '下半年';
    }
  }

  String get helperText {
    switch (this) {
      case MonthRange.firstHalf:
        return '展示 1 月到 6 月数据';
      case MonthRange.fullYear:
        return '展示 1 月到 12 月数据';
      case MonthRange.secondHalf:
        return '展示 7 月到 12 月数据';
    }
  }
}

class ChartScopeData {
  const ChartScopeData({
    required this.currentData,
    required this.compareData,
    required this.currentSeriesName,
    required this.compareSeriesName,
    required this.scopeLabel,
    required this.scopeHint,
    required this.peakLabel,
    required this.compareHint,
  });

  final List<ChartData> currentData;
  final List<ChartData> compareData;
  final String currentSeriesName;
  final String compareSeriesName;
  final String scopeLabel;
  final String scopeHint;
  final String peakLabel;
  final String compareHint;
}

class LineChartSample extends StatefulWidget {
  const LineChartSample({super.key});

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  static const Color _primary = Color(0xFF0F766E);
  static const Color _secondary = Color(0xFFF97316);
  static const Color _surface = Color(0xFFFFFCF5);
  static const Color _ink = Color(0xFF102A2A);

  static const List<ChartData> _weekCurrentData = <ChartData>[
    ChartData('Mon', 14),
    ChartData('Tue', 18),
    ChartData('Wed', 16),
    ChartData('Thu', 24),
    ChartData('Fri', 29),
    ChartData('Sat', 34),
    ChartData('Sun', 26),
  ];

  static const List<ChartData> _weekLastData = <ChartData>[
    ChartData('Mon', 11),
    ChartData('Tue', 16),
    ChartData('Wed', 15),
    ChartData('Thu', 21),
    ChartData('Fri', 25),
    ChartData('Sat', 28),
    ChartData('Sun', 23),
  ];

  static const List<ChartData> _monthCurrentData = <ChartData>[
    ChartData('Jan', 12),
    ChartData('Feb', 18),
    ChartData('Mar', 22),
    ChartData('Apr', 35),
    ChartData('May', 33),
    ChartData('Jun', 58),
    ChartData('Jul', 60),
    ChartData('Aug', 64),
    ChartData('Sep', 72),
    ChartData('Oct', 66),
    ChartData('Nov', 74),
    ChartData('Dec', 81),
  ];

  static const List<ChartData> _monthLastData = <ChartData>[
    ChartData('Jan', 10),
    ChartData('Feb', 14),
    ChartData('Mar', 19),
    ChartData('Apr', 29),
    ChartData('May', 31),
    ChartData('Jun', 48),
    ChartData('Jul', 52),
    ChartData('Aug', 55),
    ChartData('Sep', 63),
    ChartData('Oct', 59),
    ChartData('Nov', 68),
    ChartData('Dec', 73),
  ];

  static const List<ChartData> _yearActualData = <ChartData>[
    ChartData('2021', 168),
    ChartData('2022', 196),
    ChartData('2023', 242),
    ChartData('2024', 287),
    ChartData('2025', 336),
    ChartData('2026', 392),
  ];

  static const List<ChartData> _yearTargetData = <ChartData>[
    ChartData('2021', 160),
    ChartData('2022', 188),
    ChartData('2023', 230),
    ChartData('2024', 278),
    ChartData('2025', 330),
    ChartData('2026', 380),
  ];

  late final TooltipBehavior _tooltipBehavior;
  ChartMode _selectedMode = ChartMode.basic;
  TimeGranularity _selectedGranularity = TimeGranularity.month;
  MonthRange _selectedRange = MonthRange.firstHalf;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      color: Colors.white,
      textStyle: const TextStyle(color: _ink, fontWeight: FontWeight.w600),
      header: '销售额',
      format: 'point.x : point.y 万',
    );
  }

  ChartScopeData get _activeScope {
    switch (_selectedGranularity) {
      case TimeGranularity.week:
        return const ChartScopeData(
          currentData: _weekCurrentData,
          compareData: _weekLastData,
          currentSeriesName: '本周',
          compareSeriesName: '上周',
          scopeLabel: '本周',
          scopeHint: '展示 Mon 到 Sun 的周数据',
          peakLabel: '峰值日期',
          compareHint: '与上周同区间数据对比',
        );
      case TimeGranularity.month:
        return ChartScopeData(
          currentData: _sliceData(_monthCurrentData, _selectedRange),
          compareData: _sliceData(_monthLastData, _selectedRange),
          currentSeriesName: '2026',
          compareSeriesName: '2025',
          scopeLabel: _selectedRange.label,
          scopeHint: _selectedRange.helperText,
          peakLabel: '峰值月份',
          compareHint: '与 2025 年同区间数据对比',
        );
      case TimeGranularity.year:
        return const ChartScopeData(
          currentData: _yearActualData,
          compareData: _yearTargetData,
          currentSeriesName: '实际',
          compareSeriesName: '目标',
          scopeLabel: '近六年',
          scopeHint: '展示 2021 到 2026 的年度数据',
          peakLabel: '峰值年份',
          compareHint: '与年度目标数据对比',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ChartScopeData scope = _activeScope;
    final double totalSales = _sum(scope.currentData);
    final ChartData peakPoint = _peak(scope.currentData);
    final double growthRate = _growthRate(scope.currentData, scope.compareData);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion 折线图 Demo'),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFFF6EFE2),
              Color(0xFFE6F5F2),
              Color(0xFFF9F7F1),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1040),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildHero(context),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: <Widget>[
                        _InsightCard(
                          title: '当前区间总量',
                          value: '${totalSales.toStringAsFixed(0)} 万',
                          hint: scope.scopeHint,
                          accentColor: _primary,
                        ),
                        _InsightCard(
                          title: scope.peakLabel,
                          value:
                              '${peakPoint.x} · ${peakPoint.y.toStringAsFixed(0)} 万',
                          hint: '当前展示区间内的最高点',
                          accentColor: _secondary,
                        ),
                        _InsightCard(
                          title: '对比变化',
                          value: _formatGrowth(growthRate),
                          hint: scope.compareHint,
                          accentColor: const Color(0xFF7C3AED),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildChartCard(context, scope),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 26, 24, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color(0xFF0F766E),
            Color(0xFF134E4A),
            Color(0xFF102A43),
          ],
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x220F172A),
            blurRadius: 26,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Syncfusion 折线图实验室',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '一个页面同时演示周/月/年粒度切换，并支持基础折线、多线对比、平滑曲线和渐变面积图。',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFFE2F7F2),
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const <Widget>[
              _Badge(text: '周/月/年'),
              _Badge(text: '图例'),
              _Badge(text: 'Tooltip'),
              _Badge(text: '数据标签'),
              _Badge(text: '范围切换'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard(BuildContext context, ChartScopeData scope) {
    final bool showDataLabels = scope.currentData.length <= 7;

    return Card(
      color: _surface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _selectedMode.chartTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: _ink,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _selectedMode.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF52606D),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '当前模式：${_selectedMode.label} · 时间粒度：${_selectedGranularity.label} · 数据范围：${scope.scopeLabel}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF0F766E),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton<TimeGranularity>(
                showSelectedIcon: false,
                segments: TimeGranularity.values
                    .map(
                      (TimeGranularity granularity) =>
                          ButtonSegment<TimeGranularity>(
                            value: granularity,
                            icon: Icon(granularity.icon, size: 18),
                            label: Text(granularity.label),
                          ),
                    )
                    .toList(),
                selected: <TimeGranularity>{_selectedGranularity},
                onSelectionChanged: (Set<TimeGranularity> value) {
                  setState(() {
                    _selectedGranularity = value.first;
                  });
                },
              ),
            ),
            const SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton<ChartMode>(
                showSelectedIcon: false,
                segments: ChartMode.values
                    .map(
                      (ChartMode mode) => ButtonSegment<ChartMode>(
                        value: mode,
                        icon: Icon(mode.icon, size: 18),
                        label: Text(mode.label),
                      ),
                    )
                    .toList(),
                selected: <ChartMode>{_selectedMode},
                onSelectionChanged: (Set<ChartMode> value) {
                  setState(() {
                    _selectedMode = value.first;
                  });
                },
              ),
            ),
            const SizedBox(height: 14),
            if (_selectedGranularity == TimeGranularity.month)
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: MonthRange.values
                    .map(
                      (MonthRange range) => ChoiceChip(
                        label: Text(range.label),
                        selected: _selectedRange == range,
                        onSelected: (_) {
                          setState(() {
                            _selectedRange = range;
                          });
                        },
                      ),
                    )
                    .toList(),
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: const Color(0xFF0F766E).withValues(alpha: 0.18),
                  ),
                ),
                child: Text(
                  '${_selectedGranularity.sectionTitle}固定展示 ${scope.scopeLabel} 数据',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF0F766E),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            const SizedBox(height: 24),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 320),
              child: SizedBox(
                key: ValueKey<String>(
                  '${_selectedMode.name}-${_selectedGranularity.name}-${_selectedRange.name}',
                ),
                height: 360,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  title: ChartTitle(
                    text:
                        '${_selectedGranularity.sectionTitle} · ${_selectedMode.chartTitle}',
                  ),
                  legend: Legend(
                    isVisible: _selectedMode == ChartMode.compare,
                    position: LegendPosition.bottom,
                  ),
                  tooltipBehavior: _tooltipBehavior,
                  primaryXAxis: CategoryAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                    axisLine: const AxisLine(width: 0),
                    labelIntersectAction:
                        _selectedGranularity == TimeGranularity.month &&
                            _selectedRange == MonthRange.fullYear
                        ? AxisLabelIntersectAction.rotate45
                        : AxisLabelIntersectAction.none,
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    interval: _selectedGranularity == TimeGranularity.year
                        ? 50
                        : 10,
                    title: const AxisTitle(text: '销售额（万）'),
                    axisLine: const AxisLine(width: 0),
                    majorTickLines: const MajorTickLines(size: 0),
                  ),
                  series: _buildSeries(scope, showDataLabels),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CartesianSeries<ChartData, String>> _buildSeries(
    ChartScopeData scope,
    bool showDataLabels,
  ) {
    switch (_selectedMode) {
      case ChartMode.basic:
        return <CartesianSeries<ChartData, String>>[
          LineSeries<ChartData, String>(
            dataSource: scope.currentData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: scope.currentSeriesName,
            color: _primary,
            width: 3,
            markerSettings: const MarkerSettings(isVisible: true),
            dataLabelSettings: DataLabelSettings(isVisible: showDataLabels),
            animationDuration: 650,
          ),
        ];
      case ChartMode.compare:
        return <CartesianSeries<ChartData, String>>[
          LineSeries<ChartData, String>(
            dataSource: scope.currentData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: scope.currentSeriesName,
            color: _primary,
            width: 3,
            markerSettings: const MarkerSettings(isVisible: true),
            animationDuration: 650,
          ),
          LineSeries<ChartData, String>(
            dataSource: scope.compareData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: scope.compareSeriesName,
            color: _secondary,
            width: 3,
            dashArray: const <double>[7, 4],
            markerSettings: const MarkerSettings(isVisible: true),
            animationDuration: 650,
          ),
        ];
      case ChartMode.smooth:
        return <CartesianSeries<ChartData, String>>[
          SplineSeries<ChartData, String>(
            dataSource: scope.currentData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: scope.currentSeriesName,
            color: _primary,
            width: 3,
            splineType: SplineType.monotonic,
            markerSettings: const MarkerSettings(isVisible: true),
            dataLabelSettings: DataLabelSettings(isVisible: showDataLabels),
            animationDuration: 650,
          ),
        ];
      case ChartMode.area:
        return <CartesianSeries<ChartData, String>>[
          AreaSeries<ChartData, String>(
            dataSource: scope.currentData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: scope.currentSeriesName,
            borderColor: _primary,
            borderWidth: 3,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                _primary.withValues(alpha: 0.45),
                _primary.withValues(alpha: 0.06),
              ],
            ),
            markerSettings: const MarkerSettings(isVisible: true),
            dataLabelSettings: DataLabelSettings(isVisible: showDataLabels),
            animationDuration: 650,
          ),
        ];
    }
  }

  static List<ChartData> _sliceData(List<ChartData> data, MonthRange range) {
    switch (range) {
      case MonthRange.firstHalf:
        return data.take(6).toList(growable: false);
      case MonthRange.fullYear:
        return data;
      case MonthRange.secondHalf:
        return data.skip(6).toList(growable: false);
    }
  }

  static double _sum(List<ChartData> data) {
    return data.fold<double>(0, (double sum, ChartData item) => sum + item.y);
  }

  static ChartData _peak(List<ChartData> data) {
    return data.reduce(
      (ChartData current, ChartData next) =>
          current.y >= next.y ? current : next,
    );
  }

  static double _growthRate(List<ChartData> current, List<ChartData> compare) {
    final double compareTotal = _sum(compare);
    if (compareTotal == 0) {
      return 0;
    }
    return (_sum(current) - compareTotal) / compareTotal * 100;
  }

  static String _formatGrowth(double value) {
    final String prefix = value >= 0 ? '+' : '';
    return '$prefix${value.toStringAsFixed(1)}%';
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.title,
    required this.value,
    required this.hint,
    required this.accentColor,
  });

  final String title;
  final String value;
  final String hint;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: accentColor.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: const Color(0xFF52606D),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: const Color(0xFF102A2A),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            hint,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF7B8794)),
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x1AFFFFFF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0x2FFFFFFF)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class ChartData {
  const ChartData(this.x, this.y);

  final String x;
  final double y;
}
