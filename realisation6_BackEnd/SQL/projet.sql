create database statify;
use statify;
create table user
(
	id_user int primary key not null,
    login_user varchar(50),
    pass_user varchar(100),
    spotify_compte varchar(255),
    id_droits int
)engine=InnoDb;

create table droits
(
	id_droits int primary key not null,
    nom_droits varchar(50)
)engine=InnoDb;

alter table user
add constraint fk_posseder_droit
foreign key (id_droits)
references droits(id_droits)