create user notes_develop@localhost identified by 'notes_develop',
notes_test@localhost identified by 'notes_test',
notes_release@localhost identified by 'notes_release';
grant all on *.* to 'notes_develop'@'localhost';
grant all on *.* to 'notes_test'@'localhost';
grant all on *.* to 'notes_release'@'localhost';
