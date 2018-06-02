use DBI;
use strict;

sub Main{
	my $driver = "SQLite";
	my $database = "test.db";
	my $dsn = "DBI:$driver:dbname=$database";
	my $userid = '';
	my $password = '';

	my $dbh = DBI->connect($dsn, $userid, $password, {RaiseError => 1})
		or die $DBI::errstr;

	print "Opened database successgully\n"
}

Main()
