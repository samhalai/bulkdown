#!/usr/bin/perl

use strict;
use warnings;

use DateTime;
use LWP::Simple;
use Term::ANSIColor;

my $storeFolder = "store";
my $base_url = "http://www.pscleanair.org/airq/visibility/seattleqa/webcam-";
my $extension = ".jpg";
my $time_of_day = "15";

my $wait_min = 5;
my $wait_max = 15;

my $file = "";
my $url = "";

my $now = DateTime->now;
my $start_of_last_year = DateTime->new( year => $now->year- 2);

unless(-e $storeFolder or mkdir $storeFolder) {
		die "Unable to create $storeFolder\n";
}

while ($now > $start_of_last_year) {
	
	$file = $now->ymd('').$time_of_day.$extension;
	$url = $base_url.$file;
	#print $url, "\n";
	$now->subtract( years => 1);
	print color 'reset';
	unless (-e $storeFolder."/".$file) {
		if(is_success(getstore($url, $storeFolder."/".$file))) {
			print $url; print color 'green'; print " DOWNLOADED\n";
			sleep(int($wait_min + rand($wait_max - $wait_min)));
		} else {
			print $url; print color 'red'; print " ERROR\n";
		}
	} else {
		print $url; print color 'yellow'; print " SKIPPED\n";
	}
}

print color 'reset';
