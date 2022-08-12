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