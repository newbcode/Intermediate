#!/usr/bin/env perl 

use strict;
#use warnings;
use 5.010;
use Sysadm::Install qw (:all);
use Data::Printer;
use constant NEXT   => 0;
use constant VAL    => 1;


my $list = undef;

while (1) {
    my $op_mode = pick("Linked List Operations", ["Insert", "Display", "Size",
            "Delete", "Addall", "Exit"], 1);

    if ( $op_mode eq "Insert" ) {
        say "Enter the number to insert : ";
        chomp (my $num = <STDIN>);
        insert($num);
    }
    elsif ( $op_mode eq "Display" ) {
        display();
    }
    elsif ( $op_mode eq "Size" ) {
        size();
    }
    elsif ( $op_mode eq "Delete" ) {
        say "Enter the number to delete : ";
        chomp (my $num = <STDIN>);
        del_num($num);
    }
    elsif ( $op_mode eq "Addall" ) {
        addall();
    }
    elsif ( $op_mode eq "Exit" ) {
        exit;
    }
}

sub insert {
    my $num = shift;
    
    $list = [ $list, $num ];
    say "Success insert to $num";
}

sub display {
    say "List is Empty" if ( $list eq "" );
    my $t_list = $list;
    while ( $t_list ne ""  ) {
        say "Element(s) in the list are : $t_list->[VAL]";
        $t_list = $t_list->[NEXT];
    }
}

sub size {
    my $cnt = 0;
    my $t_list = $list;

    while ( $t_list ) {
        $t_list = $t_list->[NEXT];
        $cnt++;
    }
    say "Size of ther list is $cnt";
}

sub del_num {
    my $num = shift;
    my $t_list = $list;
    my $p_list;
    my $flag = 'off';

    while ( $t_list ) {
        if ( $t_list->[VAL] == $num ) {
            $flag = 'on';
            if ( $t_list->[NEXT] eq "" ) {
                shift @{$p_list}; 
                unshift @{$p_list}, undef;
                say "(Last number)$num deleted successfully";
            }
            else {
                p @{$p_list};
                p @{$t_list};
                shift @{$p_list}; 
                p @{$p_list};
                $list = $p_list;
                p $list;

                say "$num deleted successfully";
            }
        }
        $p_list = $t_list;
        $t_list = $t_list->[NEXT];
    }
    say "Not found $num" if ( $flag eq 'off' );
}

sub addall {
    my $t_list = $list;
    my $sum;
    while ( $t_list ) {
        my $num = $t_list->[VAL];
        $sum += $num;
        $t_list = $t_list->[NEXT];
    }
    say "Add all number is $sum";
}

=pod
foreach my $num ( 1..5 ) {
    my $node = { data => $num };
    $$tail = $node;
    $tail = \$node->{data};
}
