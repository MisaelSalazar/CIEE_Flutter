import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppTable extends StatefulWidget {
  final List<String> columns;
  final List<List<Widget>> rows;
  final int rowsPerPage;

  const AppTable({
    super.key,
    required this.columns,
    required this.rows,
    this.rowsPerPage = 8,
  });

  @override
  State<AppTable> createState() => _AppTableState();
}

class _AppTableState extends State<AppTable> {
  int _currentPage = 0;
  final ScrollController _horizontalController = ScrollController();

  @override
  void dispose() {
    _horizontalController.dispose();
    super.dispose();
  }

  int get _pageCount {
    final pages = (widget.rows.length / widget.rowsPerPage).ceil();
    return pages < 1 ? 1 : pages;
  }

  List<List<Widget>> get _visibleRows {
    if (widget.rows.isEmpty) return const [];

    final start = _currentPage * widget.rowsPerPage;
    var end = start + widget.rowsPerPage;
    if (end > widget.rows.length) {
      end = widget.rows.length;
    }
    return widget.rows.sublist(start, end);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: colors.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Listener(
            onPointerSignal: (event) => _handlePointerSignal(event),
            child: Scrollbar(
              controller: _horizontalController,
              thumbVisibility: true,
              scrollbarOrientation: ScrollbarOrientation.bottom,
              child: SingleChildScrollView(
                controller: _horizontalController,
                scrollDirection: Axis.horizontal,
                child: _buildTable(context),
              ),
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  void _handlePointerSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent) return;
    if (!_horizontalController.hasClients) return;
    if (_horizontalController.position.maxScrollExtent <= 0) return;

    final delta = event.scrollDelta.dy != 0
        ? event.scrollDelta.dy
        : event.scrollDelta.dx;
    if (delta == 0) return;

    final target = (_horizontalController.offset + delta).clamp(
      0.0,
      _horizontalController.position.maxScrollExtent,
    );
    _horizontalController.jumpTo(target);
  }

  Widget _buildTable(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      border: TableBorder(
        top: BorderSide(color: colors.outlineVariant),
        bottom: BorderSide(color: colors.outlineVariant),
        left: BorderSide(color: colors.outlineVariant),
        right: BorderSide(color: colors.outlineVariant),
        horizontalInside: BorderSide(color: colors.outlineVariant),
        verticalInside: BorderSide(color: colors.outlineVariant),
      ),
      children: [
        TableRow(
          decoration: BoxDecoration(color: colors.secondaryContainer),
          children: [
            for (final column in widget.columns) _buildHeaderCell(context, column),
          ],
        ),
        for (var i = 0; i < _visibleRows.length; i++)
          TableRow(
            decoration: BoxDecoration(
              color: i.isEven ? colors.surfaceContainerLow : colors.surface,
            ),
            children: [
              for (final cell in _visibleRows[i])
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: cell,
                  ),
                ),
            ],
          ),
      ],
    );
  }

  Widget _buildHeaderCell(BuildContext context, String column) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Text(
        column,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: colors.onSecondaryContainer,
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final start = widget.rows.isEmpty
        ? 0
        : _currentPage * widget.rowsPerPage + 1;
    var end = (_currentPage + 1) * widget.rowsPerPage;
    if (end > widget.rows.length) {
      end = widget.rows.length;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colors.outlineVariant)),
      ),
      child: Row(
        children: [
          Text(
            'Mostrando $start–$end de ${widget.rows.length}',
            style: textTheme.bodySmall?.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const Spacer(),
          _buildPageControls(colors),
        ],
      ),
    );
  }

  Widget _buildPageControls(ColorScheme colors) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: _currentPage == 0
                ? null
                : () => setState(() => _currentPage--),
            icon: const Icon(Icons.chevron_left),
            tooltip: 'Página anterior',
            color: colors.onSurfaceVariant,
            disabledColor: colors.outlineVariant,
            visualDensity: VisualDensity.compact,
          ),
          for (var i = 0; i < _pageCount; i++) ...[
            if (i > 0) const SizedBox(width: 4),
            _PageNumberButton(
              page: i + 1,
              isActive: i == _currentPage,
              onTap: () => setState(() => _currentPage = i),
            ),
          ],
          const SizedBox(width: 4),
          IconButton(
            onPressed: _currentPage >= _pageCount - 1
                ? null
                : () => setState(() => _currentPage++),
            icon: const Icon(Icons.chevron_right),
            tooltip: 'Página siguiente',
            color: colors.onSurfaceVariant,
            disabledColor: colors.outlineVariant,
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}

class _PageNumberButton extends StatelessWidget {
  final int page;
  final bool isActive;
  final VoidCallback onTap;

  const _PageNumberButton({
    required this.page,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: isActive ? null : onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? colors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '$page',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isActive ? colors.onPrimary : colors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}