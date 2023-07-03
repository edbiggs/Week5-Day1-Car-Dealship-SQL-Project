CREATE TABLE salesperson(
    salesperson_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25)
);

CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25)
);

CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    credit_score INTEGER
);

CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    year INTEGER,
    make VARCHAR(25),
    model VARCHAR(25),
    color VARCHAR(25),
    price INTEGER
);

CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    salesperson_id INTEGER,
    customer_id INTEGER,
    car_id INTEGER,
    sale_date DATE,
    total_price NUMERIC(8,2)
);

CREATE TABLE service_ticket_mechanic(
    service_ticket_mechanic_id SERIAL PRIMARY KEY,
    service_ticket_id INTEGER, 
    mechanic_id INTEGER,
    FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);


CREATE TABLE service_ticket(
    service_ticket_id SERIAL PRIMARY KEY, 
    service_history_id INTEGER, 
    service_ticket_mechanic_id INTEGER,
    price NUMERIC(8,2),
    service VARCHAR(150),
    service_date DATE,
    FOREIGN KEY (service_history_id) REFERENCES service_history(service_history_id)
    FOREIGN KEY (service_ticket_mechanic_id) REFERENCES service_ticket_mechanic(service_ticket_mechanic_id)
);

ALTER TABLE service_ticket
ADD FOREIGN KEY (service_ticket_mechanic_id) REFERENCES service_ticket_mechanic(service_ticket_mechanic_id)
ADD FOREIGN KEY (service_history_id) REFERENCES service_history(service_history_id)


CREATE TABLE service_history(
    service_history_id SERIAL PRIMARY KEY,
    car_id INTEGER,
    customer_id INTEGER,
    service_ticket_id INTEGER,
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id)
);