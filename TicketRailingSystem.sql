-- Create the Customer table
CREATE TABLE Customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone_number VARCHAR(15) NOT NULL
);

-- Create the Train table
CREATE TABLE Train (
  train_id INT PRIMARY KEY,
  train_number VARCHAR(10) NOT NULL,
  train_name VARCHAR(50) NOT NULL,
  departure_station VARCHAR(50) NOT NULL,
  arrival_station VARCHAR(50) NOT NULL
);

-- Create the Ticket table
CREATE TABLE Ticket (
  ticket_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  train_id INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  purchase_date_and_time DATETIME NOT NULL,
  seat_number INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (train_id) REFERENCES Train(train_id)
);

-- Create the Schedule table
CREATE TABLE Schedule (
  schedule_id INT PRIMARY KEY,
  train_id INT NOT NULL,
  departure_time TIME NOT NULL,
  arrival_time TIME NOT NULL,
  days_of_week VARCHAR(50) NOT NULL,
  FOREIGN KEY (train_id) REFERENCES Train(train_id)
);

-- Create the Station table
CREATE TABLE Station (
  station_id INT PRIMARY KEY,
  station_name VARCHAR(50) NOT NULL,
  location VARCHAR(100) NOT NULL
);

-- Create the Employee table
CREATE TABLE Employee (
  employee_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  job_title VARCHAR(50) NOT NULL
);

-- Create the Employee_Ticket table to represent the many-to-many relationship between Employee and Ticket
CREATE TABLE Employee_Ticket (
  employee_id INT NOT NULL,
  ticket_id INT NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
  FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id)
);
