/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon%';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = 't';
SELECT * from animals WHERE name <> 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Transactions
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species = '';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPONT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- new queries

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(neutered), neutered FROM animals GROUP BY neutered;
SELECT MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight, species FROM animals GROUP BY species;
SELECT AVG(escape_attempts) AS avg_escape_attempts, species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species

-- animals that to Melody Pond?
SELECT name, full_name FROM animals INNER JOIN owners ON owners.id = owner_id AND owners.id = 4;

-- List of all animals that are pokemon (their type is Pokemon)
SELECT animals.name, species.name FROM animals INNER JOIN species ON species.id = species_id AND species.id = 1;

-- List of all owners and their animals, remember to include those that don't own any animal
SELECT owners.id, owners.full_name, animals.name As Animals FROM owners FULL OUTER JOIN animals ON owners.id = owner_id;

-- How many animals are their per species?
SELECT species.name AS species, COUNT(*) FROM animals INNER JOIN species ON species.id = species_id GROUP BY species;

-- List all Digimon owned by Jennifer Orwell
SELECT species.name, full_name, animals.name FROM animals
INNER JOIN species ON species.id = species_id AND species.name = 'Digimon'
INNER JOIN owners ON owners.id = owner_id AND owners.id = 2;

-- List all animals owned by Dean Winchester that haven't tried to escape
SELECT * FROM animals
INNER JOIN owners ON owners.id = owner_id AND owners.full_name = 'Dean Winchester'
WHERE escape_attempts = 0;

-- Who owns the most animals
SELECT owners.full_name AS fullName, COUNT(*) FROM owners
INNER JOIN animals ON owners.id = owner_id GROUP BY fullName;

-- Who was the last animal seen by William Tatcher?
SELECT a.name AS "Animal", c.name AS "Vet" FROM animals a
JOIN visits b ON a.id = b.animals_id
JOIN vets c ON c.id = b.vets_id
WHERE c.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;


-- How many different animals did Stephanie Mendez see?
SELECT v.name AS "Vet", a.name AS "Animal", COUNT(a.name) AS "Visit Count" FROM visits vi
JOIN animals a ON vi.animals_id = a.id 
JOIN vets v ON vi.vets_id = v.id 
WHERE v.name = 'Stephanie Mendez'
GROUP BY v.name, a.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT v.name AS "Vet", s.name AS "Species" FROM specializations sp
RIGHT JOIN vets v ON sp.vets_id = v.id
LEFT JOIN species s ON sp.species_id = s.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT v.name AS "Vet", a.name AS "Animal", COUNT(a.name) AS "Visit Count" FROM visits vi
JOIN vets v ON vi.vets_id = v.id 
JOIN animals a ON vi.animals_id = a.id
WHERE v.name = 'Stephanie Mendez' AND vi.date_of_visit BETWEEN '2020-04-01' and '2020-08-30'
GROUP BY a.name, v.name;

-- What animal has the most visits to vets?
SELECT a.name AS "Animal", v.name AS "Vet", count(a.name) AS visit_count from visits vi
JOIN animals a on a.id = vi.animals_id
JOIN vets v on v.id = vi.vets_id
GROUP BY a.name, v.name
ORDER by visit_count DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT a.name AS "Animal", v.name AS "Vet" from visits vi
JOIN animals a ON vi.animals_id = a.id
JOIN vets v ON vi.vets_id = v.id
WHERE v.name = 'Maisy Smith'
ORDER BY vi.date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT a.*, v.*, vi.date_of_visit FROM visits vi
JOIN animals a ON vi.animals_id = a.id 
JOIN vets v ON vi.vets_id = v.id
ORDER BY vi.date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT count(*) AS "Unspecialized Visits To Vet" FROM visits
LEFT JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE specializations.species_id IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT a.name AS "Animal", s.name AS "Species Name", count(*) AS total_visits FROM visits vi
JOIN animals a ON vi.animals_id = a.id
JOIN vets v ON vi.vets_id = v.id
JOIN species s ON s.id = a.species_id
WHERE v.name = 'Maisy Smith'
GROUP BY s.name, a.name
ORDER BY total_visits DESC;