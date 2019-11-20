# TEST 1
BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;}
use Lingua::EN::Semtags::Engine;
$loaded = 1;
print "ok 1\n";

# TEST 2
my $engine = Lingua::EN::Semtags::Engine->new;
my $semtags = join " ", $engine->semtags("BBtv: Graffiti Research Lab, the movie");

if ($semtags eq "DECORATION WORKPLACE SHOW") {
    print "ok 2\n";
} else {
    print "not ok 2\n";
}
