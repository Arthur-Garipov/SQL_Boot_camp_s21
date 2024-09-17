CREATE TABLE person_discounts (
    id SERIAL PRIMARY KEY,
    person_id BIGINT NOT NULL,
    pizzeria_id BIGINT NOT NULL,
    discount NUMERIC NOT NULL CHECK (discount BETWEEN 0 AND 100),
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE,
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id) ON DELETE CASCADE
);

CREATE INDEX fk_person_discount_person_id ON person_discounts(person_id);
CREATE INDEX fk_person_discount_pizzeria_id ON person_discounts(pizzeria_id);

-- SELECT * FROM person_discounts