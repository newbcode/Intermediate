#!/usr/bin/env perl

use 5.010;
use utf8;
use strict;
use warnings;

my ($new_heading) = @_;

sub turn_towards_heading {
    my $new_heading = shift;
    my $current_heading = current_heading( );
    print "Current heading is ", $current_heading, ".\n";
    print "Come about to $new_heading";
    my $direction = "right";
    my $turn = ($new_heading - $current_heading) % 360;
    unless ($turn) {
        print "On course (good job!).\n";
        return;
    }
    if ($turn > 180) { #long way around
        $turn = 360 - $turn;
        $direction = "left";
    }
    print "by turning $direction $turn degrees.\n";
}
