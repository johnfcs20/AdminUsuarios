USE [AdminUsuarios]
GO
/****** Object:  Table [dbo].[Departamentos_Cata]    Script Date: 8/30/2021 4:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos_Cata](
	[Depatamento_ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Departamento_Descripcion] [varchar](200) NOT NULL,
	[Registro_Usuario] [varchar](50) NOT NULL,
	[Registro_Fecha] [datetime] NOT NULL,
	[Registro_Estado] [char](1) NOT NULL,
 CONSTRAINT [PK_Departamentos_Cata] PRIMARY KEY CLUSTERED 
(
	[Depatamento_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios_Master]    Script Date: 8/30/2021 4:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios_Master](
	[Usuario_ID] [int] IDENTITY(1,1) NOT NULL,
	[Usuario_Nombres] [varchar](200) NOT NULL,
	[Usuario_Apellidos] [varchar](200) NOT NULL,
	[Usuario_Nombres_Combianados] [varchar](100) NULL,
	[Usuario_Genero] [char](1) NOT NULL,
	[Usuario_Cedula] [varchar](11) NOT NULL,
	[Usuario_Fecha_Nacimiento] [datetime] NOT NULL,
	[Depatamento_ID] [tinyint] NOT NULL,
	[Cargo] [varchar](200) NOT NULL,
	[Supervisor_Inmediato] [varchar](200) NOT NULL,
	[Registro_Estado] [char](1) NOT NULL,
	[Registro_Usuario] [varchar](50) NOT NULL,
	[Registro_Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuarios_Master] PRIMARY KEY CLUSTERED 
(
	[Usuario_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departamentos_Cata] ON 

INSERT [dbo].[Departamentos_Cata] ([Depatamento_ID], [Departamento_Descripcion], [Registro_Usuario], [Registro_Fecha], [Registro_Estado]) VALUES (4, N'BLOQUE A', N'jc', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Departamentos_Cata] ([Depatamento_ID], [Departamento_Descripcion], [Registro_Usuario], [Registro_Fecha], [Registro_Estado]) VALUES (5, N'BLOQUE B', N'jc', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'A')
INSERT [dbo].[Departamentos_Cata] ([Depatamento_ID], [Departamento_Descripcion], [Registro_Usuario], [Registro_Fecha], [Registro_Estado]) VALUES (6, N'BLOQUE C', N'jc', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'A')
SET IDENTITY_INSERT [dbo].[Departamentos_Cata] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios_Master] ON 

INSERT [dbo].[Usuarios_Master] ([Usuario_ID], [Usuario_Nombres], [Usuario_Apellidos], [Usuario_Nombres_Combianados], [Usuario_Genero], [Usuario_Cedula], [Usuario_Fecha_Nacimiento], [Depatamento_ID], [Cargo], [Supervisor_Inmediato], [Registro_Estado], [Registro_Usuario], [Registro_Fecha]) VALUES (4, N'PRUEBA', N'PRUEBA PRUEBA', N'PRUEBA PRUEBA PRUEBA', N'M', N'40200602429', CAST(N'2020-05-05T00:00:00.000' AS DateTime), 4, N'Prueba', N'prueba', N'A', N'jc', CAST(N'2021-08-30T14:09:55.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuarios_Master] OFF
GO
ALTER TABLE [dbo].[Departamentos_Cata] ADD  CONSTRAINT [DF_Departamentos_Cata_Registro_Estado]  DEFAULT ('A') FOR [Registro_Estado]
GO
ALTER TABLE [dbo].[Usuarios_Master] ADD  CONSTRAINT [DF_Usuarios_Master_Registro_Estado]  DEFAULT ('A') FOR [Registro_Estado]
GO
ALTER TABLE [dbo].[Usuarios_Master]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Master_Departamentos_Cata] FOREIGN KEY([Depatamento_ID])
REFERENCES [dbo].[Departamentos_Cata] ([Depatamento_ID])
GO
ALTER TABLE [dbo].[Usuarios_Master] CHECK CONSTRAINT [FK_Usuarios_Master_Departamentos_Cata]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Departamentos_Cata_Consulta]    Script Date: 8/30/2021 4:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- _________________________________________________________________________________________
/*
' 	Proc_Departamentos_Cata_Consulta
'
' Brief Description: Este procemiendo se encarga de retornar el listado de departamentos registrados en el catalogo
' 
'  Author: John Castaño
' Created Date: 30/08/2021
'*****************************************************************
*/
-- ______________________________________________________________________________________________________
CREATE Procedure [dbo].[Proc_Departamentos_Cata_Consulta] 
As
	Begin
		
			Select DC.Depatamento_ID,
				   DC.Departamento_Descripcion
			  From Departamentos_Cata DC
			  Where Registro_Estado = 'A'

	End
