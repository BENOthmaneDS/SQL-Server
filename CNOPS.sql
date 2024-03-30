/*==============================================================*/
/* Nom de SGBD :  Microsoft SQL Server 2008                     */
/* Date de création :  3/3/2022 5:46:26 PM                      */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('CHAMBRE')
            and   type = 'U')
   drop table CHAMBRE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONSULTE')
            and   name  = 'CONSULTE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONSULTE.CONSULTE2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CONSULTE')
            and   name  = 'CONSULTE_FK'
            and   indid > 0
            and   indid < 255)
   drop index CONSULTE.CONSULTE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CONSULTE')
            and   type = 'U')
   drop table CONSULTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MEDECIN')
            and   type = 'U')
   drop table MEDECIN
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PATIENT')
            and   type = 'U')
   drop table PATIENT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SEJOURNER')
            and   name  = 'SEJOURNER2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SEJOURNER.SEJOURNER2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SEJOURNER')
            and   name  = 'SEJOURNER_FK'
            and   indid > 0
            and   indid < 255)
   drop index SEJOURNER.SEJOURNER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SEJOURNER')
            and   type = 'U')
   drop table SEJOURNER
go

/*==============================================================*/
/* Table : CHAMBRE                                              */
/*==============================================================*/
create table CHAMBRE (
   CNUM                 int                  not null,
   CPRIXJOUR            int                  null,
   constraint PK_CHAMBRE primary key nonclustered (CNUM)
)
go

/*==============================================================*/
/* Table : CONSULTE                                             */
/*==============================================================*/
create table CONSULTE (
   MNUMERO              int                  not null,
   PNUMERO              int                  not null,
   DATE_CONSULTATION    datetime             null,
   DIAGNOSTIC           text                 null,
   constraint PK_CONSULTE primary key (MNUMERO, PNUMERO)
)
go

/*==============================================================*/
/* Index : CONSULTE_FK                                          */
/*==============================================================*/
create index CONSULTE_FK on CONSULTE (
MNUMERO ASC
)
go

/*==============================================================*/
/* Index : CONSULTE2_FK                                         */
/*==============================================================*/
create index CONSULTE2_FK on CONSULTE (
PNUMERO ASC
)
go

/*==============================================================*/
/* Table : MEDECIN                                              */
/*==============================================================*/
create table MEDECIN (
   MNUMERO              int                  not null,
   MNOM                 text                 null,
   MQUALITE             text                 null,
   constraint PK_MEDECIN primary key nonclustered (MNUMERO)
)
go

/*==============================================================*/
/* Table : PATIENT                                              */
/*==============================================================*/
create table PATIENT (
   PNUMERO              int                  not null,
   PNOMPRENOM           text                 null,
   PMUTUELLE            text                 null,
   constraint PK_PATIENT primary key nonclustered (PNUMERO)
)
go

/*==============================================================*/
/* Table : SEJOURNER                                            */
/*==============================================================*/
create table SEJOURNER (
   PNUMERO              int                  not null,
   CNUM                 int                  not null,
   DATE_DEBUT           datetime             null,
   DATE_FIN             datetime             null,
   constraint PK_SEJOURNER primary key (PNUMERO, CNUM)
)
go

/*==============================================================*/
/* Index : SEJOURNER_FK                                         */
/*==============================================================*/
create index SEJOURNER_FK on SEJOURNER (
PNUMERO ASC
)
go

/*==============================================================*/
/* Index : SEJOURNER2_FK                                        */
/*==============================================================*/
create index SEJOURNER2_FK on SEJOURNER (
CNUM ASC
)
go

