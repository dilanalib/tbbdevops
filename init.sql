CREATE DATABASE sehirler;
use sehirler;

CREATE TABLE buyuk_sehirler (
  isim VARCHAR(20),
  plaka VARCHAR(10)
);

INSERT INTO buyuk_sehirler
  (isim, plaka )
VALUES
  ('Istanbul', '34'),
  ('Ankara', '06');