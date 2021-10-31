Create database Hospital
Use Hospital

Create table Pacientes
(
Numero_Seguridad_Social int primary key,
Nombres_Paciente varchar(30),
Apellidos_Paciente varchar(30),
Domicilio varchar(30),
Sexo varchar(15),
Provincia varchar(30),
Codigo_Postal varchar(15),
Num_Historial_Clinico int,
observacione varchar(max)
)

Create table Ingresos
(
Id_Ingresos int primary key identity(1,1),
Procedencia varchar(30),
Fecha_Ingreso date,
Numero_Planta  int,
Numero_Cama int,
Observaciones varchar(max),
Numero_Seguridad_Social int foreign key(Numero_Seguridad_Social) references Pacientes(Numero_Seguridad_Social),
Cod_Medico int foreign key(Cod_Medico) references Medicos(Cod_Medico)
)

Create table Medicos
(
Cod_Medico int primary key identity(1,1),
Nombres_Medico varchar(30),
Apellidos_Medico varchar(30),
Numero_Colegiado Varchar(50) unique,
Observaciones varchar(30)
)

Create table Contacto /*Para guaradar diferente numeros telefónicos ya que el paciente puede ser que tenga más de uno*/ 
(
Id_Contacto int primary key identity(1,1),
Num_Telefonico int
)

Create Table Contacto_Paciente /*Tabla para relacionar los respecttivos contactos con los clientes*/
(
Id_C_P int primary key identity(1,1), /*Identidicador Contacto_Paciente*/
Id_Contacto int foreign key(Id_Contacto) references Contacto(Id_Contacto),
Numero_Seguridad_Social int foreign key(Numero_Seguridad_Social) references Pacientes(Numero_Seguridad_Social)
)

Create table Especialidades /*Especialidades que pueden tener los medicos*/
(
Id_Especialidad int primary key identity(1,1),
Nombre varchar(50)
)

Create table Especiales_Medicos /*Tabla para relacionar los medicos con las diferentes especialidades*/
(
Id_E_M int primary key identity(1,1), /*Identificador Especialidades_Medicos*/
Id_Especialidad int foreign key(Id_Especialidad) references Especialidades(Id_Especialidad),
Cod_Medico int foreign key(Cod_Medico) references Medicos(Cod_Medico)
)

Create table Cargos /*Posibles cargos del personal*/
(
Id_Cargo int primary key identity(1,1),
Nombre varchar(30),
Descripción varchar(max)
)

Create table Medicos_Cargos /*Relacón entre Medicos y Cargos para espicificar cargos que efectuarán*/
(
Id_M_C int primary key identity(1,1), /*Identificador Medicos_Cargos*/
Cod_Medico int foreign key(Cod_Medico) references Medicos(Cod_Medico),
Id_Cargo int foreign key(Id_Cargo) references cargos(Id_Cargo)
)

Insert into Cargos
Values
('Emergencia', 'Encargado de atender en emergencias'),
('Citas', 'Encargado de atender por citas')

Insert into Especialidades
Values
('Toxicología'),
('Alergología'),
('Anestesiología'),
('Neumología'),
('Psiquiatría'),
('Pediatría')

Insert into Medicos
Values
('Mario José', 'López López', 'H0001', 'Ninguna'),
('Cristhina', 'Portillo López', 'H0002', 'Dedicada'),
('Christian José', 'Nodal Portesuelo', 'H0003', 'Eficiente'),
('Pablo Emilio', 'Escobar Pineda', 'H0004', 'Eficaz'),
('Jonathan', 'Orellana Quintanilla', 'H0005', 'Ninguna'),
('Brandon José', 'Villeda Mejia', 'H0006', 'Ninguna')

Insert into Medicos_Cargos
Values
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(6, 1),
(2, 1)

Insert into Especiales_Medicos
Values
(6,1),
(5,2),
(3,3),
(4,4),
(2,5),
(1,6),
(1,2),
(6,6)

Insert into Pacientes
Values
(001, 'Marcos Josué', 'Guillen Portillo', 'Calle 3a Poniente', 'M', 'Chalatenango', '051', 5, 'Fatiga'),
(002, 'Maria José', 'Alvarez Portillo', 'Calle 3a Poniente', 'F', 'Chalatenango', '051', 1, 'Dolor cuerpo'),
(003, 'Marcos Serafin', 'Guardado Galvez', 'Av. Chicunhuexo', 'M', 'Chalatenango', 'a053', 3, 'Irritación'),
(004, 'Telvina María', 'Guillen Portillo', 'Av. Chicunhuexo', 'F', 'Chalatenango', '053', 5, 'Fatiga'),
(005, 'Cristian', 'Alas', 'Calle 3a Poniente', 'M', 'Chalatenango', '051', 8, 'Pálido'),
(006, 'Rosalía', 'Durán Durán', 'Calle francisco gavidia', 'F', 'Chalatenango', '2430', 0, 'Ninguna'),
(007, 'Pablo Josué', 'Ramirez Gutierrez', 'Calle 3a Poniente', 'M', 'Chalatenango', '051', 5, 'Pálido'),
(008, 'Mauricio', 'Sandobal Galvez', 'Calle 4ta poniente', 'M', 'Chalatenango', '011', 5, 'Fatiga'),
(009, 'Orslok Ruben', 'Darío Cortez', 'Main street', 'M', '001', 'Chalatenango', 7, 'Nauseas'),
(010, 'Carola', 'Guarnizo Jimenez', 'Calle 3a Poniente', 'F', 'Texas', '051', 3, 'Cansancio')

Insert into Contacto
Values
(78790964),
(78790954),
(87762964),
(78142566),
(23068000),
(78790123) /*NOTA, no tods los clientes brindaros un número telefónico*/

Insert into Contacto_Paciente
Values
(1, 001),
(2, 001),
(3, 002),
(4, 010),
(5, 009),
(6, 006)

Insert into Ingresos
Values
('Nueva concepción', '2020-11-24', 1, 2, 'Fatiga', 001, 1),
('Nueva concepción', '2020-12-24', 1, 1, 'Se detectó anemia', 001, 2),
('Nueva concepción', '2021-01-11', 1, 2, 'Empeoró', 001, 6),
('Nueva concepción', '2021-02-10', 1, 5, 'Mejoró', 001, 6),
('Nueva concepción', '2021-03-24', 2, 1, 'Se recuperó', 001, 1),
('Nueva concepción', '2021-02-24', 1, 2, 'Dolor de cuerpo', 002, 1),
('Nueva concepción', '2021-03-24', 7, 1, 'Irritación', 003, 5),
('Nueva concepción', '2021-04-24', 5, 4, 'Mejaras leve', 003, 5),
('Nueva concepción', '2021-05-24', 2, 1, 'Recuperó', 003, 4),
('Nueva concepción', '2020-12-24', 1, 2, 'Fatiga', 004, 6),
('Nueva concepción', '2020-12-31', 1, 2, 'Empeora', 004, 6),
('Nueva concepción', '2021-01-24', 1, 2, 'Empeora', 004, 6),
('Nueva concepción', '2021-02-02', 1, 2, 'Se recuperó por completo', 004, 3),
('Nueva concepción', '2020-12-12', 1, 2, 'Retomó la fatiga', 004, 2),
('Nueva concepción', '2021-02-24', 7, 8, 'Pálido', 005, 5),
('Nueva concepción', '2021-03-21', 7, 5, 'Se detecta anemia', 005, 5),
('Nueva concepción', '2021-12-24', 1, 2, 'Mejoras', 005, 5)