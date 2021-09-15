                            Flight Ticket Booking System Database Design

1.Using this system,Passenger can purchase and book tickets for their flights.

ticket will look this picture given below:
![flight_ticket](https://user-images.githubusercontent.com/74998700/133491786-26c22ef8-7f42-43a5-af18-21bd8ad370bb.PNG)

2.This Design consist of 4 tables here:
(a)Passenger table
(b)Ticket table
(c)Flight table
(d)Airport table
(e)Airline table
(f)FlightClass table
3.A passenger can book multiple tickets but a ticket can be issued to only one passenger, hence connecting Passenger table
and Ticket table with one to many relationship.

4.Now each ticket can be book for a flight but a flight can have many different tickets so further connecting Flight table
and Ticket table with one to many relation.

5.For Flight and airport we know each airport can host many different flights but each flight works with two and only two airports,it can be treated as many to many relationship but it is not supported by relational databases.In this instead of using anotherintermediate table two attributes are added (DepartureAirportId and ArrivalAirportId) which will be acting as Foreign keys.

6.Each airline has many flights but each flight can be operated by only one flight so connecting Airline table to Flights table
with one to many relationship.

7.FlightClass and Ticket are connected with one to many as a ticket can have only one flight class while there many classes
for tickets.

Logical Model of Database:
![logical_model](https://user-images.githubusercontent.com/74998700/133492137-2ba706bb-5869-4291-9346-64469230464b.PNG)

Physical Model of Database:
![physical_model](https://user-images.githubusercontent.com/74998700/133492288-d41fd377-ecdb-45cd-8cf1-20ed64d63778.PNG)
