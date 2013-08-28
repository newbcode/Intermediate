#!/usr/bin/env perl 

use strict;
use warnings;
use 5.010;
use Sysadm::Install qw (:all);
use Data::Printer;

my $list;
my $tail =\$list;

pick("Linked List Operations", ["Insert", "Display", "Size", "Delete",
        "Addall"], 1);

if ( $pick eq "Insert" ) {
    say $pick;
}

sub insert {
    my $num = shift;

    if ( $list eq undef ) {
        say "Undef";
        my $node = { data => $num };
        my $list = $node;
        say $list->{data};
    }
}

=pod
foreach my $num ( 1..5 ) {
    my $node = { data => $num };
    $$tail = $node;
    $tail = \$node->{data};
}
