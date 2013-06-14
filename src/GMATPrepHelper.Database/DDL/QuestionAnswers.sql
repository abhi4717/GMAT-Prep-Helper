CREATE TABLE [dbo].[QuestionAnswers]
(
	[Id] INT NOT NULL,
	[Question_No] INT NOT NULL,
	[Selected_Ans] INT NOT NULL,
	[Correct_Ans] INT NULL,
	[Remarks] VARCHAR(500) NULL,
	CONSTRAINT pk_QuestionAnswer PRIMARY KEY([Id]),
	CONSTRAINT fk_Answers_SelectedAns FOREIGN KEY([Selected_Ans]) REFERENCES Answers,
	CONSTRAINT fk_Answers_CorrectAns FOREIGN KEY([Correct_Ans]) REFERENCES Answers
)
