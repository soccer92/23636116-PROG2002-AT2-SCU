/*
	Name: Thomas Carpenter
    Student ID: 23636116
    Description: Query to initiate required elements for the database component of AT2.
*/

/* Initiating database for the first time. */
CREATE DATABASE charityevents_db;
use charityevents_db;

/* Create Organisation Table */
CREATE TABLE organisation (
	org_id					INT AUTO_INCREMENT,
    org_name				VARCHAR(200) NOT NULL,
    org_welcome_message		TEXT NOT NULL,
    org_mission_statement	TEXT NOT NULL,
    org_website				VARCHAR(200) NOT NULL,
    org_phone				VARCHAR(20) NOT NULL,
    org_email				VARCHAR(200) NOT NULL,
    PRIMARY KEY (org_id)
);

/* Create Category Table */
CREATE TABLE category (
	category_id				INT AUTO_INCREMENT,
    category_name			VARCHAR(200) NOT NULL,
    category_desc			VARCHAR(255) NOT NULL,
    PRIMARY KEY (category_id)
);

/* Create Event Table */
CREATE TABLE event (
	event_id				INT AUTO_INCREMENT,
    org_id					INT NOT NULL, -- FOREIGN KEY
    category_id				INT NOT NULL, -- FOREIGN KEY
    event_name				VARCHAR(255) NOT NULL,
    event_desc				TEXT NOT NULL,
    event_start_dt			DATETIME NOT NULL,
    event_end_dt			DATETIME NOT NULL,
    location_city			VARCHAR(100) NOT NULL,
    location_state			VARCHAR(50) NOT NULL,
    location_postcode		VARCHAR(20) NOT NULL,
    location_country		VARCHAR(50) NOT NULL DEFAULT 'Australia',
    goal_amount				DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (event_id),
    FOREIGN KEY (org_id) REFERENCES Organisation(org_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

/* Create Ticket Table */
CREATE TABLE ticket (
	ticket_id				INT AUTO_INCREMENT,
    event_id				INT NOT NULL, -- FOREIGN KEY
    ticket_price			DECIMAL(4,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (ticket_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

/* Create Donation Table */
CREATE TABLE donation (
	donation_id				INT AUTO_INCREMENT,
    event_id				INT NOT NULL, -- FOREIGN KEY
    donation_amount			DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (donation_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

/* Adding data into the tables. */
/* Organisations */
INSERT INTO organisation (org_name, org_welcome_message, org_mission_statement, org_website, org_email, org_phone) VALUES
('Northern Rivers Rail Limited', 'Welcome to Northern Rivers Rail Limited', 'Bringing back trains to the Northern Rivers', 'www.northernriversrail.com.au', 'admin@northernriversrail.com.au', '0422 007 724'),
('Tweed Landcare', 'Welcome to Tweed Landcare', 'Planting one tree at a time', 'www.tweedlc.org.au', 'contact@tweedlc.org.au', '0400 008 754'),
('Lifeline Mid Coast', 'Welcome to Lifeline Mid Coast', 'Caring for our most vulnerable', 'www.lifelinemidcoast.org.au', 'admin@lifelinemidcoast.org.au', '02 6562 1346'),
('Crescent Head Beach Care', 'Welcome to Crescent Head Beach Care', 'Caring for our pristine coastline!', 'www.chbc.org.au', 'chbc@chbc.org.au', '0476 553 221'),
('Gowings Foundation', 'Welcome to Gowings Foundation', 'Caring for our Mid-North Coast communities', 'www.gowings.com.au', 'info@gowings.com.au', '1300 800 500'),
('Arts Mid North Coast', 'Welcome to Arts Mid North Coast', 'Getting arts back into the MNC!', 'www.artsmidnorthcoast.com', 'contact@artsmidnorthcoast.com', '0400 443 862'),
('Carpenter Foundation', 'Welcome to the Carpenter Foundation', 'Improving access for young people on the North Coast', 'www.carpenterfoundation.com', 'contact@carpenterfoundation.com', '0488 774 221'),
('Macleay Valley Revitalisation Project', 'Welcome to the MVRP!', 'Improving the Macleay Valley, one step at a time', 'www.mvrp.org.au', 'info@mvrp.org.au', '0422 334 113');

/* Categories */
INSERT INTO category (category_name, category_desc) VALUES
('Fun Run', 'Community fun run for fundraising'),
('Gala', 'Formal dinner and charity event'),
('Auction', 'Live charity auction'),
('Concert', 'Live music ensemble');

/* Events */
INSERT INTO event (org_id, category_id, event_name, event_desc, event_start_dt, event_end_dt, location_city, location_state, location_postcode, location_country, goal_amount) VALUES
(1, (SELECT category_id FROM category WHERE category_name='Fun Run'), 'Lismore to Yelgun Fun Run', 'A combined 88km fun run from the Country to the Surf and back.', '2025-10-15 10:00:00', '2025-10-15 14:00:00', 'Yelgun', 'NSW', '2483', 'Australia', 100000.00),
(2, (SELECT category_id FROM category WHERE category_name='Concert'), 'Charity Concert with Guy Sebastian', 'A night in concert at Twin Towns with Guy Sebastian, raising much needed funds for Tweed Landcare.', '2025-10-04 19:00:00', '2025-10-04 22:00:00', 'Tweed Heads', 'NSW', '2485', 'Australia', 50000.00),
(3, (SELECT category_id FROM category WHERE category_name='Gala'), 'Gala dinner at the Slim Dusty Centre', 'Gala dinner, entertainment and speakers to support young people with mental health challenges.', '2025-10-01 18:00:00', '2025-10-01 22:00:00', 'Kempsey South', 'NSW', '2440', 'Australia', 15000.00),
