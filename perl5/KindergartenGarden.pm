package KindergartenGarden;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;
our $names = "ABCDEFGHIJKL";
sub plants ( $diagram, $student ) {
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );
    my $idx = index($names,substr($student,0,1));
    my @rows = split /\n/,$diagram;
    my @codes;
    foreach my $i (@rows){
        my @row = split //,substr($i,2*$idx,2);
        push @codes,@row 
    }
    for (my $i = 0; $i < @codes; $i++) {
         $codes[$i]=$plants{$codes["$i"]}
    }; 
    return \@codes
}