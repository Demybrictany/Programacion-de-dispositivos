import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// APLICACIÓN
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agregar dinero',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AddMoneyPage(),
    );
  }
}

class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [

                  // Botón regresar
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 24,
                    ),
                  ),

                  // Título centrado
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Agregar dinero',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Espacio para mantener el título centrado
                  const SizedBox(width: 38),
                ],
              ),

              const SizedBox(height: 28),

              // ------------------------------------------------
              // SELECT CARD
              // ------------------------------------------------

              const Text(
                'Seleccionar tarjeta',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Tarjetas horizontales
              SizedBox(
                height: 95,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    tarjeta(
                      color: const Color(0xFFB8F23A),
                      tipo: 'Tarjeta de débito',
                      numero: '4568',
                      activa: true,
                    ),

                    const SizedBox(width: 10),

                    tarjeta(
                      color: const Color(0xFF222222),
                      tipo: 'Tarjeta de crédito',
                      numero: '2478',
                      activa: false,
                    ),

                    const SizedBox(width: 10),

                    tarjeta(
                      color: const Color(0xFF444444),
                      tipo: 'Tarjeta bancaria',
                      numero: '****',
                      activa: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Agregar dinero a Neobank',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              opcion(
                icono: Icons.attach_money,
                texto: 'Mover tu depósito directo',
              ),

              opcion(
                icono: Icons.swap_horiz,
                texto: 'Transferir desde otros bancos',
              ),

              opcion(
                icono: Icons.apple,
                texto: 'Apple Pay',
              ),

              opcion(
                icono: Icons.credit_card_outlined,
                texto: 'Tarjeta de débito/crédito',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget tarjeta({
  required Color color,
  required String tipo,
  required String numero,
  required bool activa,
}) {
  return Container(
    width: 92,
    padding: const EdgeInsets.all(10),

    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(17),

      // tarjeta seleccionada
      border: activa
          ? Border.all(
              color: Colors.black,
              width: 3,
            )
          : null,
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: activa ? Colors.black : Colors.white,
        shape: BoxShape.circle,
      ),
    ),

    if (tipo == 'Tarjeta de credito')
      const Text(
        'VISA',
        style: TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
  ],
),

        const Spacer(),

        Text(
          tipo,
          style: TextStyle(
            color: tipo == 'Tarjeta de débito'
                ? Colors.black54
                : Colors.white70,
            fontSize: 11,
          ),
        ),

        Text(
          '•••• $numero',
          style: TextStyle(
            color: tipo == 'Tarjeta de débito'
                ? Colors.black
                : Colors.white,
            fontSize: 11,
          ),
        ),
      ],
    ),
  );
}

Widget opcion({
  required IconData icono,
  required String texto,
}) {
  return Container(
    height: 52,

    margin: const EdgeInsets.only(bottom: 8),

    padding: const EdgeInsets.symmetric(
      horizontal: 14,
    ),

    decoration: BoxDecoration(
      color: const Color(0xFFF3F4F4),
      borderRadius: BorderRadius.circular(12),
    ),

    child: Row(
      children: [

        // Icono
        Icon(
          icono,
          size: 19,
          color: const Color(0xFF333333),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF444444),
            ),
          ),
        ),

        // Flecha
        const Icon(
          Icons.chevron_right,
          size: 22,
          color: Colors.grey,
        ),
      ],
    ),
  );
}