CREATE DATABASE classicmodels;
-- Table 1: orderdetails
CREATE TABLE `orderdetails` (
  `orderNumber` UInt16,
  `productCode` String,
  `quantityOrdered` Nullable(UInt32),
  `priceEach` Nullable(Float32),
  `orderLineNumber` Nullable(UInt16)
)
ENGINE = ReplacingMergeTree
PARTITION BY `orderNumber`
ORDER BY (`orderNumber`,`productCode`)
PRIMARY KEY (`orderNumber`,`productCode`);

-- Table 2: orders
CREATE TABLE `orders` (
  `orderNumber` UInt16,
  `orderDate` Nullable(Date),
  `requiredDate` Nullable(Date),
  `shippedDate` Nullable(Date),
  `status` Nullable(String),
  `comments` Nullable(String),
  `customerNumber` Nullable(UInt16)
)
ENGINE = ReplacingMergeTree
ORDER BY (`orderNumber`)
PRIMARY KEY (`orderNumber`);

-- Table 3: products
CREATE TABLE `products` (
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
ORDER BY (`productCode`)
PRIMARY KEY (`productCode`);

-- Table 4: customers
CREATE TABLE `customers` (
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
ORDER BY (`customerNumber`)
PRIMARY KEY (`customerNumber`);

-- Table 5: productlines
CREATE TABLE `productlines` (
  `productLine` String,
  `textDescription` Nullable(String),
  `htmlDescription` Nullable(String),
  `image` Nullable(String)
)
ENGINE = ReplacingMergeTree
ORDER BY (`productLine`)
PRIMARY KEY (`productLine`);