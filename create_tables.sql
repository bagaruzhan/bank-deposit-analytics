CREATE DATABASE bank;
USE bank;

CREATE TABLE IF NOT EXISTS bank_data (
    age INT,
    job VARCHAR(50),
    marital VARCHAR(20),
    education VARCHAR(30),
    `default` VARCHAR(5),
    balance INT,
    housing VARCHAR(5),
    loan VARCHAR(5),
    contact VARCHAR(20),
    day INT,
    month VARCHAR(10),
    duration INT,
    campaign INT,
    pdays INT,
    previous INT,
    poutcome VARCHAR(20),
    deposit VARCHAR(5)
);



