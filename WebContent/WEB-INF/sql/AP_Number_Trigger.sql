USE [eastwind]
GO
/****** Object:  Trigger [dbo].[general_AP_Number]    Script Date: 18/02/2017 3:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[general_AP_Number] 
   ON  [dbo].[EW_accountpayable] 
   AFTER  INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	declare @prefix nvarchar(10);
	select @prefix = ISNULL(NAME_VALUE, 'AP') from dbo.SYS_SYSTEMPARAMETER where NAME_KEY = 'AP_PREFIX';

	declare @doc_digit int;
	select @doc_digit = ISNULL(NAME_VALUE, 6) from dbo.SYS_SYSTEMPARAMETER where NAME_KEY = 'NUMBER_DIGIT';



	declare @doc_year nvarchar(4);
	select @doc_year = left(i.date, 4) from inserted i 

	declare @AP_Number nvarchar(100);


	declare @next_number int;
	

	if not exists ( select 1 from dbo.SYS_ACCOUNTNUMBERCTRL where YEAR = @doc_year and PREFIX = @prefix )
	begin
		insert into dbo.SYS_ACCOUNTNUMBERCTRL (ACCOUNTNUMBERCTRL_ID, CURRENT_NO, YEAR, PREFIX, NUMBER_DIGIT) values (NEWID(), 0, @doc_year, @prefix, @doc_digit);
	end
	select @next_number = (CURRENT_NO + 1) from dbo.SYS_ACCOUNTNUMBERCTRL where YEAR = @doc_year and PREFIX = @prefix;
	select @AP_Number = @prefix + convert(nvarchar, @doc_year) + '-' + right('0000000000' + cast(@next_number as varchar(10)), @doc_digit)
	update dbo.SYS_ACCOUNTNUMBERCTRL set CURRENT_NO = @next_number  where YEAR = @doc_year and PREFIX = @prefix;

	update dbo.ew_accountpayable set ap_number = @AP_Number from dbo.ew_accountpayable a, inserted i where i.accountpayable_ID = a.accountpayable_ID
END
