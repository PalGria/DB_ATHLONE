CREATE TABLE Users (
    UserID int NOT NULL,
    Name varchar(255) NOT NULL,
    Email varchar(255) NOT NULL,
    Gender varchar(255)
    Photo varchar(255)
    Birthday DATE, 
    RegistrationDate TIMESTAMP
    PRIMARY KEY (UserID)
);
CREATE TABLE Following (
	UserFollowing int NOT NULL, 
	UserFollowed int NOT NULL,
	FOREIGN KEY (UserFollowed) REFERENCES Users(UserID),
	FOREIGN KEY (UserFollowing) REFERENCES Users(UserID)
	PRIMARY	KEY (UserFollowing, UserFollowed);
);
CREATE TABLE Content (
    ContentID int NOT NULL,
    Name varchar(255) NOT NULL,
    Type varchar(255) NOT NULL,
    Author varchar(255),
    Photo varchar(255),
    Genre varchar(255), 
	ReleaseDate DATE, 
	Description varchar(255),
    RegistrationDate TIMESTAMP,
    PRIMARY KEY (ContentID)
);
CREATE TABLE Status (
	Content int NOT NULL, 
	User int NOT NULL,
	Liked int NOT NULL,
	Faved int NOT NULL,
	Watched int NOT NULL, 
	Watching int NOT NULL, 
	Dropped int NOT NULL,
	Mark int NOT NULL,
	FOREIGN KEY (User) REFERENCES Users(UserID),
	FOREIGN KEY (Content) REFERENCES Content(ContentID)
);
CREATE TABLE Comments (
	CommentId int NOT NULL, 
	Content int NOT NULL, 
	User int NOT NULL,
	Comment TEXT(400) NOT NULL,
	Parent int,
	FOREIGN KEY (Parent) REFERENCES Comments(CommentId),
	FOREIGN KEY (User) REFERENCES Users(UserID),
	FOREIGN KEY (Content) REFERENCES Content(ContentID)
);
CREATE TABLE Posts (
	PostID int NOT NULL, 
	User int,
	Comment int,
	Content int,
	Text TEXT(400) NOT NULL,

	FOREIGN KEY (Comment) REFERENCES Comments(CommentId),
	FOREIGN KEY (User) REFERENCES Users(UserID),
	FOREIGN KEY (Content) REFERENCES Content(ContentID)

);
