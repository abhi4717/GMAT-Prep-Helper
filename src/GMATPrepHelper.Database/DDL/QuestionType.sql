CREATE TABLE [dbo].[QuestionType]
(
	[Id] INT NOT NULL,
	[Question_Id] INT NOT NULL,
	[Type_Id] INT NOT NULL,
	CONSTRAINT pk_QuestionType PRIMARY KEY([Id]),
	CONSTRAINT fk_QuestionAnswer_QuestionType_QuestionId FOREIGN KEY([Question_Id]) REFERENCES QuestionAnswers,
	CONSTRAINT fk_Type_QuestionType_TypeId FOREIGN KEY([Type_Id]) REFERENCES [Type]
)