GO
/****** Object:  StoredProcedure [dbo].[Proc_Usuarios_Master_Consulta]    Script Date: 8/30/2021 4:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- _________________________________________________________________________________________
/*
' 	Proc_Usuarios_Master_Consulta
'
' Brief Description: Este procemiendo se encarga de retornar el detalle de un usuario asociado al ID enviado
' 
'  Author: John Castaño
' Created Date: 30/08/2021
'*****************************************************************
*/
-- ______________________________________________________________________________________________________

CREATE Procedure [dbo].[Proc_Usuarios_Master_Consulta] 
(
   @Usuario_ID int
)
As
	Begin 
			Select UM.Usuario_ID,
				   UM.Usuario_Nombres,
				   UM.Usuario_Apellidos,
				   UM.Usuario_Nombres_Combianados,
				   UM.Usuario_Genero,
				   UM.Usuario_Cedula,
				   UM.Usuario_Fecha_Nacimiento,
				   UM.Depatamento_ID
			From Usuarios_Master UM
			 Where UM.Usuario_ID = @Usuario_ID
			   And Registro_Estado = 'A'
	End


GO
/****** Object:  StoredProcedure [dbo].[Proc_Usuarios_Master_Inactiva]    Script Date: 8/30/2021 4:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- _________________________________________________________________________________________
/*
' 	Proc_Usuarios_Master_Inactiva
'
' Brief Description: Este procemiendo se encarga de cambiar a estado inactivo el registro que coincida con el ID enviado en la tabla de Usurios_Master
' 
'  Author: John Castaño
' Created Date: 30/08/2021
'*****************************************************************
*/
-- ______________________________________________________________________________________________________

CREATE Procedure [dbo].[Proc_Usuarios_Master_Inactiva] 
(
  @Usuario_ID int
)
As
Begin 

   Update Usuarios_Master
	 Set Registro_Estado = 'I',
		 Registro_Fecha = GETDATE()
   Where Usuario_ID = @Usuario_ID
	 And Registro_Estado = 'A'

   Select Datos = 'Usuario elimanado de manera satisfactoria'


  end


  -- select * from Usuarios_Master


GO
/****** Object:  StoredProcedure [dbo].[Proc_Usuarios_Master_Inserta]    Script Date: 8/30/2021 4:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ___________________________________________________________________________________________________________
/*
' 	Proc_Usuarios_Master_Inserta 
'
' Brief Description: Este procedimiento se encarga de insertar o actualizar un usuario de acuerdo a la secuencia
					 enviada.
'
' Author: John Castaño
' Created Date: 30/08/2021
'*****************************************************************
*/
-- _______________________________________________________________________________________________________________

