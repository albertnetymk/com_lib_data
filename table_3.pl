my $count = 3;
my $i = 1;
my $line = 1;
while(<>) {
    if ($i == 1) {
        print "|v$line";
    }
    chomp();
    print "|", $_;
    if ($i == $count) {
        $i = 0;
        $line++;
        print "|\n";
    }
    $i++;
}
