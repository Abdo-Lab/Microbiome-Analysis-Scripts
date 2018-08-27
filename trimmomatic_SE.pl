# prepared by: Zaid Abdo 10/2017
#!/usr/bin/perl -w
# inputting R1 file names
open INPUT, "<$ARGV[0]";
chomp(@files = <INPUT>);
close INPUT;

# inputing parameters
open PARM, "<$ARGV[1]";
chomp($parms = <PARM>);
close PARM;

# inputing primer file
$prim_name = $ARGV[2];

system("mkdir SE");
foreach $i (@files){
  print($i."\n");
  system("java -jar /usr/local/Trimmomatic-0.36/trimmomatic-0.36.jar SE $i -threads 32 SE/$i ILLUMINACLIP:$prim_name:2:30:10 $parms");
}

