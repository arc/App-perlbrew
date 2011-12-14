#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use FindBin;
use lib $FindBin::Bin;
use App::perlbrew;
require 'test_helpers.pl';


my $app = App::perlbrew->new();
my $version = $App::perlbrew::VERSION;

my $current = file($App::perlbrew::PERLBREW_HOME, "current");

ok !-f $current;
is $app->current_perl, "";

io($current)->print("perl-5.12.3");
ok -f $current;
is $app->current_perl, "perl-5.12.3";

io($current)->print("perl-5.14.2");
is $app->current_perl, "perl-5.14.2";

io($current)->print('perl-5.14.2@abcd');
is $app->current_perl, 'perl-5.14.2@abcd';

done_testing;
