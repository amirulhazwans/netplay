import 'package:flutter/material.dart';

class BadmintonReservation extends StatefulWidget {
  @override
  _BadmintonReservationState createState() => _BadmintonReservationState();
}

class _BadmintonReservationState extends State<BadmintonReservation> {
  String filter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
                color: Colors.grey[200], // Background color
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter a Name Place',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Same as container
                    borderSide: BorderSide.none, // No border
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    filter = value;
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 1, // Only one item for confirmation dialog
                itemBuilder: (context, index) {
                  if (filter.isEmpty) {
                    return SizedBox.shrink(); // Hide if filter is empty
                  } else {
                    return ListTile(
                      title: Text('Court $filter'),
                      subtitle: Text('Available'),
                      onTap: () {
                        _showConfirmationDialog('Court $filter');
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(String court) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Court Booking Confirmation'),
          content: Text('You have booked $court.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
