import 'package:flutter/material.dart';

typedef CellBuilder<T> = Widget Function(BuildContext context, T data, int index, SmartTableInfo info);

class SmartTableInfo {
  final int dataCount;
  final int rowCount;
  final int columnCount;
  final int visibleCount;

  SmartTableInfo(this.dataCount, this.rowCount, this.columnCount, this.visibleCount);
}

class SmartTable<T> extends StatelessWidget {
  final Iterable<T> datas;
  final CellBuilder<T> cellBuilder;
  final double space;
  late final SmartTableInfo _info;

  SmartTable({Key? key, required this.datas, required this.cellBuilder, this.space = 0, int? maxRowCount, int maxColumnCount = 3}) : super(key: key) {
    int tempRowCount = maxRowCount ?? datas.length ~/ maxColumnCount + 1;
    int tempColumnCount = maxColumnCount;
    while (tempRowCount > 1) {
      if (tempColumnCount * (tempRowCount - 1) < datas.length) {
        break;
      }
      tempRowCount -= 1;
    }
    while (tempColumnCount > 1) {
      if (tempRowCount * (tempColumnCount - 1) < datas.length) {
        break;
      }
      tempColumnCount -= 1;
    }
    _info = SmartTableInfo(datas.length, tempRowCount, tempColumnCount, tempRowCount * tempColumnCount);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rowWidgets = [];
    for (int rowIndex = 0; rowIndex < _info.rowCount; rowIndex++) {
      List<Widget> columnWidgets = [];
      for (int columnIndex = 0; columnIndex < _info.columnCount; columnIndex++) {
        int index = rowIndex * _info.columnCount + columnIndex;
        if (index < datas.length) {
          columnWidgets.add(Expanded(child: cellBuilder(context, datas.elementAt(index), index, _info)));
        } else {
          columnWidgets.add(Expanded(child: SizedBox.shrink()));
        }
        if (columnIndex < _info.columnCount - 1 && space > 0) {
          columnWidgets.add(SizedBox(width: space));
        }
      }
      rowWidgets.add(Row(children: columnWidgets));
      if (rowIndex < _info.rowCount - 1 && space > 0) {
        rowWidgets.add(SizedBox(height: space));
      }
    }
    return Column(mainAxisSize: MainAxisSize.min, children: rowWidgets);
  }
}
