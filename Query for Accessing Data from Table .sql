/****** Script for SelectTopNRows command from SSMS  ******/

SELECT TOP (5) [ID]                   --Top 5 ids will be acessed only
      ,[FirstName]
      ,[LastName]
      ,[Department]
      ,[DateOfJoining]
      ,[BasicPay]
  FROM [EntranceSystem].[dbo].[Employees]            -- Same as "From [Database].[dbo].[TableName]"    
