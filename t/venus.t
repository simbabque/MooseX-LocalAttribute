use strict;
use warnings;

use Test::More;
use Test::Requires 'Venus';

use FindBin qw($Bin);
use lib "$Bin/lib";
use Tester::Venus;
use Tester;

Tester::run_tests( Tester::Venus->new );

done_testing;
