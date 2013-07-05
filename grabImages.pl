#!/usr/bin/perl

use strict;
use warnings;

use DateTime;
use LWP::Simple;

my $storeFolder = "store";
my $base_url = "http://www.pscleanair.org/airq/visibility/seattleqa/webcam-";
my $extension = ".jpg";
my $time_of_day = "15";
my $filename = "";
my $now = DateTime->now;
my $start_of_last_year = DateTime->new( year => $now->year- 1);

unless(-e $storeFolder or mkdir $storeFolder) {
		die "Unable to create $storeFolder\n";
}

while ($now > $start_of_last_year) {
	$filename = $now->ymd('').$time_of_day.$extension;
	print $base_url, $filename, "\n";
	$now->subtract( days => 1);
}
