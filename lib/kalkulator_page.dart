import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _display = '';
  String _result = '';

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _display = '';
        _result = '';
      } else if (value == '⌫') {
        if (_display.isNotEmpty) {
          _display = _display.substring(0, _display.length - 1);
        }
      } else if (value == '=') {
        try {
          _result = _calculate(_display);
        } catch (_) {
          _result = 'Error';
        }
      } else {
        // prevent multiple operators in a row (simple guard)
        if (_isOperator(value)) {
          if (_display.isEmpty) return; // don't allow operator first (except minus if you want)
          final last = _display[_display.length - 1];
          if (_isOperator(last)) {
            // replace last operator with new one
            _display = _display.substring(0, _display.length - 1) + value;
            return;
          }
        }
        _display += value;
      }
    });
  }

  bool _isOperator(String s) {
    return s == '÷' || s == '×' || s == '+' || s == '-';
  }

  String _calculate(String expr) {
    if (expr.isEmpty) return '';

    // handle square: e.g. "5²"
    if (expr.endsWith('²')) {
      final left = expr.substring(0, expr.length - 1);
      final num = double.parse(left);
      return _formatNumber(num * num);
    }

    // handle sqrt: e.g. "√9"
    if (expr.startsWith('√')) {
      final right = expr.substring(1);
      final num = double.parse(right);
      if (num < 0) throw Exception('neg sqrt');
      return _formatNumber(sqrt(num));
    }

    // Replace display operators with programming equivalents
    final normalized = expr.replaceAll('×', '*').replaceAll('÷', '/');

    // Find first operator (+ - * /) but skip a leading '-' that denotes negative number
    int opIndex = -1;
    String? opChar;
    for (int i = 1; i < normalized.length; i++) {
      final ch = normalized[i];
      if (ch == '+' || ch == '-' || ch == '*' || ch == '/') {
        opIndex = i;
        opChar = ch;
        break;
      }
    }

    if (opIndex == -1 || opChar == null) {
      // no binary operator found -> just return the expression
      return expr;
    }

    final leftStr = normalized.substring(0, opIndex);
    final rightStr = normalized.substring(opIndex + 1);

    if (leftStr.isEmpty || rightStr.isEmpty) {
      throw Exception('invalid expr');
    }

    final a = double.parse(leftStr);
    final b = double.parse(rightStr);

    double res;
    switch (opChar) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '*':
        res = a * b;
        break;
      case '/':
        if (b == 0) throw Exception('div zero');
        res = a / b;
        break;
      default:
        throw Exception('unknown op');
    }

    return _formatNumber(res);
  }

  String _formatNumber(double v) {
    // If integer, show without decimal. Otherwise trim trailing zeros.
    if (v == v.roundToDouble()) {
      return v.toInt().toString();
    } else {
      // limit to max 8 decimal places, then trim trailing zeros
      String s = v.toStringAsFixed(8);
      s = s.replaceFirst(RegExp(r'\.?0+$'), '');
      return s;
    }
  }

  final List<String> _buttons = [
    'C', '⌫', '√', '÷',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', '²', '='
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // small expression text
                  Text(
                    _display,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // result big
                  Text(
                    _result.isEmpty ? '' : _result,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Buttons Grid
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.15,
            ),
            itemCount: _buttons.length,
            itemBuilder: (context, index) {
              final text = _buttons[index];
              final isOperator = ['÷', '×', '-', '+', '=', '√', '²'].contains(text);

              Color bgColor;
              Color textColor = Colors.white;
              if (text == 'C' || text == '⌫') {
                bgColor = Colors.grey[800]!;
                textColor = Colors.white70;
              } else if (text == '=' ) {
                bgColor = Colors.orange[700]!;
                textColor = Colors.white;
              } else if (isOperator) {
                bgColor = Colors.orange[700]!;
              } else {
                bgColor = Colors.grey[900]!;
                textColor = Colors.white70;
              }

              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: ElevatedButton(
                  onPressed: () => _onPressed(text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bgColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.zero,
                    elevation: 2,
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 24,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
