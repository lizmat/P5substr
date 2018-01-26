use v6.c;
use Test;
use P5substr;

plan 2;

ok defined(::('&substr')),          'is &substr imported?';
ok !defined(P5substr::{'&substr'}), 'is &substr externally NOT accessible?';

{
    my $s = "The black cat climbed the green tree";
    is substr($s,   4,   5), 'black',                  'positive length';
    is substr($s,   4, -11), 'black cat climbed the',  'negative length';
    is substr($s,  14     ), 'climbed the green tree', 'no length';
    is substr($s,  -4     ), 'tree',                   'negative offset';
    is substr($s,  -4,   2), 'tr',                     'neg offset, pos length';
    is substr($s, -10,  -5), 'green',                  'neg offset, neg length';
}

=finish

my $name = 'fred';
substr($name, 4) = 'dy';
is $name, 'freddy', 'did we get a freddy';

my $null = substr $name, 6, 2;   # returns "" (no warning)
my $oops = substr $name, 7;      # returns undef, with warning
#try substr($name, 7) = 'gap';        # raises an exception

my $s = "The black cat climbed the green tree";
my $z = substr $s, 14, 7, "jumped from";    # climbed
# $s is now "The black cat jumped from the green tree"

my $x = '1234';
for substr($x,1,2) {
    $_ = 'a';   print $x,"\n";    # prints 1a4
    $_ = 'xyz'; print $x,"\n";    # prints 1xyz4
    $x = '56789';
    $_ = 'pq';  print $x,"\n";    # prints 5pq9
}

$x = '1234';
for substr($x, -3, 2) {
    $_ = 'a';   print $x,"\n";    # prints 1a4, as above
    $x = 'abcdefg';
    print $_,"\n";                # prints f
}

# vim: ft=perl6 expandtab sw=4
