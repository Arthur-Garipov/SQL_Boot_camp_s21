CREATE TABLE person_audit (
    id BIGSERIAL PRIMARY KEY,
    created TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'));

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (row_id, name, age, gender, address)
    VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;
-- Delete from person
-- where id = 10;
-- Delete from person_audit
-- where row_id = 10;
-- DROP table person_audit;
-- DROP TRIGGER trg_person_insert_audit ON person;