#!/usr/bin/perl

use strict;
use warnings;
use DateTime;

my $base_url = "http://www.pscleanair.org/airq/visibility/seattleqa/webcam-";
my $extension = ".jpg";
my $time_of_day = "15";
my $now = DateTime->now;
my $start_of_last_year = DateTime->new( year => $now->year - 1);
while ($now > $start_of_last_year) {
	print $base_url, $now->ymd(''), $time_of_day, $extension, "\n";
	$now->subtract( days => 1);
}