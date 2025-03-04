USE [Frigeri]
GO
/****** Object:  Table [dbo].[ChangeConta]    Script Date: 06/30/2014 14:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChangeConta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Alternativa] [varchar](7) NULL,
	[Conta] [varchar](7) NULL,
 CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChangeConta] ON
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (1, N'2131025', N'21201')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (2, N'2131001', N'21501')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (3, N'2161001', N'21903')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (4, N'2161015', N'21906')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (5, N'3221001', N'51101')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (6, N'3221510', N'51102')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (7, N'3221515', N'51103')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (8, N'3221520', N'51104')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (9, N'3221501', N'51106')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (10, N'3221505', N'51107')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (11, N'3221010', N'51115')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (12, N'3222005', N'51116')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (13, N'3221005', N'51215')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (14, N'3311001', N'53101')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (15, N'3311510', N'53102')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (16, N'3311515', N'53103')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (17, N'3311501', N'53106')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (18, N'3311505', N'53107')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (19, N'3312005', N'53114')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (20, N'3311005', N'53206')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (21, N'3411501', N'54102')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (22, N'3411001', N'54103')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (23, N'3411510', N'54104')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (24, N'3411515', N'54105')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (25, N'3411505', N'54107')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (26, N'3412005', N'54112')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (27, N'3411005', N'54120')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (28, N'1122025', N'11512')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (29, N'2131030', N'21206')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (30, N'1122001', N'11505')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (31, N'2131035', N'21304')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (32, N'2151035', N'21431')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (33, N'2131045', N'21213')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (34, N'1122010', N'11514')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (35, N'2131020', N'21202')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (36, N'2161010', N'21910')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (37, N'2161005', N'21909')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (38, N'2161025', N'21908')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (39, N'2161020', N'21907')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (40, N'3311010', N'53119')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (41, N'3311520', N'53104')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (42, N'9110104', N'54213')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (43, N'9110104', N'51212')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (44, N'9110103', N'51204')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (45, N'9110102', N'51110')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (46, N'9110104', N'53115')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (47, N'1122005', N'21513')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (48, N'3151020', N'61106')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (49, N'3222505', N'51221')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (50, N'3231001', N'51301')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (51, N'3231510', N'51302')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (52, N'3231515', N'51303')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (53, N'3231520', N'51304')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (54, N'3231501', N'53306')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (55, N'3231505', N'53307')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (56, N'3231010', N'53313')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (57, N'3232005', N'53314')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (58, N'3231005', N'53318')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (59, N'3222025', N'51212')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (60, N'3232025', N'53316')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (61, N'3312025', N'53115')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (62, N'3412025', N'54213')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (63, N'3222015', N'51204')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (64, N'3232015', N'53315')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (65, N'3312015', N'53113')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (66, N'3412015', N'54109')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (67, N'3222010', N'51110')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (68, N'3232010', N'53310')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (69, N'3312010', N'53110')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (70, N'3412010', N'54108')
INSERT [dbo].[ChangeConta] ([ID], [Alternativa], [Conta]) VALUES (71, N'3411001', N'54115')
SET IDENTITY_INSERT [dbo].[ChangeConta] OFF
/****** Object:  Table [dbo].[arquivo]    Script Date: 06/30/2014 14:18:30 ******/
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
	[Tipo] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[arquivo] ON
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (3, N'187 FOLHA 12-2013Formatado', N'~/ArquivosUnylaser/187 FOLHA 12-2013Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (4, N'187 FOLHA 12-2013', N'~/ArquivosUnylaser/187 FOLHA 12-2013.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (5, N'187 FOLHA 12-2013(2)Formatado', N'~/ArquivosUnylaser/187 FOLHA 12-2013(2)Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (6, N'187 FOLHA 12-2013(2)', N'~/ArquivosUnylaser/187 FOLHA 12-2013(2).txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (7, N'Folha de Pagamento 02-2014Formatado', N'~/ArquivosUnylaser/Folha de Pagamento 02-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (8, N'Folha de Pagamento 02-2014', N'~/ArquivosUnylaser/Folha de Pagamento 02-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (9, N'Folha Unylaser 02-2014Formatado', N'~/ArquivosUnylaser/Folha Unylaser 02-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (10, N'Folha Unylaser 02-2014', N'~/ArquivosUnylaser/Folha Unylaser 02-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (11, N'Folha Unylaser 03-2014Formatado', N'~/ArquivosUnylaser/Folha Unylaser 03-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (12, N'Folha Unylaser 03-2014', N'~/ArquivosUnylaser/Folha Unylaser 03-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (13, N'Folha PCP Produtos 03-2014Formatado', N'~/ArquivosUnylaser/Folha PCP Produtos 03-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (14, N'Folha PCP Produtos 03-2014', N'~/ArquivosUnylaser/Folha PCP Produtos 03-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (15, N'pcp 04-2014Formatado', N'~/ArquivosUnylaser/pcp 04-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (16, N'pcp 04-2014', N'~/ArquivosUnylaser/pcp 04-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (17, N'ARQUIVO FOLHA PROSOFTFormatado', N'~/ArquivosUnylaser/ARQUIVO FOLHA PROSOFTFormatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (18, N'ARQUIVO FOLHA PROSOFT', N'~/ArquivosUnylaser/ARQUIVO FOLHA PROSOFT.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (29, N'Folha187Formatado', N'~/ArquivosUnylaser/Folha187Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (30, N'Folha187', N'~/ArquivosUnylaser/Folha187.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (31, N'Folha18705-2014Formatado', N'~/ArquivosUnylaser/Folha18705-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (32, N'Folha18705-2014', N'~/ArquivosUnylaser/Folha18705-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (33, N'Folha18705-2014Formatado', N'~/ArquivosUnylaser/Folha18705-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (34, N'Folha18705-2014', N'~/ArquivosUnylaser/Folha18705-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (35, N'FOLHA UNY 05-2014Formatado', N'~/ArquivosUnylaser/FOLHA UNY 05-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (36, N'FOLHA UNY 05-2014', N'~/ArquivosUnylaser/FOLHA UNY 05-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (19, N'FOLHAFormatado', N'~/ArquivosUnylaser/FOLHAFormatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (20, N'FOLHA', N'~/ArquivosUnylaser/FOLHA.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (21, N'FOLHA 04-2014Formatado', N'~/ArquivosUnylaser/FOLHA 04-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (22, N'FOLHA 04-2014', N'~/ArquivosUnylaser/FOLHA 04-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (23, N'FOLHA 04-2014Formatado', N'~/ArquivosUnylaser/FOLHA 04-2014Formatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (24, N'FOLHA 04-2014', N'~/ArquivosUnylaser/FOLHA 04-2014.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (25, N'TESTE FOLHAFormatado', N'~/ArquivosUnylaser/TESTE FOLHAFormatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (26, N'TESTE FOLHA', N'~/ArquivosUnylaser/TESTE FOLHA.txt', N'1')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (27, N'folha corteFormatado', N'~/ArquivosUnylaser/folha corteFormatado.txt', N'2')
INSERT [dbo].[arquivo] ([ID], [NomeArquivo], [Foto], [Tipo]) VALUES (28, N'folha corte', N'~/ArquivosUnylaser/folha corte.txt', N'1')
SET IDENTITY_INSERT [dbo].[arquivo] OFF
