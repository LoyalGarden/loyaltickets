--
-- This file is part of alf.io.
--
-- alf.io is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- alf.io is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with alf.io.  If not, see <http://www.gnu.org/licenses/>.
--

create table script_support (
    path varchar(128) not null,
    name varchar(64) not null,
    hash varchar(256) not null,
    enabled boolean not null,
    async boolean not null,
    script mediumtext not null
);
alter table script_support add constraint unique_script_support unique(path, name);

create table script_event (
    path_fk varchar(128) not null,
    name_fk varchar(64) not null,
    event varchar(128) not null
);

alter table script_event add constraint unique_script_event unique(path_fk, name_fk);
alter table script_event add foreign key(path_fk, name_fk) references script_support(path, name);