/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer PRIMARY KEY NOT NULL,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL
);

-- add new column to the animals TABLE

ALTER TABLE animals ADD species varchar;

CREATE TABLE owners (
    id integer PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name varchar NOT NULL,
    age integer
);

CREATE TABLE species (
    id INT PRIMARY KEY NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar NOT NULL
);

ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id integer,
ADD COLUMN owner_id  integer;

ALTER TABLE animals
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Create a table named vets with the following columns
CREATE TABLE vets (
id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name varchar NOT NULL,
age integer NOT NULL,
date_of_graduation date NOT NULL);

-- Create a "join table" called specializations to handle this relationship
CREATE TABLE specializations (
species_id INT NOT NULL,
vets_id INT NOT NULL,
CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE,
CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE
);

CREATE TABLE visits (
animals_id INT NOT NULL,
vets_id INT NOT NULL,
CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id) ON DELETE CASCADE,
CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE
);

ALTER TABLE visits
ADD date_of_visit date NOT NULL;