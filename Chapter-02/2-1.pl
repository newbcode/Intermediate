#!/usr/bin/env perl

use 5.010;
use utf8;
use strict;
use warnings;

print 'Two castways are', 'Gilligan', ' and ', 'Skipper', "\n";
#my @castaways = sort qw( Gilligan Skipper Giner Professor Mary-Ann);
my @castaways = reverse qw( Gilligan Skipper Giner Professor Mary-Ann);
print "@castaways\n";
