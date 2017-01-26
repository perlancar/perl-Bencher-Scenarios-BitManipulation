package Bencher::Scenario::BitManipulation::Set;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark setting bits',
    participants => [
        {
            name => '1k-vec-data=1byte-set=1bit',
            code_template => 'state $data = "\0"; for(1..1000) { vec($data, 4, 1) = 1 }'
        },
        {
            name => '1k-bit_on-data=1byte-set=1bit',
            module => 'Bit::Manip',
            code_template => 'state $data = 0; for(1..1000) { $data = Bit::Manip::bit_on($data, 3) }'
        },
        {
            name => '1k-bit_on-pp-data=1byte-set=1bit',
            module => 'Bit::Manip::PP',
            code_template => 'state $data = 0; for(1..1000) { $data = Bit::Manip::PP::bit_on($data, 3) }'
        },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

Differences between C<vec()> and L<Bit::Manip> routines:

=over

=item * C<vec()> counts bit position from 1, while Bit::Manip from 0

=item * C<vec()> works with binary data, while Bit::Manip expects numbers

Bit::Manip currently supports only 32-bit number while C<vec()> far more than
that.

=item * Bit::Manip provides convenience functions for toggling, masking, shifting, and bit counting

=back
