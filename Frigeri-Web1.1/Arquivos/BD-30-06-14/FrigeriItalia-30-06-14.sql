USE [FrigeriItalia]
GO
/****** Object:  Table [dbo].[DePara]    Script Date: 06/30/2014 15:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DePara](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Alternativa] [varchar](3) NULL,
	[Conta] [varchar](5) NULL,
	[CC] [varchar](5) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DePara] ON
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (15, N'001', N'11203', NULL)
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (16, N'004', N'11223', NULL)
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (17, N'008', N'11215', NULL)
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (18, N'237', N'11201', NULL)
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (19, N'341', N'11204', NULL)
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (20, N'343', N'11217', NULL)
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (21, N'344', N'11217', NULL)
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (22, N'345', N'11217', NULL)
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (23, N'033', N'11101', N'00001')
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (24, N'034', N'11101', N'00003')
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (25, N'035', N'11101', N'00002')
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (26, N'036', N'11101', N'00004')
INSERT [dbo].[DePara] ([ID], [Alternativa], [Conta], [CC]) VALUES (27, N'037', N'11101', N'00005')
SET IDENTITY_INSERT [dbo].[DePara] OFF
/****** Object:  Table [dbo].[configuracao]    Script Date: 06/30/2014 15:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[configuracao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[caminhoEntrada] [varchar](500) NULL,
	[caminhoSaida] [varchar](500) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[configuracao] ON
INSERT [dbo].[configuracao] ([id], [caminhoEntrada], [caminhoSaida]) VALUES (1, N'C:\Users\Alan\Desktop', N'C:\Users\Alan\Desktop')
SET IDENTITY_INSERT [dbo].[configuracao] OFF
/****** Object:  Table [dbo].[arquivo]    Script Date: 06/30/2014 15:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[arquivo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NomeArquivo] [varchar](50) NULL,
	[Foto] [varchar](300) NULL,
	[Tipo] [char](1) NULL,
	[Modo] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[arquivo] ON
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2038, N'1Formatado', N'~/Arquivos/1Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2039, N'1', N'~/Arquivos/1.csv', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2040, N'FORNECEDORFormatado', N'~/Arquivos/FORNECEDORFormatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2041, N'FORNECEDOR', N'~/Arquivos/FORNECEDOR.csv', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2042, N'TESTE DESPESASFormatado', N'~/Arquivos/TESTE DESPESASFormatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2043, N'TESTE DESPESAS', N'~/Arquivos/TESTE DESPESAS.csv', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2044, N'Clientes 1-13Formatado', N'~/Arquivos/Clientes 1-13Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2045, N'Clientes 1-13', N'~/Arquivos/Clientes 1-13.csv', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2046, N'DespesasFormatado', N'~/Arquivos/DespesasFormatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2047, N'Despesas', N'~/Arquivos/Despesas.csv', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2048, N'01_18122013Formatado', N'~/Arquivos/01_18122013Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2049, N'01_18122013', N'~/Arquivos/01_18122013.CSV', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2050, N'19_31122013Formatado', N'~/Arquivos/19_31122013Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2051, N'19_31122013', N'~/Arquivos/19_31122013.csv', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2052, N'DespesasFormatado', N'~/Arquivos/DespesasFormatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2053, N'Despesas', N'~/Arquivos/Despesas.csv', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2054, N'DespesasFormatado', N'~/Arquivos/DespesasFormatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2055, N'Despesas', N'~/Arquivos/Despesas.csv', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2056, N'Despesas-16-01Formatado', N'~/Arquivos/Despesas-16-01Formatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2057, N'Despesas-16-01', N'~/Arquivos/Despesas-16-01.csv', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2058, N'CLIENTESFormatado', N'~/Arquivos/CLIENTESFormatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2059, N'CLIENTES', N'~/Arquivos/CLIENTES.csv', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2060, N'DESPESASFormatado', N'~/Arquivos/DESPESASFormatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2061, N'DESPESAS', N'~/Arquivos/DESPESAS.csv', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2062, N'FORNECEDORESFormatado', N'~/Arquivos/FORNECEDORESFormatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2063, N'FORNECEDORES', N'~/Arquivos/FORNECEDORES.csv', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2064, N'DESPESASFormatado', N'~/Arquivos/DESPESASFormatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2065, N'DESPESAS', N'~/Arquivos/DESPESAS.csv', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2070, N'Clientes 01-24Formatado', N'~/Arquivos/Clientes 01-24Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2071, N'Clientes 01-24', N'~/Arquivos/Clientes 01-24.Clientes 01-24', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2072, N'Despesas 01-24Formatado', N'~/Arquivos/Despesas 01-24Formatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2073, N'Despesas 01-24', N'~/Arquivos/Despesas 01-24.CSV', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2074, N'Clientes 24-28Formatado', N'~/Arquivos/Clientes 24-28Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2075, N'Clientes 24-28', N'~/Arquivos/Clientes 24-28.Clientes 24-28', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2076, N'FornFormatado', N'~/Arquivos/FornFormatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2077, N'Forn', N'~/Arquivos/Forn.csv', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2078, N'FornFormatado', N'~/Arquivos/FornFormatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2079, N'Forn', N'~/Arquivos/Forn.csv', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2080, N'Fornecedores 24-28Formatado', N'~/Arquivos/Fornecedores 24-28Formatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2081, N'Fornecedores 24-28', N'~/Arquivos/Fornecedores 24-28.csv', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2082, N'DUPFormatado', N'~/Arquivos/DUPFormatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2083, N'DUP', N'~/Arquivos/DUP.txt', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2084, N'CLIENTES 01-24-02Formatado', N'~/Arquivos/CLIENTES 01-24-02Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2085, N'CLIENTES 01-24-02', N'~/Arquivos/CLIENTES 01-24-02.txt', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2086, N'CLIENTES 24-28-02Formatado', N'~/Arquivos/CLIENTES 24-28-02Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2087, N'CLIENTES 24-28-02', N'~/Arquivos/CLIENTES 24-28-02.txt', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2088, N'DESPESAS 31-03-14Formatado', N'~/Arquivos/DESPESAS 31-03-14Formatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2089, N'DESPESAS 31-03-14', N'~/Arquivos/DESPESAS 31-03-14.CSV', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2090, N'DUPFormatado', N'~/Arquivos/DUPFormatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2091, N'DUP', N'~/Arquivos/DUP. POR OPERAÇÃO FINANCEIRA 31-03-14', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2092, N'FORNECEDORES 31-03-14Formatado', N'~/Arquivos/FORNECEDORES 31-03-14Formatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2093, N'FORNECEDORES 31-03-14', N'~/Arquivos/FORNECEDORES 31-03-14.CSV', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2094, N'DUPFormatado', N'~/Arquivos/DUPFormatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2095, N'DUP', N'~/Arquivos/DUP.txt', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2096, N'FORN 01-14-30Formatado', N'~/Arquivos/FORN 01-14-30Formatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2097, N'FORN 01-14-30', N'~/Arquivos/FORN 01-14-30.csv', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2098, N'FORN 15-30-04Formatado', N'~/Arquivos/FORN 15-30-04Formatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2099, N'FORN 15-30-04', N'~/Arquivos/FORN 15-30-04.CSV', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2100, N'DESPESAS 01-14Formatado', N'~/Arquivos/DESPESAS 01-14Formatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2101, N'DESPESAS 01-14', N'~/Arquivos/DESPESAS 01-14.csv', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2102, N'DESPESAS 15-30-04Formatado', N'~/Arquivos/DESPESAS 15-30-04Formatado.txt', N'2', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2103, N'DESPESAS 15-30-04', N'~/Arquivos/DESPESAS 15-30-04.CSV', N'1', N'D')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2104, N'CLIENTES 15-30-04Formatado', N'~/Arquivos/CLIENTES 15-30-04Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2105, N'CLIENTES 15-30-04', N'~/Arquivos/CLIENTES 15-30-04.CSV', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2066, N'CLIENTES 111Formatado', N'~/Arquivos/CLIENTES 111Formatado.txt', N'2', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2067, N'CLIENTES 111', N'~/Arquivos/CLIENTES 111.csv', N'1', N'C')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2068, N'FORNECEDORES1111Formatado', N'~/Arquivos/FORNECEDORES1111Formatado.txt', N'2', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2069, N'FORNECEDORES1111', N'~/Arquivos/FORNECEDORES1111.csv', N'1', N'F')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2106, N'CORTESIAFormatado', N'~/Arquivos/CORTESIAFormatado.txt', N'2', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2107, N'CORTESIA', N'~/Arquivos/CORTESIA.CSV', N'1', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2108, N'CORTESIAFormatado', N'~/Arquivos/CORTESIAFormatado.txt', N'2', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2109, N'CORTESIA', N'~/Arquivos/CORTESIA.CSV', N'1', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2110, N'CORTESIAFormatado', N'~/Arquivos/CORTESIAFormatado.txt', N'2', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2111, N'CORTESIA', N'~/Arquivos/CORTESIA.CSV', N'1', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2112, N'CORTESIAFormatado', N'~/Arquivos/CORTESIAFormatado.txt', N'2', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2113, N'CORTESIA', N'~/Arquivos/CORTESIA.CSV', N'1', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2114, N'CORTESIAFormatado', N'~/Arquivos/CORTESIAFormatado.txt', N'2', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2115, N'CORTESIA', N'~/Arquivos/CORTESIA.CSV', N'1', N'O')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2116, N'RELATÓRIO REVERSÕES 04-2014Formatado', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014Formatado.txt', N'2', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2117, N'RELATÓRIO REVERSÕES 04-2014', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014.CSV', N'1', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2118, N'RELATÓRIO REVERSÕES 04-2014Formatado', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014Formatado.txt', N'2', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2119, N'RELATÓRIO REVERSÕES 04-2014', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014.CSV', N'1', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2120, N'RELATÓRIO REVERSÕES 04-2014Formatado', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014Formatado.txt', N'2', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2121, N'RELATÓRIO REVERSÕES 04-2014', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014.CSV', N'1', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2122, N'RELATÓRIO REVERSÕES 04-2014Formatado', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014Formatado.txt', N'2', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2123, N'RELATÓRIO REVERSÕES 04-2014', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014.CSV', N'1', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2124, N'RELATÓRIO REVERSÕES 04-2014Formatado', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014Formatado.txt', N'2', N'R')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo], [Modo]) VALUES (2125, N'RELATÓRIO REVERSÕES 04-2014', N'~/Arquivos/RELATÓRIO REVERSÕES 04-2014.CSV', N'1', N'R')
SET IDENTITY_INSERT [dbo].[arquivo] OFF
