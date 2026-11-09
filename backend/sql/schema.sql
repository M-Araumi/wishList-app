CREATE TABLE users (
    usrId VARCHAR(36) NOT NULL PRIMARY KEY,
    loginId VARCHAR(40) NOT NULL UNIQUE,
    usrName VARCHAR(40) NOT NULL,
    usrType INT NOT NULL CHECK (usrType IN (1, 2)),
    passwordHash VARCHAR(255) NOT NULL
);

CREATE TABLE item_categories (
    categoryId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE item_statuses (
    statusId INT NOT NULL PRIMARY KEY,
    status VARCHAR(15) NOT NULL UNIQUE
);


CREATE TABLE wish_items (
    wishItemId VARCHAR(36) NOT NULL PRIMARY KEY,
    wishItemName VARCHAR(45) NOT NULL,
    categoryId INT NOT NULL,
    wishItemAmount INT NOT NULL CHECK (wishItemAmount >= 1),
    wishItemPriority INT NOT NULL CHECK(wishItemPriority >= 1 AND wishItemPriority <= 5),
    wishItemReason TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usrId VARCHAR(36) NOT NULL,
    statusId INT NOT NULL,
    responseDeadline DATETIME,
    FOREIGN KEY (categoryId) REFERENCES item_categories(categoryId),
    FOREIGN KEY (usrId) REFERENCES users(usrId),
    FOREIGN KEY (statusId) REFERENCES item_statuses(statusId)
);

CREATE TABLE wish_item_votes (
    wishItemId VARCHAR(36) NOT NULL,
    usrId VARCHAR(36) NOT NULL,
    approvalStatus INT NOT NULL CHECK(approvalStatus = 1 OR approvalStatus = 2),
    PRIMARY KEY(wishItemId, usrId),
    FOREIGN KEY (wishItemId) REFERENCES wish_items(wishItemId) ON DELETE CASCADE,
    FOREIGN KEY (usrId) REFERENCES users(usrId)
);