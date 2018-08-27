!#/usr/bin/perl -w

# load barcode file (revers complemented if need be)
open INDEX, "<$ARGV[0]"; 
chomp(@index=<INDEX>);
close INDEX;

for($i = 0; $i <= $#index; $i++){
  @sp = split/,/, $index[$i];
  $keys[$i] = $sp[0];
  $index{$keys[$i]} = $sp[1];
  #print($keys[$i]."\n".$index{$keys[$i]}."\n");
}

# load error rate
#$err = $ARGV[2];

# process sequence files and separate using primers
#$l = 0;
# I1 files
open IN0, "<$ARGV[1]";
chomp(@code=<IN0>);
close IN0;
# R1 files
open IN1, "<$ARGV[2]";
chomp(@seqr1=<IN1>);
close IN1;
# R2 file
open IN2, "<$ARGV[3]";
chomp(@seqr2=<IN2>);
close IN2;
for($j = 0; $j <= $#keys; $j ++){
  open OUT1, ">$keys[$j]_R1.fq";
  open OUT2, ">$keys[$j]_R2.fq";
  for($i = 0; $i <= $#code; $i = $i + 4){
    if($index{$keys[$j]} =~ /$code[$i+1]/){
      @names1 = split/\s+/, $seqr1[$i];
      @names2 = split/\s+/, $seqr2[$i];
      print OUT1 $names1[0]."_".$keys[$j]."_1\n";
      print OUT2 $names2[0]."_".$keys[$j]."_2\n";
      for($k = 1; $k < 4; $k++){
        print OUT1 $seqr1[$i+$k]."\n";
        print OUT2 $seqr2[$i+$k]."\n";
      }
    }
  }
  close(OUT1);
  close(OUT2);
}
