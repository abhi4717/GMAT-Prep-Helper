CREATE TABLE [dbo].[Session]
(
	[Id] INT NOT NULL,
	[Name] VARCHAR(1000) NOT NULL,
	[Date_Attempted] DATETIME NOT NULL,
	[Date_Assigned] DATETIME NOT NULL,
	[Start_Question] INT,
	[End_Question] INT,
	CONSTRAINT pk_Session PRIMARY KEY([Id])
)
