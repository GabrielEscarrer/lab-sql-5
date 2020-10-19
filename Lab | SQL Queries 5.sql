#1 Drop column picture from staff.
Use sakila;
ALTER TABLE staff DROP picture;
Select * from Sakila.staff;

#2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
Select * from sakila.customer 
where first_name = "Tammy" and last_name = "sanders";

insert into Sakila.staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password)
Values("3", 'Tammy', 'Sanders', '79', 'tammy.sanders@sakilacustomer.org', '2', '1', 'Tammy', ' ');
Select * from sakila.staff;

#3 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1 today.
 show fields from rental;
 insert into rental
 values(16050,
	curdate(),
    1,
    (select customer_id from customer where first_name = "Charlotte" and last_name = "Hunter"),
    null,
    (select staff_id from staff where first_name = "Mike"), current_date);
    
#4 Delete non-active users, but first, create a backup table deleted_users to store cu stomer_id, email, and the date the user was deleted.
 Create table deleted_user as (SELECT customer_id, email, create_date, active
 from sakila.customer
 where create_date = current_date() and active=0);
 select * from sakila.deleted_user;
 
 