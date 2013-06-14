IF NOT EXISTS(SELECT ID FROM Answers)
BEGIN
	SET IDENTITY_INSERT [Answers] ON;
	INSERT INTO Answers([Id],[Option]) VALUES(1,'A');
	INSERT INTO Answers([Id],[Option]) VALUES(2,'B');
	INSERT INTO Answers([Id],[Option]) VALUES(3,'C');
	INSERT INTO Answers([Id],[Option]) VALUES(4,'D');
	INSERT INTO Answers([Id],[Option]) VALUES(5,'E');
	SET IDENTITY_INSERT [Answers] OFF;
END