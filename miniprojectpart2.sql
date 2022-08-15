-- creating insurance_companies table
CREATE TABLE public.insurance_companies (
insurance_id integer NOT NULL,
name VARCHAR(255) NOT NULL,
price integer,
created_at timestamp with time zone,
offered_insurance VARCHAR(255) NOT NULL,
CONSTRAINT insurance_id_pkey PRIMARY KEY (insurance_id)
);

-- populating insurance_companies table
INSERT INTO insurance_companies VALUES(100, 'State Farm', 1325, '1922-07-07 10:03:00-04', '{Car, Motorcycle, Boat, Motorhome, Off-road vehicle }');
INSERT INTO insurance_companies VALUES(101, 'Allstate', 1222, '1931-06-17 9:03:00-01', '{Car, Home, Life, Renters,Condo, Motorcycle, RV, Business }');
INSERT INTO insurance_companies VALUES(102, 'USAA', 1325, '1922-07-20 2:05:00-01', '{Car}');
INSERT INTO insurance_companies VALUES(103, 'Liberty Mutual', 2145, '1912-07-01 5:03:00-02', '{personal automobile, homeowners, workers compensation, property, commercial automobile, general liability, global specialty, group disability, reinsurance, surety}');
INSERT INTO insurance_companies VALUES(104, 'Farmers', 3212, '1934-01-13 10:03:00-04', '{Auto, Home, Renters, Landlord, Rental, Life, Business, Motorcycle, Recreational, Umbrella }');

-- checking if data inserted correctly
SELECT * FROM insurance_companies;



-- creating users table
CREATE TABLE public.users (
user_id integer NOT NULL,
email character varying(255) NOT NULL,
password character varying(255) NOT NULL,
created_at timestamp with time zone,
CONSTRAINT users_pkey PRIMARY KEY (user_id)
);

-- populating data into users table
INSERT INTO users VALUES (8, 'smile1220@gmail.com', 'chloe101', '2001-02-23 4:02:00-01');
INSERT INTO users VALUES (9, 'konrad90@yahoo.com', 'C7xW41', '2004-04-14 9:23:00-02');
INSERT INTO users VALUES (10, 'sesaym56@gmail.com', '9Oa0D8', '2005-06-06 1:32:00-02');
INSERT INTO users VALUES (11, 'dboyzsk@gmail.com', '46oX0a', '2008-07-19 9:12:00-03');
INSERT INTO users VALUES (12, 'bystrovmiha@gmail.com', 'V92Z0i', '2010-01-25 8:17:00-04');
INSERT INTO users VALUES (13, 'henryboa0@yahoo.com', '50Ezh2', '2021-06-29 7:18:00-04');
INSERT INTO users VALUES (14, 'laurelol0@gmail.com', '4zFn41', '2005-02-27 2:06:00-02');
INSERT INTO users VALUES (15, 'carolos@yahoo.com', '5AdC32', '2009-03-05 1:08:00-06');
INSERT INTO users VALUES (16, 'princess90@columbia.com', '14M5wb', '2001-04-08 6:02:00-02');
INSERT INTO users VALUES (17, 'ray123@nyu.com', 'H479zh', '2000-09-19 8:09:00-02');
INSERT INTO users VALUES (18, 'alan89@yahoo.com', '2J86nl', '2006-12-28 2:31:00-03');
INSERT INTO users VALUES (19, 'aria2133@yahoo.com', 'password101', '2009-11-01 4:13:00-04');
INSERT INTO users VALUES (20, 'felixlu@gmail.com', 'cupcake321', '2000-01-02 1:18:00-05');

-- checking if data is in table
SELECT * FROM users;



-- creating insurance_purchases table
CREATE TABLE public.insurance_purchases (
purchase_id integer NOT NULL,
name character varying(255) NOT NULL,
address character varying(255) NOT NULL,
state character varying(2) NOT NULL,
created_at timestamp with time zone,
zipcode integer,
user_id integer,
CONSTRAINT insurance_purchases_id_pkey PRIMARY KEY (purchase_id),
CONSTRAINT insurance_purchases_user_id_fkey FOREIGN KEY (user_id)
REFERENCES public.users(user_id) MATCH SIMPLE
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);

