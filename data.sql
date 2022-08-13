/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23),
(2, 'Gabumon', '2018-11-15', 2, TRUE, 8),
(3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04),
(4, 'Devimon', '2017-05-12', 5, TRUE, 11);

-- TABLE update

INSERT INTO animals VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11),
(6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7),
(7, 'Squirtle', '1993-6-02', 3, FALSE, -12.13),
(8, 'Angemon', '2005-06-12', 1, TRUE, -45),
(9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);
(10, 'Blossom', '1998-10-13', 3, TRUE, 17),
(11, 'Ditto', '2020-50-14', 4, TRUE, 22);

/* Owner table data */

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

/* Species table data */
INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');

/* Update the species_id in animals */

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon%';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

/* Update the owner_id in animals */

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN( 'Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN( 'Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN( 'Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN( 'Angemon', 'Boarmon');

-- Insert the following data for vets
INSERT INTO vets (name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

-- Insert the following data for specialties
INSERT INTO specializations VALUES (species_id, vets_id)
(1, 2),
(2, 3),
(1, 3),
(2, 4);

insert into visits (animals_id, vets_id, date_of_visit) values
(
  (select id from animals where name='Agumon'),
  (select id from vets where name='William Tatcher'),
  TO_DATE('May 24, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Agumon'),
  (select id from vets where name='Stephanie Mendez'),
  TO_DATE('Jul 22, 2020', 'Mon DD, YYYY')
),
(
(select id from animals where name='Gabumon'),
(select id from vets where name='Jack Harkness'),
TO_DATE('Feb 2, 2021', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Pikachu'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('Jan 5, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Pikachu'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('Mar 8, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Pikachu'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('May 14, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Devimon'),
  (select id from vets where name='Stephanie Mendez'),
  TO_DATE('May 4, 2021', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Charmander'),
  (select id from vets where name='Jack Harkness'),
  TO_DATE('Feb 24, 2021', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Plantmon'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('Dec 21, 2019', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Plantmon'),
  (select id from vets where name='William Tatcher'),
  TO_DATE('Aug 10, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Plantmon'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('Apr 7, 2021', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Squirtle'),
  (select id from vets where name='Stephanie Mendez'),
  TO_DATE('Sep 29, 2019', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Angemon'),
  (select id from vets where name='Jack Harkness'),
  TO_DATE('Oct 3, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Angemon'),
  (select id from vets where name='Jack Harkness'),
  TO_DATE('Nov 4, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Boarmon'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('Jan 24, 2019', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Boarmon'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('May 15, 2019', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Boarmon'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('Feb 27, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Boarmon'),
  (select id from vets where name='Maisy Smith'),
  TO_DATE('Aug 3, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Blossom'),
  (select id from vets where name='Stephanie Mendez'),
  TO_DATE('May 24, 2020', 'Mon DD, YYYY')
),
(
  (select id from animals where name='Blossom'),
  (select id from vets where name='William Tatcher'),
  TO_DATE('Jan 11, 2021', 'Mon DD, YYYY')
);