CREATE DATABASE classicmodels;

USE classicmodels;

-- classicmodels.customers definition (the dimension table in the star schema)

CREATE TABLE customers
(
    `customerNumber` UInt16,
    `customerName` Nullable(String),
    `contactLastName` Nullable(String),
    `contactFirstName` Nullable(String),
    `phone` Nullable(String),
    `addressLine1` Nullable(String),
    `addressLine2` Nullable(String),
    `city` Nullable(String),
    `state` Nullable(String),
    `postalCode` Nullable(String),
    `country` Nullable(String),
    `salesRepEmployeeNumber` Nullable(UInt16),
    `creditLimit` Nullable(Float32)
)
ENGINE = ReplacingMergeTree
PRIMARY KEY customerNumber
ORDER BY customerNumber
SETTINGS index_granularity = 50;

-- classicmodels.payments definition (the fact table in the star schema)

CREATE TABLE payments
(
    `customerNumber` UInt16, -- Foreign key referencing customers
    `checkNumber` String,
    `paymentDate` Date,
    `amount` Nullable(Float32)
)
ENGINE = ReplacingMergeTree
PARTITION BY customerNumber
PRIMARY KEY (customerNumber,
 checkNumber)
ORDER BY (customerNumber,
 checkNumber)
SETTINGS index_granularity = 50;



-- *****lab_submission answer:*****

CREATE TABLE products
(
    `productCode` String,
    `productName` Nullable(String),
    `productLine` String,
    `productScale` Nullable(String),
    `productVendor` Nullable(String),
    `productDescription` Nullable(String),
    `quantityInStock` Nullable(UInt16),
    `buyPrice` Nullable(Float32),
    `MSRP` Nullable(Float32)
)
ENGINE = ReplacingMergeTree
PARTITION BY productLine
PRIMARY KEY (productCode)
ORDER BY (productCode)
SETTINGS index_granularity = 50;

CREATE TABLE orderdetails
(
    `orderNumber` UInt16,
    `productCode` String, -- Foreign key referencing products
    `quantityOrdered` Nullable(UInt32),
    `priceEach` Nullable(Float32),
    `orderLineNumber` Nullable(UInt16)
)
ENGINE = ReplacingMergeTree
PARTITION BY orderNumber
PRIMARY KEY (orderNumber,
 productCode)
ORDER BY (orderNumber,
 productCode)
SETTINGS index_granularity = 8192;

-- *****lab_submission answer:*****
