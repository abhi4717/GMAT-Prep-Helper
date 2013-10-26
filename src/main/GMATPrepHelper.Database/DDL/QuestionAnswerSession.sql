CREATE TABLE [dbo].[QuestionAnswerSession]
(
	[Id] INT NOT NULL,
	[Question_Id] INT NOT NULL,
	[Session_Id] INT NOT NULL,
	[Section_Id] INT NOT NULL,
	[Book_Id] INT NOT NULL,
	CONSTRAINT pk_QuestionAnswerSession PRIMARY KEY([Id]),
	CONSTRAINT fk_QuestionAnswer_QuestionAnswerSession_QuestionId FOREIGN KEY([Question_Id]) REFERENCES [QuestionAnswers],
	CONSTRAINT fk_Session_QuestionAnswerSession_SessionId FOREIGN KEY([Session_Id]) REFERENCES [Session],
	CONSTRAINT fk_Section_QuestionAnswerSession_SectionId FOREIGN KEY([Section_Id]) REFERENCES [Section],
	CONSTRAINT fk_Book_QuestionAnswerSession_BookId FOREIGN KEY([Book_Id]) REFERENCES [Book]
)
