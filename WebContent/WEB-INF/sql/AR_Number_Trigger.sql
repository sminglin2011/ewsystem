USE [eastwind]
GO
/****** Object:  Trigger [dbo].[general_AR_Number]    Script Date: 18/02/2017 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[general_AR_Number] 
   ON  [dbo].[EW_accountreceiptable] 
   AFTER  INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

	declare @AR_prefix nvarchar(10);
	select @AR_prefix = ISNULL(NAME_VALUE, 'AR') from dbo.SYS_SYSTEMPARAMETER where NAME_KEY = 'AR_PREFIX';

	declare @doc_digit int;
	select @doc_digit = ISNULL(NAME_VALUE, 6) from dbo.SYS_SYSTEMPARAMETER where NAME_KEY = 'NUMBER_DIGIT';



	declare @doc_year nvarchar(4);
	select @doc_year = left(i.date, 4) from inserted i 

	declare @AR_Number nvarchar(100);

	select @AR_Number = @AR_prefix + convert(nvarchar, @doc_year) + '-';

	declare @next_number int;
	

	if not exists ( select 1 from dbo.SYS_ACCOUNTNUMBERCTRL where YEAR = @doc_year and PREFIX = @AR_prefix )
	begin
		insert into dbo.SYS_ACCOUNTNUMBERCTRL (ACCOUNTNUMBERCTRL_ID, CURRENT_NO, YEAR, PREFIX, NUMBER_DIGIT) values (NEWID(), 0, @doc_year, @AR_prefix, @doc_digit);
	end
	select @next_number = (CURRENT_NO + 1) from dbo.SYS_ACCOUNTNUMBERCTRL where YEAR = @doc_year and PREFIX = @AR_prefix;
	select @AR_Number = @AR_prefix + convert(nvarchar, @doc_year) + '-' + right('0000000000' + cast(@next_number as varchar(10)), @doc_digit)
	update dbo.SYS_ACCOUNTNUMBERCTRL set CURRENT_NO = @next_number  where YEAR = @doc_year and PREFIX = @AR_prefix;

	update dbo.ew_accountreceiptable set ar_number = @AR_Number from dbo.ew_accountreceiptable a, inserted i where i.accountreceiptable_ID = a.accountreceiptable_ID
END
