SELECT * FROM dbo.DimTerritory

----------------------------------------------------------------------------------------------------------------------------First batch
INSERT INTO dbo.DimTerritory (TerritoryKey,City,State,Country)
VALUES (30000,'Albuquerque','New Mexico','United States'),
(30001,'Anaheim','California','United States'),
(30002,'Antioch','California','United States'),
(30003,'Apple Valley','California','United States'),
(30004,'Arvada','Colorado','United States'),
(30005,'Auburn','Washington','United States'),
(30006,'Aurora','Colorado','United States'),
(30007,'Avondale','Arizona','United States'),
(30008,'Bakersfield','California','United States'),
(30009,'Bellevue','Washington','United States'),
(30010,'Bellingham','Washington','United States'),
(30011,'Billings','Montana','United States'),
(30012,'Boise','Idaho','United States'),
(30013,'Bozeman','Montana','United States'),
(30014,'Brentwood','California','United States'),
(30015,'Broomfield','Colorado','United States'),
(30016,'Bullhead City','Arizona','United States'),
(30017,'Burbank','California','United States'),
(30018,'Caldwell','Idaho','United States'),
(30019,'Camarillo','California','United States'),
(30020,'Carlsbad','New Mexico','United States'),
(30021,'Chandler','Arizona','United States'),
(30022,'Cheyenne','Wyoming','United States'),
(30023,'Chico','California','United States'),
(30024,'Chula Vista','California','United States'),
(30025,'Citrus Heights','California','United States'),
(30026,'Clovis','New Mexico','United States'),
(30027,'Coachella','California','United States'),
(30028,'Colorado Springs','Colorado','United States'),
(30029,'Commerce City','Colorado','United States'),
(30030,'Concord','California','United States'),
(30031,'Costa Mesa','California','United States'),
(30032,'Covington','Washington','United States'),
(30033,'Danville','California','United States'),
(30034,'Davis','California','United States'),
(30035,'Denver','Colorado','United States'),
(30036,'Des Moines','Washington','United States'),
(30037,'Draper','Utah','United States'),
(30038,'Dublin','California','United States'),
(30039,'Edmonds','Washington','United States'),
(30040,'El Cajon','California','United States'),
(30041,'Encinitas','California','United States'),
(30042,'Englewood','Colorado','United States'),
(30043,'Escondido','California','United States'),
(30044,'Eugene','Oregon','United States'),
(30045,'Everett','Washington','United States'),
(30046,'Fairfield','California','United States'),
(30047,'Farmington','New Mexico','United States'),
(30048,'Fort Collins','Colorado','United States'),
(30049,'Fresno','California','United States'),
(30050,'Gilbert','Arizona','United States'),
(30051,'Glendale','Arizona','United States'),
(30052,'Great Falls','Montana','United States'),
(30053,'Greeley','Colorado','United States'),
(30054,'Gresham','Oregon','United States'),
(30055,'Helena','Montana','United States'),
(30056,'Henderson','Nevada','United States'),
(30057,'Hesperia','California','United States'),
(30058,'Hillsboro','Oregon','United States'),
(30059,'Huntington Beach','California','United States'),
(30060,'Inglewood','California','United States'),
(30061,'Kent','Washington','United States'),
(30062,'La Mesa','California','United States'),
(30063,'La Quinta','California','United States'),
(30064,'Laguna Niguel','California','United States'),
(30065,'Lake Elsinore','California','United States'),
(30066,'Lake Forest','California','United States'),
(30067,'Lakewood','California','United States'),
(30068,'Lancaster','California','United States'),
(30069,'Las Cruces','New Mexico','United States'),
(30070,'Las Vegas','Nevada','United States'),
(30071,'Layton','Utah','United States'),
(30072,'Lehi','Utah','United States'),
(30073,'Lewiston','Idaho','United States'),
(30074,'Littleton','Colorado','United States'),
(30075,'Lodi','California','United States'),
(30076,'Logan','Utah','United States'),
(30077,'Long Beach','California','United States'),
(30078,'Longmont','Colorado','United States'),
(30079,'Longview','Washington','United States'),
(30080,'Los Angeles','California','United States'),
(30081,'Louisville','Colorado','United States'),
(30082,'Loveland','Colorado','United States'),
(30083,'Manteca','California','United States'),
(30084,'Marysville','Washington','United States'),
(30085,'Medford','Oregon','United States'),
(30086,'Meridian','Idaho','United States'),
(30087,'Mesa','Arizona','United States'),
(30088,'Mission Viejo','California','United States'),
(30089,'Missoula','Montana','United States'),
(30090,'Modesto','California','United States'),
(30091,'Montebello','California','United States'),
(30092,'Moreno Valley','California','United States'),
(30093,'Morgan Hill','California','United States'),
(30094,'Murray','Utah','United States'),
(30095,'Murrieta','California','United States'),
(30096,'North Las Vegas','Nevada','United States'),
(30097,'Oakland','California','United States'),
(30098,'Oceanside','California','United States'),
(30099,'Olympia','Washington','United States'),
(30100,'Ontario','California','United States'),
(30101,'Orem','Utah','United States'),
(30102,'Oxnard','California','United States'),
(30103,'Parker','Colorado','United States'),
(30104,'Pasadena','California','United States'),
(30105,'Pasco','Washington','United States'),
(30106,'Peoria','Arizona','United States'),
(30107,'Phoenix','Arizona','United States'),
(30108,'Pico Rivera','California','United States'),
(30109,'Pleasant Grove','Utah','United States'),
(30110,'Pocatello','Idaho','United States'),
(30111,'Pomona','California','United States'),
(30112,'Portland','Oregon','United States'),
(30113,'Provo','Utah','United States'),
(30114,'Pueblo','Colorado','United States'),
(30115,'Rancho Cucamonga','California','United States'),
(30116,'Redding','California','United States'),
(30117,'Redlands','California','United States'),
(30118,'Redmond','Oregon','United States'),
(30119,'Redmond','Washington','United States'),
(30120,'Redondo Beach','California','United States'),
(30121,'Redwood City','California','United States'),
(30122,'Reno','Nevada','United States'),
(30123,'Renton','Washington','United States'),
(30124,'Rio Rancho','New Mexico','United States'),
(30125,'Riverside','California','United States'),
(30126,'Roseville','California','United States'),
(30127,'Sacramento','California','United States'),
(30128,'Salem','Oregon','United States'),
(30129,'Salinas','California','United States'),
(30130,'Salt Lake City','Utah','United States'),
(30131,'San Bernardino','California','United States'),
(30132,'San Clemente','California','United States'),
(30133,'San Diego','California','United States'),
(30134,'San Francisco','California','United States'),
(30135,'San Gabriel','California','United States'),
(30136,'San Jose','California','United States'),
(30137,'San Luis Obispo','California','United States'),
(30138,'San Mateo','California','United States'),
(30139,'Santa Ana','California','United States'),
(30140,'Santa Barbara','California','United States'),
(30141,'Santa Clara','California','United States'),
(30142,'Santa Fe','New Mexico','United States'),
(30143,'Santa Maria','California','United States'),
(30144,'Scottsdale','Arizona','United States'),
(30145,'Seattle','Washington','United States'),
(30146,'Sierra Vista','Arizona','United States'),
(30147,'Sparks','Nevada','United States'),
(30148,'Spokane','Washington','United States'),
(30149,'Springfield','Oregon','United States'),
(30150,'Stockton','California','United States'),
(30151,'Sunnyvale','California','United States'),
(30152,'Temecula','California','United States'),
(30153,'Tempe','Arizona','United States'),
(30154,'Thornton','Colorado','United States'),
(30155,'Thousand Oaks','California','United States'),
(30156,'Tigard','Oregon','United States'),
(30157,'Torrance','California','United States'),
(30158,'Tucson','Arizona','United States'),
(30159,'Twin Falls','Idaho','United States'),
(30160,'Vacaville','California','United States'),
(30161,'Vallejo','California','United States'),
(30162,'Vancouver','Washington','United States'),
(30163,'Visalia','California','United States'),
(30164,'West Jordan','Utah','United States'),
(30165,'Westminster','California','United States'),
(30166,'Whittier','California','United States'),
(30167,'Woodland','California','United States'),
(30168,'Yucaipa','California','United States'),
(30169,'Yuma','Arizona','United States')
