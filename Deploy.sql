if exists (select * from sys.objects where [type] = 'FS' and name = 'RegexIsMatch')
drop function dbo.RegexIsMatch
if exists (select * from sys.objects where [type] = 'FS' and name = 'RegexReplace')
drop function dbo.RegexReplace
if exists (select * from sys.objects where [type] = 'FS' and name = 'StringTrim')
drop function dbo.StringTrim
if exists (select * from sys.objects where [type] = 'FS' and name = 'StringHtmlDecode')
drop function dbo.StringHtmlDecode
   
if exists (select * from sys.assemblies where name = 'SqlExtensions')
drop assembly SqlExtensions
go

create assembly SqlExtensions from 'D:\CLR\SqlExtensions.dll'
go

create function RegexIsMatch(@Input nvarchar(max), @Pattern nvarchar(max)) returns bit as external name SqlExtensions.[SqlExtensions.RegexExtensions].IsMatch
go

create function RegexReplace(@Input nvarchar(max), @Pattern nvarchar(max), @Replacement nvarchar(max)) returns nvarchar(max) as external name SqlExtensions.[SqlExtensions.RegexExtensions].[Replace]
go

create function StringTrim(@Input nvarchar(max)) returns nvarchar(max) as external name SqlExtensions.[SqlExtensions.StringExtensions].Trim
go

create function StringHtmlDecode(@Input nvarchar(max)) returns nvarchar(max) as external name SqlExtensions.[SqlExtensions.StringExtensions].HtmlDecode
go