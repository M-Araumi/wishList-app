CREATE TABLE users (
    usrId VARCHAR(36) NOT NULL PRIMARY KEY,
    usrName VARCHAR(40) NOT NULL,
    usrType INT NOT NULL,
    passwd VARCHAR(255) NOT NULL
);

CREATE TABLE item_categories (
    categoryId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(30) NOT NULL
);

CREATE TABLE item_statuses (
    statusId INT NOT NULL PRIMARY KEY,
    status VARCHAR(15) NOT NULL
);


CREATE TABLE wish_items (
    wishItemId VARCHAR(36) NOT NULL PRIMARY KEY,
    wishItemName VARCHAR(45) NOT NULL,
    categoryId INT NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES item_categories(categoryId),
    wishItemAmount INT NOT NULL,
    wishItemPriority INT NOT NULL CHECK(wishItemPriority >= 1 AND wishItemPriority <= 5),
    wishItemReason TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usrId VARCHAR(36) NOT NULL,
    FOREIGN KEY (usrId) REFERENCES users(usrId),
    statusId INT NOT NULL,
    FOREIGN KEY (statusId) REFERENCES item_statuses(statusId),
    responseDeadline DATETIME
);

CREATE TABLE wish_item_votes (
    wishItemId VARCHAR(36) NOT NULL,
    FOREIGN KEY (wishItemId) REFERENCES wish_items(wishItemId),
    usrId VARCHAR(36) NOT NULL,
    FOREIGN KEY (usrId) REFERENCES users(usrId),
    approvalStatus INT NOT NULL CHECK(approvalStatus = 1 OR approvalStatus = 2),
    PRIMARY KEY(wishItemId, usrId)
);