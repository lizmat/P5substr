use v6.c;
use Test;
use P5substr;

plan 2;

ok defined(::('&substr')),          'is &substr imported?';
ok !defined(P5substr::{'&substr'}), 'is &substr externally NOT accessible?';

# vim: ft=perl6 expandtab sw=4
