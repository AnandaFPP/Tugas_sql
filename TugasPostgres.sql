-- Membuat Database Baru
CREATE DATABASE learn_query

-- Membuat TABLE dalam database learn_query

-- One to One
CREATE TABLE vehicles (
    id_vehicle INT GENERATED ALWAYS AS IDENTITY,
    brand_name VARCHAR(255) NOT NULL,
    vehicle_type VARCHAR(255) NOT NULL,
    date_made DATE NOT NULL,
    PRIMARY KEY(id_vehicle)
);

CREATE TABLE owners (
    id_owner INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    id_vehicle INT,
    PRIMARY KEY(id_owner),
    FOREIGN KEY(id_vehicle) REFERENCES vehicles(id_vehicle)
);

-- One to Many
CREATE TABLE company (
    id_company INT GENERATED ALWAYS AS IDENTITY,
    company_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_company)
);

CREATE TABLE cars (
    id_car INT GENERATED ALWAYS AS IDENTITY,
    car_name VARCHAR(255) NOT NULL,
    car_type VARCHAR(255) NOT NULL,
    date_made DATE NOT NULL,
    id_company INT,
    PRIMARY KEY(id_car),
    FOREIGN KEY(id_company) REFERENCES company(id_company)
);

-- Many to many
CREATE TABLE broken_cars (
    id_broken_car INT GENERATED ALWAYS AS IDENTITY,
    brand_name VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    km_used INT NOT NULL,
    PRIMARY KEY(id_broken_car)
);

CREATE TABLE workshops (
    id_garage INT GENERATED ALWAYS AS IDENTITY,
    id_broken_car INT,
    id_worker INT,
    reason VARCHAR(511) NOT NULL,
    PRIMARY KEY(id_garage),
    FOREIGN KEY(id_broken_car) REFERENCES broken_cars(id_broken_car),
    FOREIGN KEY(id_worker) REFERENCES worker(id_worker)
);

CREATE TABLE worker (
    id_worker INT GENERATED ALWAYS AS IDENTITY,
    worker_name VARCHAR(255) NOT NULL,
    specialist VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_worker)
);

-- Add some record to table vehicles
INSERT INTO vehicles (brand_name, vehicle_type, date_made)
VALUES('Mitshubishi', 'XPander Cross', '2023-01-06'),
('Honda', 'CBR 250CC', '2021-04-14'),
('Kawasaki', 'H2R', '2022-07-28'),
('Hyundai', 'Creta', '2022-11-14');

-- Add some record to table owners relation to vehicles
INSERT INTO owners (name, email, phone_number, id_vehicle) VALUES
('Matthieu Lengyel', 'Lengyelsonly@gmail.com', '081232939300', 1),
('Abraham Vorkays', 'Abrahamners@gmail.com', 081527797569, 3),
('Angelina Aensley', 'Aensley_slebew@yahoo.co.id', 082177365529, 2),
('Robin Khaaled', 'Khaleedthings@yahoo.com', 085933399898, 4);

-- Add some record to table company
INSERT INTO company (company_name, location, country) VALUES
('Mercedes-benz', 'Arnulfstratte 61, 80636 Munchen', 'Germany');

-- Add some record to table cars relation to company
INSERT INTO cars (car_name, car_type, date_made, id_company) VALUES
('A 200 Hatchback', 'Sedan', '2023-09-11', 1),
('E 53 4Matic Plus', 'Coupe', '2023-03-27', 1),
('GLA 35 4Matic', 'Sedan', '2023-01-15', 1);

-- Add some record to table broken_cars
INSERT INTO broken_cars (brand_name, type, km_used) VALUES
('Honda', 'NSX', 20000), 
('Nissan', 'Skyline R34', 50000),
('Mitsubishi', 'Evolution VII', 70000),
('Mazda', 'RX7', 90000);

-- Add some record to table worker
INSERT INTO worker (worker_name, specialist) VALUES
('Ivanov Thomaslevski', 'Engine part'),
('Sergey Hutchinov', 'Headline part'),
('Tiernan Callaghan', 'Extension engine part'),
('Tsukuyomi Fumiya', 'Internal fuel part');

-- Add some record to table workshops relation to table broken_cars and worker
INSERT INTO workshops (id_broken_car, id_worker, reason) VALUES
(1, 4, 'Noisy Engine, Oil pump failure'),
(2, 3, 'Swerving while breaking, Rattling from rear'),
(3, 1, 'Gearbox problems, Headlight failure'),
(4, 2, 'Power loss, Starting problems');
