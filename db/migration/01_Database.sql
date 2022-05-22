CREATE DATABASE chitter;
\c chitter

 CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(280), user_id INT, peep_time TIMESTAMP ); 
 
 CREATE DATABASE chitter_test;
\c chitter_test;

 CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(280), user_id INT, peep_time TIMESTAMP ); 