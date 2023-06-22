create database BookManagement
on primary
(	name='BookManagement_data',
	filename='D:\DATA\BookManagement_data.mdf',
	size=8MB,
	filegrowth=10%
)
log on
(	name='BookManagement_log',
	filename='D:\DATA\BookManagement_log.ldf',
	size=8MB,
	filegrowth=10%
)