-- populating data
INSERT INTO insurance_purchases VALUES(500, 'Harold Blue', '123 Ronald St', 'NY', '2001-01-02 1:18:00-05', 11201, 20);
INSERT INTO insurance_purchases VALUES(501, 'Leandra Eleutherios', '123 Ronald St', 'NY', '2002-01-02 2:18:00-05', 11101, 19);
INSERT INTO insurance_purchases VALUES(502, 'Stefaniya Bronte', '123 Ronald St', 'NY', '2003-01-02 2:18:00-05', 13455, 18);
INSERT INTO insurance_purchases VALUES(503, 'Larisa Alisa', '123 Ronald St', 'AZ', '2004-01-02 3:18:00-05', 13435, 17);
INSERT INTO insurance_purchases VALUES(504, 'Amina Abdullo', '123 Ronald St', 'AL', '2005-01-02 4:18:00-05', 18494, 16);
INSERT INTO insurance_purchases VALUES(505, 'Lyssa Timo', '123 Ronald St', 'NY', '2006-01-02 5:18:00-05', 11201, 15);
INSERT INTO insurance_purchases VALUES(506, 'Dechen Paulus', '123 Ronald St', 'AZ', '2007-01-02 6:18:00-05', 11204, 14);
INSERT INTO insurance_purchases VALUES(507, 'Orli Nizhóní', '123 Ronald St', 'NY', '2008-01-02 7:18:00-05', 11207, 13);
INSERT INTO insurance_purchases VALUES(508, 'Salome Sesto', '123 Ronald St', 'MD', '2009-01-02 8:18:00-05', 11208, 12);
INSERT INTO insurance_purchases VALUES(509, 'Paviel Hamid', '123 Ronald St', 'AL', '2010-01-02 9:18:00-05', 11321, 11);
INSERT INTO insurance_purchases VALUES(510, 'Cali Gentian', '123 Ronald St', 'AK', '2011-01-02 10:18:00-05', 11278, 10);
INSERT INTO insurance_purchases VALUES(511, 'Hari Patya', '123 Ronald St', 'NY', '2012-01-02 1:18:00-05', 11283, 9);
INSERT INTO insurance_purchases VALUES(512, 'Antonije Hubert', '123 Ronald St', 'AZ', '2013-01-02 2:18:00-05', 11214, 8);



-- creating purchase_items table
CREATE TABLE public.purchase_items (
purchase_items_id integer NOT NULL,
purchase_id integer NOT NULL,
insurance_id integer NOT NULL,
household_member integer,
status character varying(255) NOT NULL,
CONSTRAINT purchase_items_insurance_id_fkey FOREIGN KEY(insurance_id)
REFERENCES public.insurance_companies(insurance_id) MATCH SIMPLE
   ON UPDATE NO ACTION
   ON DELETE NO ACTION,

CONSTRAINT purchase_items_purchase_id_fkey FOREIGN KEY (purchase_id)
REFERENCES public.insurance_purchases(purchase_id) MATCH SIMPLE
   ON UPDATE NO ACTION
   ON DELETE NO ACTION
);

-- populating data
INSERT INTO purchase_items VALUES(900, 512, 100, 3, 'Covered');
INSERT INTO purchase_items VALUES(901, 511, 101, 5, 'Expired');
INSERT INTO purchase_items VALUES(902, 510, 102, 1, 'Received Application');
INSERT INTO purchase_items VALUES(903, 509, 103, 9, 'Covered');
INSERT INTO purchase_items VALUES(904, 508, 104, 2, 'Expired');
INSERT INTO purchase_items VALUES(905, 507, 102, 2, 'Covered');
INSERT INTO purchase_items VALUES(906, 506, 101, 1, 'Expired');
INSERT INTO purchase_items VALUES(907, 505, 100, 2, 'Covered');
INSERT INTO purchase_items VALUES(908, 504, 100, 3, 'Received Application');
INSERT INTO purchase_items VALUES(909, 503, 104, 5, 'Expired');
INSERT INTO purchase_items VALUES(910, 502, 101, 6, 'Received Application');
INSERT INTO purchase_items VALUES(911, 501, 102, 7, 'Expired');
INSERT INTO purchase_items VALUES(912, 500, 100, 1, 'Received Application');


-- Form any 5 SQL QUERIES:

-- shows the oldest purchase made by a user with a gmail email address
SELECT * FROM insurance_purchases
WHERE user_id IN (SELECT user_id FROM users
WHERE email LIKE '%@gmail.com')
ORDER BY created_at;

-- finds all the users' emails who made at least one purchase from the state of Arizona

SELECT name, email
FROM users AS u
JOIN insurance_purchases AS ip
ON u.user_id = ip.user_id
WHERE state = 'AZ';

-- this also works
SELECT * FROM users WHERE user_id IN
(SELECT user_id FROM insurance_purchases WHERE state = 'AZ');

-- finds the average household members that each insurance was purchased in
SELECT ic.insurance_id, AVG(household_member)
FROM insurance_companies AS ic
LEFT OUTER JOIN purchase_items AS pi
ON ic.insurance_id = pi.insurance_id
GROUP BY ic.insurance_id;

-- finds all the names associated with purchases made after 2008-01-01 + emails associated with users made after 2010-01-01
SELECT created_at, name FROM insurance_purchases
WHERE created_at > '2008-01-01'
UNION
SELECT created_at, email FROM users
WHERE created_at > '2010-01-01';

-- categorizes each purchase based on it’s coast
SELECT state,
	CASE
		WHEN (state = 'NY' or state = 'AZ') THEN 'West Coast'
		WHEN (state = 'AL') THEN 'South East'
		WHEN (state = 'MD') THEN 'East Coast'
		WHEN (state = 'AK') THEN 'North West'
	ELSE 'Other'
END FROM insurance_purchases;
