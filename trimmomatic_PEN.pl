# prepared by:Zaid Abdo 10/2017
#!/usr/bin/perl -w
# inputting R1 file names
open INPUT, "<$ARGV[0]";
chomp(@files = <INPUT>);
close INPUT;

# inputing parameters
open PARM, "<$ARGV[1]";
chomp($parms = <PARM>);
close PARM;

system("mkdir PE U");
foreach $i (@files){
  $i=~ /(.*)R1(.*)/;
  print($1."\n");
  system("java -jar /usr/local/Trimmomatic-0.36/trimmomatic-0.36.jar PE $1R1$2 $1R2$2 PE/$1R1$2 U/$1u1$2 PE/$1R2$2 U/$1u2$2 $parms");
}
