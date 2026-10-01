import 'package:flutter/material.dart';

import 'theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _transactions = [
    TransactionData(
      icon: Icons.directions_bus,
      title: 'Uber al trabajo',
      subtitle: 'Transporte · Tarjeta',
      amount: '− Q38.00',
      date: 'Hoy',
    ),
    TransactionData(
      icon: Icons.shopping_cart,
      title: 'Súper La Torre',
      subtitle: 'Súper y comida · Tarjeta',
      amount: '− Q285.50',
      date: 'Ayer',
    ),
    TransactionData(
      icon: Icons.arrow_upward,
      title: 'Salario quincena',
      subtitle: 'Ingreso · Banco',
      amount: '+ Q4,200.00',
      date: 'Ayer',
      isIncome: true,
    ),
    TransactionData(
      icon: Icons.local_cafe,
      title: 'Café con Ana',
      subtitle: 'Entretenimiento · Efectivo',
      amount: '− Q65.00',
      date: 'Ayer',
    ),
    TransactionData(
      icon: Icons.bolt,
      title: 'Recibo de luz (EEGSA)',
      subtitle: 'Servicios · Banco',
      amount: '− Q420.00',
      date: 'Lun 20',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _GreetingHeader(),
            const SizedBox(height: 22),
            const _BudgetSummary(),
            const SizedBox(height: 22),
            const Row(
              children: [
                _SummaryCard(title: 'Cuentas', value: 'Q7,810.00'),
                SizedBox(width: 12),
                _SummaryCard(title: 'Metas de ahorro', value: '3 activas'),
              ],
            ),
            const SizedBox(height: 28),
            _SectionHeader(
              title: 'Últimos movimientos',
              onPressed: () {},
            ),
            const SizedBox(height: 4),
            ..._transactions.map(
              (transaction) => _TransactionTile(transaction: transaction),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _HomeNavigationBar(),
    );
  }
}

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Hola, Kevin'),
        Text('Julio 2026', style: TextStyle(color: AppColors.mutedText)),
      ],
    );
  }
}

class _BudgetSummary extends StatelessWidget {
  const _BudgetSummary();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TE QUEDAN DISPONIBLES',
          style: TextStyle(fontSize: 11, color: AppColors.accent),
        ),
        Text(
          'Q2,796.50',
          style: TextStyle(
            fontSize: 52,
            color: AppColors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16),
        LinearProgressIndicator(value: 0.57, minHeight: 8),
        SizedBox(height: 7),
        Text(
          'Has usado Q3,703.50 de Q6,500.00',
          style: TextStyle(fontSize: 12, color: AppColors.mutedText),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 11, color: AppColors.mutedText),
            ),
            const SizedBox(height: 2),
            Text(value, style: const TextStyle(fontSize: 19)),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 20)),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Ver todo',
            style: TextStyle(fontSize: 13, color: AppColors.accent),
          ),
        ),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({required this.transaction});

  final TransactionData transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.accentSurface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(transaction.icon, color: AppColors.accent),
      ),
      title: Text(transaction.title),
      subtitle: Text(
        transaction.subtitle,
        style: const TextStyle(color: AppColors.mutedText),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            transaction.amount,
            style: TextStyle(
              fontSize: 13,
              color: transaction.isIncome ? AppColors.accent : AppColors.text,
            ),
          ),
          Text(
            transaction.date,
            style: const TextStyle(fontSize: 10, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}

class _HomeNavigationBar extends StatelessWidget {
  const _HomeNavigationBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (_) {},
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Presupuesto',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle, size: 34),
          label: 'Agregar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Historial',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ajustes',
        ),
      ],
    );
  }
}

class TransactionData {
  const TransactionData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    this.isIncome = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final bool isIncome;
}
