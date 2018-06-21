#!/usr/bin/perl
# perl-mysql-demo-1.pl

use strict;
use DBI;

my $host     = 'localhost';
my $driver   = 'mysql';
my $database = 'mysql';

my $dsn = "DBI:$driver:database=$database:$host";
print $dsn;

my $username = 'root';
my $password = '';

my $dbh = DBI->connect($dsn, $username, $password) or die $DBI::errstr;
my $sth = $dbh->prepare('show databases');
$sth->execute();

while(my @row = $sth->fetchrow_array()){
	print join('\t', @row) . "\n";
}
$sth->finish();
$dbh->disconnect();
