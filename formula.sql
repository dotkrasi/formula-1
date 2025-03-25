CREATE TABLE Teams
(
team_id INT PRIMARY KEY IDENTITY(1,1),
team_name NVARCHAR(255),
country NVARCHAR(100),
foundation_year INT
)

CREATE TABLE Drivers
(
driver_id INT PRIMARY KEY IDENTITY(1,1),
first_name NVARCHAR(100),
last_name NVARCHAR(100),
birth_date DATE,
nationality	NVARCHAR(100),
team_id INT FOREIGN KEY REFERENCES Teams(team_id)
)

CREATE TABLE Races
(
race_id INT PRIMARY KEY IDENTITY(1,1),
race_name NVARCHAR(255),
location NVARCHAR(255),
race_date DATE,
season_year INT
)

CREATE TABLE Race_Results
(
result_id INT PRIMARY KEY IDENTITY(1,1),
race_id INT FOREIGN KEY REFERENCES Races(race_id),
driver_id INT FOREIGN KEY REFERENCES Drivers(driver_id),
position INT,
points DECIMAL(5,2),
laps INT,
time TIME
)
