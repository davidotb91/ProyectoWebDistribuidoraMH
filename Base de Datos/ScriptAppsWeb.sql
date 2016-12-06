/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     04/12/2016 21:29:46                          */
/*==============================================================*/


drop table if exists CLIENTE;

drop table if exists ORDEN_CC;

drop table if exists PEDIDOS;

drop table if exists PERFIL;

drop table if exists PRODUCTO;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   ID_CLIENTE           int not null auto_increment,
   ID_PERFIL            int,
   NOMBRES              char(100) not null,
   APELLIDOS            char(100) not null,
   CI                   char(10),
   RUC                  char(13),
   DIRECCION            char(100) not null,
   TELEFONO_FIJO        char(10),
   CELULAR              char(10) not null,
   RAZON_SOCIAL         char(100),
   ESTADO               char(10),
   primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: ORDEN_CC                                              */
/*==============================================================*/
create table ORDEN_CC
(
   ID_CC                int not null auto_increment,
   FECHA_COMPRA         date not null,
   ESTADO               char(10) not null,
   primary key (ID_CC)
);

/*==============================================================*/
/* Table: PEDIDOS                                               */
/*==============================================================*/
create table PEDIDOS
(
   ID_PEDIDO            int not null auto_increment,
   ID_CLIENTE           int,
   ID_CC                int,
   NUM_PEDIDO           int not null,
   FECHA_PEDIDO         date not null,
   ESTADO               char(10),
   primary key (ID_PEDIDO)
);

/*==============================================================*/
/* Table: PERFIL                                                */
/*==============================================================*/
create table PERFIL
(
   ID_PERFIL            int not null auto_increment,
   ID_CLIENTE           int,
   USUARIO              char(20) not null,
   CLAVE                char(10) not null,
   ROL                  char(20) not null,
   ESTADO               char(10),
   primary key (ID_PERFIL)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   ID_PRODUCTO          int not null auto_increment,
   ID_PEDIDO            int,
   DESCRIPCION          char(100) not null,
   ESTADO               char(10),
   primary key (ID_PRODUCTO)
);

alter table CLIENTE add constraint FK_CLIENTE_PERFIL foreign key (ID_PERFIL)
      references PERFIL (ID_PERFIL) on delete restrict on update restrict;

alter table PEDIDOS add constraint FK_CLIENTE_PEDIDOS foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table PEDIDOS add constraint FK_RELATIONSHIP_4 foreign key (ID_CC)
      references ORDEN_CC (ID_CC) on delete restrict on update restrict;

alter table PERFIL add constraint FK_CLIENTE_PERFIL2 foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_RELATIONSHIP_3 foreign key (ID_PEDIDO)
      references PEDIDOS (ID_PEDIDO) on delete restrict on update restrict;

