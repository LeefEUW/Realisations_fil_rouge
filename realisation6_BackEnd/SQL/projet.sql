create database statify;
use statify;

create table utilisateur
(
	id_user int primary key not null,
    user_login varchar(50) not null,
    user_password varchar(100) not null,
    id_droits int not null
)engine InnoDB;

create table droits 
(
	id_droits int primary key not null,
    nom_droits varchar(50) not null
)engine InnoDB;

create table recommandations
(
	id_recommandations int primary key not null,
    nom_recom varchar(50) not null,
    url_playlist varchar(50) not null,
    id_user int not null
)engine InnoDB;

create table type_recom
(
	id_type_recom int primary key not null,
    nom_type_recom varchar(50) not null
)engine InnoDB;

create table qualifier
(
	id_recommandations int not null,
    id_type_recom int not null
)engine InnoDB;

alter table utilisateur
add constraint user_fk_droits
foreign key (id_droits)
references droits(id_droits);

alter table recommandations
add constraint recommandations_fk_user
foreign key (id_user)
references utilisateur(id_user);

alter table qualifier
add constraint qualifier_recommandations
foreign key (id_recommandations)
references recommandations(id_recommandations);

alter table qualifier
add constraint qualifier_type_recom
foreign key (id_type_recom)
references type_recom(id_type_recom);