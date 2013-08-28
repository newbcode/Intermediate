#!/usr/bin/env perl 

use strict;
use warnings;
use 5.010;
use Sysadm::Install qw (:all);
use Data::Printer;

my $list;
my $node = 0;
my $tail =\$list;

while (1) {
    my $op_mode = pick("Linked List Operations", ["Insert", "Display", "Size",
            "Delete", "Addall", "Exit"], 1);

    if ( $op_mode eq "Insert" ) {
        say "Enter the number insert : ";
        chomp (my $num = <STDIN>);
        insert($num);
    }
    elsif ( $op_mode eq "Display" ) {
        say "Display Element of Hash";
        display();
    }
    elsif ( $op_mode eq "Exit" ) {
        exit;
    }
}

sub insert {
    my $num = shift;

    if ( $node == 0 ) {
        say "Empity Hash!";
        $node = { data => $num };
        $$tail = $node;
        $tail = \$node->{data};
        say "$num Insert!";
    }
    else {
        $node = { data => $num };
        $tail = $node;
        say "Success insert $tail->{data}";
        $tail = \$node->{data};
    }
}

sub display {
    while ( $list != ) {
        say "Display $tail->{data}"
    }
}
    


=pod
foreach my $num ( 1..5 ) {
    my $node = { data => $num };
    $$tail = $node;
    $tail = \$node->{data};
}
