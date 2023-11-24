CREATE DATABASE classicmodels;

USE classicmodels;

-- classicmodels.customers definition

CREATE TABLE classicmodels.customers
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
SETTINGS index_granularity = 8192;


-- classicmodels.orderdetails definition

CREATE TABLE classicmodels.orderdetails
(

    `orderNumber` UInt16,

    `productCode` String,

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


-- classicmodels.orders definition

CREATE TABLE classicmodels.orders
(

    `orderNumber` UInt16,

    `orderDate` Nullable(Date),

    `requiredDate` Nullable(Date),

    `shippedDate` Nullable(Date),

    `status` Nullable(String),

    `comments` Nullable(String),

    `customerNumber` Nullable(UInt16)
)
ENGINE = ReplacingMergeTree
PRIMARY KEY orderNumber
ORDER BY orderNumber
SETTINGS index_granularity = 8192;


-- classicmodels.productlines definition

CREATE TABLE classicmodels.productlines
(

    `productLine` String,

    `textDescription` Nullable(String),

    `htmlDescription` Nullable(String),

    `image` Nullable(String)
)
ENGINE = ReplacingMergeTree
PRIMARY KEY productLine
ORDER BY productLine
SETTINGS index_granularity = 8192;


-- classicmodels.products definition

CREATE TABLE classicmodels.products
(

    `productCode` String,

    `productName` Nullable(String),

    `productLine` Nullable(String),

    `productScale` Nullable(String),

    `productVendor` Nullable(String),

    `productDescription` Nullable(String),

    `quantityInStock` Nullable(UInt16),

    `buyPrice` Nullable(Float32),

    `MSRP` Nullable(Float32)
)
ENGINE = ReplacingMergeTree
PRIMARY KEY productCode
ORDER BY productCode
SETTINGS index_granularity = 8192;