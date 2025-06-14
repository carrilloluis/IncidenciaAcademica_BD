/*
@description Registro de Incidencias / Eventos de conducta en las sesiones académicas
@author Luis Carrillo Gutiérrez
@date Septiembre, 2018
@version 0.0.1
*/

DROP TABLE IF EXISTS [Profesor];
CREATE TABLE IF NOT EXISTS [Profesor]
( 
	[id] INTEGER UNSIGNED NOT NULL,
	[nombres] VARCHAR(64) NOT NULL,
	[apellidos] VARCHAR(64) NOT NULL, 
	PRIMARY KEY ([id])
) WITHOUT RowId;

DROP TABLE IF EXISTS [Asignatura];
CREATE TABLE IF NOT EXISTS [Asignatura]
(
	[id] INTEGER UNSIGNED NOT NULL,
	[denominación] VARCHAR(128) NOT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;

DROP TABLE IF EXISTS [Aula];
CREATE TABLE IF NOT EXISTS [Aula]
( 
	[id] INTEGER UNSIGNED NOT NULL,
	[grado] CHAR(8) NOT NULL, -- grado / sección
	[referencia] VARCHAR(32) NOT NULL, -- bloque / edificación
	[nivel académico] CHAR(2) NOT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;

DROP TABLE IF EXISTS [Sesión Académica];
CREATE TABLE IF NOT EXISTS [Sesión Académica]
( 
	[id] INTEGER UNSIGNED NOT NULL,
	[id de aula] INTEGER UNSIGNED NOT NULL REFERENCES [Aula](id),
	[id de asignatura] INTEGER UNSIGNED NOT NULL REFERENCES [Asignatura](id),
	PRIMARY KEY ([id])
) WITHOUT RowId;

DROP TABLE IF EXISTS [Incidencia Académica];
CREATE TABLE IF NOT EXISTS [Incidencia Académica]
( 
	[id] INTEGER UNSIGNED NOT NULL,
	[id de sesión académica] INTEGER UNSIGNED NOT NULL REFERENCES [Sesión Académica](id),
	[descripción incidencia] TEXT NOT NULL,
	[fecha de la incidencia] DATETIME NOT NULL,
	[resolución del incidencia] TEXT NOT NULL,
	[fecha de resolución] DATETIME NOT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;
