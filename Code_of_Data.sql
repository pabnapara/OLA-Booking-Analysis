
CREATE TABLE Ola_Booking_Data (
    Booking_ID BIGINT PRIMARY KEY,
    Booking_Date DATE NOT NULL,
    Booking_Time TIME NOT NULL,
    Booking_Status VARCHAR(20) CHECK (Booking_Status IN ('Success', 'Cancelled by Customer', 'Cancelled by Driver', 'Incomplete')),
    Customer_ID BIGINT NOT NULL,
    Vehicle_Type VARCHAR(20) CHECK (Vehicle_Type IN ('Auto', 'Prime Plus', 'Prime Sedan', 'Mini', 'Bike', 'eBike', 'Prime SUV')),
    Pickup_Location VARCHAR(100) NOT NULL,
    Drop_Location VARCHAR(100) NOT NULL,
    Avg_VTAT INT,  -- (in minutes)
    Avg_CTAT INT,  -- (in minutes)
    Cancelled_Rides_By_Customer BOOLEAN DEFAULT FALSE,
    Reason_Cancel_Customer VARCHAR(100) CHECK (
        Reason_Cancel_Customer IN (
            'Driver is not moving towards pickup location',
            'Driver asked to cancel',
            'AC is not working',
            'Change of plans',
            'Wrong Address',
            NULL
        )
    ),
    Cancelled_Rides_By_Driver BOOLEAN DEFAULT FALSE,
    Reason_Cancel_Driver VARCHAR(100) CHECK (
        Reason_Cancel_Driver IN (
            'Personal & Car related issues',
            'Customer related issue',
            'The customer was coughing/sick',
            'More than permitted people in there',
            NULL
        )
    ),
    Incomplete_Rides BOOLEAN DEFAULT FALSE,
    Reason_Incomplete_Rides VARCHAR(100) CHECK (
        Reason_Incomplete_Rides IN (
            'Customer Demand',
            'Vehicle Breakdown',
            'Other Issue',
            NULL
        )
    ),
    Booking_Value DECIMAL(10,2),
    Ride_Distance DECIMAL(5,2), -- in km
    Driver_Rating DECIMAL(2,1) CHECK (Driver_Rating BETWEEN 1 AND 5),
    Customer_Rating DECIMAL(2,1) CHECK (Customer_Rating BETWEEN 1 AND 5)
);

