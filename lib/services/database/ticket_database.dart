import 'package:flutter/material.dart';

import '../../model/booked_ticket.dart';
import '../../model/ticket_detail_model.dart';

class TicketsQuery {
  final ticket = Ticket();

  Future<void> insertTicketINDB(TicketDetail data) async {
    try {
      ticket.ticketID = DateTime.now().millisecondsSinceEpoch; //PK
      ticket.movieID = data.movieID;
      ticket.customerName = data.customerName;
      ticket.email = data.email;
      ticket.customerID = data.customerID;
      ticket.contactNumber = data.contactNumber;
      ticket.movieTitle = data.movieTitle;
      ticket.movieStartTime = data.movieStartTime;
      ticket.movieEndTime = data.movieEndTime;
      await ticket.save();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Ticket>> getTiketsList() async {
    return await ticket.select().toList();
  }

  Future<Ticket?> getMovieByID(int id) async {
    final result = await ticket.select().movieID.equals(id).toSingle();
    return result;
  }

  Future<void> deleteAll() async {
    await ticket.select().delete();
  }
}
