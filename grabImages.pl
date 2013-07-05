#!/usr/bin/perl

use strict;
use warnings;

use DateTime;
use LWP::Simple;

my $storeFolder = "store";
my $base_url = "http://www.pscleanair.org/airq/visibility/seattleqa/webcam-";
my $extension = ".jpg";
my $time_of_day = "15";

my $wait_min = 5;
my $wait_max = 15;

my $file = "";
my $url = "";

my $now = DateTime->now;
my $start_of_last_year = DateTime->new( year => $now->year- 5);

unless(-e $storeFolder or mkdir $storeFolder) {
		die "Unable to create $storeFolder\n";
}

while ($now > $start_of_last_year) {
	
	$file = $storeFolder."/".$now->ymd('').$time_of_day.$extension;
	$url = $base_url.$file;
	#print $url, "\n";
	$now->subtract( years => 1);

	unless (-e $file) {
		print "Downloading ", $url, "\n";
		#getstore($url, $file);
		sleep(int($wait_min + rand($wait_max - $wait_min)));
	} else {
		print "Already downloaded ", $file, "\n";
	}
}
