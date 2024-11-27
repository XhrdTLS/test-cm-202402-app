import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_reclamo/features/domain/entities/ticket_entity.dart';

import '../../../../../core/core.dart';
import '../screens/screens.dart';
import 'widgets.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final VoidCallback onDelete;

  const TicketCard({
    required this.ticket,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String tipo = ticket.type.name;
    String asunto = ticket.subject;
    String estado = ticket.status.name;
    String mensaje = ticket.message;
    String categoria = ticket.category.name;

    final brightness = Theme.of(context).brightness;
    Color tipoColor;
    Color textColor;
    IconData typeIcon;
    
    switch (tipo) {
      case 'CLAIM':
        tipoColor = brightness == Brightness.light
            ? AppTheme.lightOrange
            : AppTheme.darkOrange;
        textColor = AppTheme.darkOrange;
        typeIcon = Icons.warning_rounded;
        break;
      case 'SUGGESTION':
        tipoColor = brightness == Brightness.light
            ? AppTheme.lightGreen
            : AppTheme.darkGreen;
        textColor = AppTheme.darkGreen;
        typeIcon = Icons.lightbulb_rounded;
        break;
      case 'INFORMATION':
        tipoColor = brightness == Brightness.light
            ? AppTheme.lightBlue
            : AppTheme.darkBlue;
        textColor = AppTheme.darkBlue;
        typeIcon = Icons.info_rounded;
        break;
      default:
        tipoColor = AppTheme.lightGray;
        textColor = AppTheme.lightGray;
        typeIcon = Icons.help_rounded;
    }

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ViewTicketScreen(ticket: ticket),
        );
      },
      onDoubleTap: () async {
        final manageTicket = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditTicketScreen(ticket: ticket),
            )
        );
        if (manageTicket != null) {
          // Handle the updated ticket (e.g., save it to the repository)
        }

      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              left: BorderSide(color: tipoColor, width: 4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          typeIcon,
                          color: textColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          categoria,
                          style: StyleText.header.copyWith(
                            color: textColor,
                          ),)
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: tipoColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        estado,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  asunto,
                  style: StyleText.description
                ),
                if (mensaje.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      mensaje,
                      style: StyleText.body
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

