--Creo esquema

create schema practica_ncr authorization dfpnwxor;

-- Creo la tabla grupos

create table practica_ncr.grupos(
	id_grupo varchar(10) not null,
	grupo varchar(50) not null
);


alter table practica_ncr.grupos
add constraint grupos_PK primary key (id_grupo);

--Creo la tabla Marcas


create table practica_ncr.marcas(
	id_marca varchar(10) not null,
	marca varchar(50) not null,
	id_grupo varchar(10) not null
);


alter table practica_ncr.marcas
add constraint marca_PK primary key (id_marca);


alter table practica_ncr.marcas
add constraint marcas_grupos_FK foreign key (id_grupo)
references practica_ncr.grupos (id_grupo);

--Creo la tabla modelos

create table practica_ncr.modelos(
	id_modelo varchar(10) not null,
	modelo varchar(50) not null,
	id_marca varchar(10) not null
);


alter table practica_ncr.modelos
add constraint modelos_pk primary key (id_modelo);

alter table practica_ncr.modelos
add constraint modelos_marcas_fk foreign key (id_marca)
references practica_ncr.marcas (id_marca);

--Creo la tabla Colores

create table practica_ncr.colores(
	id_color varchar(10) not null,
	color varchar(50) not null
);

alter table practica_ncr.colores
add constraint colores_PK primary key (id_color);

--Creo la tabla Aseguradoras

create table practica_ncr.aseguradoras(
	id_aseguradora varchar(10) not null,
	aseguradora varchar(50) not null
);

alter table practica_ncr.aseguradoras
add constraint aseguradoras_pk primary key (id_aseguradora);


-- Creo la tabla coches

create table practica_ncr.coches(
	id_coche varchar(10) not null,
	id_modelo varchar(10) not null,
	id_color varchar(10) not null,
	fecha_compra date not null,
	num_matricula varchar(8) not null,
	num_km integer not null,
	num_poliza varchar(20) not null,
	id_aseguradora varchar(10) not null
);

alter table practica_ncr.coches
add constraint coches_pk primary key (id_coche);
alter table practica_ncr.coches
add constraint coches_modelos_fk foreign key (id_modelo)
references practica_ncr.modelos (id_modelo);
alter table practica_ncr.coches
add constraint coches_colores_fk foreign key (id_color)
references practica_ncr.colores (id_color);
alter table practica_ncr.coches
add constraint coches_aseguradoras_fk foreign key (id_aseguradora)
references practica_ncr.aseguradoras (id_aseguradora);

-- Creo la tabla monedas
create table practica_ncr.monedas(
	id_moneda varchar(10) not null,
	moneda varchar(50) not null
);

alter table practica_ncr.monedas
add constraint monedas_pk primary key (id_moneda);

--Creo historico de revisiones

create table practica_ncr.historico_revisiones(
	id_coche varchar(10) not null,
	fecha_revision date not null,
	num_km integer not null,
	precio numeric(6,2) not null,
	id_moneda varchar(10) not null
);

alter table practica_ncr.historico_revisiones
add constraint historico_revisiones_pk primary key (id_coche, fecha_revision);

alter table practica_ncr.historico_revisiones
add constraint historico_revisiones_id_coche_fk foreign key (id_coche)
references practica_ncr.coches (id_coche);

alter table practica_ncr.historico_revisiones
add constraint historico_revisiones_moneda_FK foreign key (id_moneda)
references practica_ncr.monedas (id_moneda);


--DDL

--GRUPOS
insert into practica_ncr.grupos
(id_grupo, grupo)
Values ('1', 'VAN');
insert into practica_ncr.grupos
(id_grupo, grupo)
Values ('2', 'TOYOTA');

--MARCAS

insert into practica_ncr.marcas
(id_marca, marca, id_grupo)
Values ('1', 'volkswagen', '1');
insert into practica_ncr.marcas
(id_marca, marca, id_grupo)
Values ('2', 'seat', '1');	
insert into practica_ncr.marcas
(id_marca, marca, id_grupo)
Values ('3', 'audi', '1');	
insert into practica_ncr.marcas
(id_marca, marca, id_grupo)
Values ('4', 'toyota', '2');
insert into practica_ncr.marcas
(id_marca, marca, id_grupo)
Values ('5', 'lexus', '2');	

-- modelos

insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('1','Taigo','1');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('2','Tiguan','1');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('3','Arona','2');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('4','Ateca','2');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('5','A3','3');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('6','A8','3');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('7','Corolla','4');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('8','Yaris','4');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('9','RX','5');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('10','UX 300E','5');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('11','Camry','4');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('12','Mirai','4');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('13','A6','3');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('14','Tarraco','2');
insert into practica_ncr.modelos (id_modelo, modelo, id_marca) Values ('15','Golf','1');


--colores
insert into practica_ncr.colores (id_color, color) Values ('1', 'Negro');
insert into practica_ncr.colores (id_color, color) Values ('2', 'Azul');
insert into practica_ncr.colores (id_color, color) Values ('3', 'Rojo');
insert into practica_ncr.colores (id_color, color) Values ('4', 'Verde');
insert into practica_ncr.colores (id_color, color) Values ('5', 'Plateado');
insert into practica_ncr.colores (id_color, color) Values ('6', 'Blanco');

--Aseguradoras

insert into practica_ncr.aseguradoras (id_aseguradora, aseguradora) Values ('1', 'Mapfre');
insert into practica_ncr.aseguradoras (id_aseguradora, aseguradora) Values ('2', 'MMT');
insert into practica_ncr.aseguradoras (id_aseguradora, aseguradora) Values ('3', 'AXA');


--Moneda

insert into practica_ncr.monedas (id_moneda, moneda) Values ('1', 'EUR');
insert into practica_ncr.monedas (id_moneda, moneda) Values ('2', 'USD');
insert into practica_ncr.monedas (id_moneda, moneda) Values ('3', 'GBP');

-- Coches

insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('1','2','1','20220603','XXXXXXX','12000','poliza1','1');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('2','5','1','20220603','YYYYYYY','0','poliza2','2');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('3','9','6','20220603','AAAAAAA','125000','poliza3','2');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('4','2','6','20220603','BBBBBBB','20000','poliza4','2');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('5','4','1','20220603','CCCCCCC','20000','poliza5','1');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('6','3','6','20220603','PPPPPPP','1200','poliza6','1');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('7','9','2','20220603','MMMMMMM','20000','poliza7','1');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('8','9','2','20220603','NNNNNNN','0','poliza8','1');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('9','15','5','20220603','UUUUUUU','20000','poliza9','3');
insert into practica_ncr.coches (id_coche, id_modelo, id_color, fecha_compra, num_matricula, num_km, num_poliza, id_aseguradora) Values ('10','1','5','20220603','ZZZZZZZ','20000','poliza10','1');











