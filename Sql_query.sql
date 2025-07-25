create database OLA;
use ola;

-- 1. Retrieve all successful bookings:
create view successful_bookings as
select * from booking
where booking_Status="Success";
-- 1. Retrieve all successful bookings:
select * from successful_bookings;


-- 2. Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
select Vehicle_Type,avg(Ride_Distance)
as avg_distance from(booking)
group by Vehicle_Type;
-- 2. Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;


-- 3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
select count(*) from booking
where Booking_Status="Canceled by Customer";
-- 3. Get the total number of cancelled rides by customers:
select * from cancelled_rides_by_customers;


-- 4. List the top 5 customers who booked the highest number of rides:
create view Top_5_customers as
select Customer_ID, count(Booking_ID) as Total_rides
from booking
group by Customer_ID
order by Total_rides desc limit 5;
-- 4. List the top 5 customers who booked the highest number of rides:
select * from Top_5_customers ;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_drivers_due_to_personal_and_car_related_issues as
select count(*) from booking
where Canceled_Rides_by_Driver="Personal & Car related issue";
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from cancelled_by_drivers_due_to_personal_and_car_related_issues ;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_rating as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from booking where Vehicle_Type="Prime Sedan";
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from max_min_driver_rating;


-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment as
select * from booking where Payment_Method="UPI";
-- 7. Retrieve all rides where payment was made using UPI:
select * from UPI_Payment;

-- 8. Find the average customer rating per vehicle type:
create view Avg_Rating_of_Customer as
select Vehicle_Type,avg(Customer_Rating) as average_customer_rating
from booking
group by Vehicle_Type;
-- 8. Find the average customer rating per vehicle type:
select * from Avg_Rating_of_Customer;


-- 9. Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value as
select sum(Booking_Value) as total_successful_value
from booking
where Booking_status="Success";
-- 9. Calculate the total booking value of rides completed successfully:
select * from total_successful_ride_value;


-- 10. List all incomplete rides along with the reason:
create view Reason_of_incomplete_ride as
select Booking_ID,Incomplete_Rides_Reason
from booking
where Incomplete_Rides="Yes";
-- 10. List all incomplete rides along with the reason:
select * from Reason_of_incomplete_ride;