CREATE Procedure [dbo].[Proc_Usuarios_Master_Inserta] 
(
	@Usuario_ID int,
	@Usuario_Nombres varchar(200),
	@Usuario_Apellidos varchar(200),
	@Usuario_Genero char(1),
	@Usuario_Cedula varchar(11),
	@Usuario_Fecha_Nacimiento varchar(20),
	@Depatamento_ID tinyint,
	@Cargo varchar(200),
	@Supervisor_Inmediato varchar(200),
	@Registro_Usuario varchar(50)

)
As
 Begin 

   Declare @FechaNacimiento DateTime;

   --- Set DateFormat DMY;

   set @FechaNacimiento = CAST(@Usuario_Fecha_Nacimiento AS DATETIME);
   -- select @FechaNacimiento 


    

      
  If  Exists(Select Top 1 @Usuario_Cedula
	               From Usuarios_Master  With(NoLock)
					 Where @Usuario_Cedula = Usuario_Cedula 
					    And @Usuario_ID = 0
					    And Registro_Estado = 'A')
	  Begin 
	     RAISERROR('Error: Ya existe un usuario con esta cedula',16,1)
		 Return
	  End 




	Else 
		Begin 

			If(@Usuario_ID <> 0)
				Begin

					Update Usuarios_Master
					   Set Usuario_Cedula = Coalesce(@Usuario_Cedula, Usuario_Cedula),
					       Usuario_Nombres = Coalesce(@Usuario_Nombres, Usuario_Nombres),
						   Usuario_Apellidos = Coalesce(@Usuario_Apellidos, Usuario_Apellidos),
						   Usuario_Nombres_Combianados = Coalesce(@Usuario_Nombres + ' ' + @Usuario_Apellidos, Usuario_Nombres_Combianados),
						   Usuario_Fecha_Nacimiento = Coalesce(@FechaNacimiento , Usuario_Fecha_Nacimiento),
						   Depatamento_ID = Coalesce(@Depatamento_ID, Depatamento_ID),
						   Cargo = Coalesce(@Cargo, Cargo),
						   Supervisor_Inmediato = Coalesce(@Supervisor_Inmediato, Supervisor_Inmediato),
						   Registro_Fecha = GETDATE()
					Where Usuario_ID = @Usuario_ID
					  And Registro_Estado = 'A'

					Select Datos = 'Empledo actualizado satisfactoriamente'

					Return;
				 End
			 Else If(@Usuario_ID = 0)
				Begin

					Insert into Usuarios_Master 
					(
						Usuario_Nombres,
						Usuario_Apellidos,
						Usuario_Nombres_Combianados,
						Usuario_Genero,
						Usuario_Cedula,
						Usuario_Fecha_Nacimiento,
						Depatamento_ID,
						Cargo,
						Supervisor_Inmediato,
						Registro_Usuario,
						Registro_Estado,
						Registro_Fecha
					)
					Values
					(
						@Usuario_Nombres,
						@Usuario_Apellidos,
						@Usuario_Nombres + ' ' + @Usuario_Apellidos,
						@Usuario_Genero,
						@Usuario_Cedula,
						@FechaNacimiento,
						@Depatamento_ID,
						@Cargo,
						@Supervisor_Inmediato,
						@Registro_Usuario,
						'A',
						GETDATE()
					)

					Select Datos = 'Usuario agregado satisfactoriamente'


				End
		End

 End 



			--[dbo].[Proc_Usuarios_Master_Inserta] 
   --     @Usuario_ID = 0,
   --     @Usuario_Nombres = 'PRUEBA',
   --     @Usuario_Apellidos= 'PRUEBA PRUEBA',
   --     @Usuario_Genero = 'M',
   --     @Usuario_Cedula = '40200602429',
   --     @Usuario_Fecha_Nacimiento = '2020-05-02' ,
   --     @Depatamento_ID = 4,
   --     @Cargo = 'Prueba',
   --     @Supervisor_Inmediato = 'prueba'
GO
/****** Object:  StoredProcedure [dbo].[Proc_Usuarios_Master_Paging_Consulta]    Script Date: 8/30/2021 4:19:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- _________________________________________________________________________________________
/*
' 	Proc_Usuarios_Master_Paging_Consulta
'
' Brief Description: Este procemiendo se encarga de retornar una lista de usuarios de acuerdo a los filtros enviados
' 
'  Author: John Castaño
' Created Date: 30/08/2021
'*****************************************************************
*/
-- ______________________________________________________________________________________________________

CREATE Procedure [dbo].[Proc_Usuarios_Master_Paging_Consulta] 
(
   @PageIndex int,
   @PageSize Int,
   @Empleado_Cedula_Nombre varchar(50) = ''
)
As
Begin 


  Declare @PageIni int;
  Declare @PageEnd int;
  Declare @Linea int;


  Set @PageIni = 0;
  Set @PageEnd = 0;

  --Procesos 
  Set @PageIndex = Case When @PageIndex = 0 then 1 else @PageIndex end; 
  Set @Pageend = (@PageIndex*@PageSize); 
  Set @PageIni = (@Pageend-@PageSize)+1; 

  Select Id = Convert(int, UM.Usuario_ID),
		 UM.Usuario_Nombres,
		 UM.Usuario_Apellidos,
		 UM.Usuario_Nombres_Combianados,
		 UM.Usuario_Genero,
		 UM.Usuario_Cedula,
		 UM.Usuario_Fecha_Nacimiento,
		 UM.Depatamento_ID,
		 DC.Departamento_Descripcion,
		 Linea = identity(int, 1,1)
	  INTO #Empleados
      From Usuarios_Master UM with(NoLock)
		Inner Join Departamentos_Cata DC with(NoLock)
		 ON UM.Depatamento_ID = DC.Depatamento_ID
	    where  ((@Empleado_Cedula_Nombre = '') OR ((UM.Usuario_Nombres_Combianados  COLLATE Latin1_General_CI_AI Like '%'+@Empleado_Cedula_Nombre+'%' COLLATE Latin1_General_CI_AI) OR (UM.Usuario_Cedula  COLLATE Latin1_General_CI_AI Like '%'+@Empleado_Cedula_Nombre+'%' COLLATE Latin1_General_CI_AI)))
		  And UM.Registro_Estado = 'A'


      Set RowCount 0


  Declare @Registros Int 
  Select @Registros = Max(Linea) From #Empleados


	  Select *,	         
			 Ultima_Linea = @PageSize, 
			 Cantidad_Registros = @Registros
		From #Empleados
	  Where Linea between @PageIni and @Pageend
	Order by Linea
	
	  Drop Table #Empleados
  end


GO
