#!/usr/bin/perl

require "test/comsubs.pl";

my $opts = "-q";

do_test("kmeans", "10 16 5000000 40 $opts");

do_test("pca", "-R 2048 -C 2048 $opts");

do_test("matrix_mult", "-l 2048 $opts");

do_test("wrmem", "$opts");

do_test("hist", "data/hist-2.6g.bmp $opts");

# The input is generated via data/data-gen.sh
do_test("linear_regression", "data/lr_4GB.txt $opts");

# The input is generated via data/data-gen.sh
do_test("string_match", "data/sm_1GB.txt $opts");

do_test("wc", "data/wc/300MB_1M_Keys.txt $opts");
# this input is used for comparision with hadoop
do_test("wc", "data/wc/10MB.txt -p 1 $opts");

# many keys and few duplicates
do_test("wr", "data/wr/100MB_1M_Keys.txt $opts");
# few keys and many duplicates
do_test("wr", "data/wr/100MB_100K_Keys.txt $opts");
# many keys and many duplicates. The input is generated via data/data-gen.sh
do_test("wr", "data/wr/800MB.txt $opts");
# many keys and many duplicates, but unpredictable. The input is generated by data/data-gen.sh
do_test("wr", "data/wr/500MB.txt $opts");


