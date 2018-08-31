#Prepared by Zaid Abdo For Class 10/29/2017
#!/usr/bin/perl -w
chomp($file_name = $ARGV[0]); # name of file containing processing and treatment structure
chomp($proc = $ARGV[1]); # number of processors

###### making contigs
#system("mothur \"#make.contigs(file=$file_name, processors=$proc); summary.seqs()\"");

@name = split/\./,$file_name;

###### further processing and cleaning 
#system("mothur \"#screen.seqs(fasta=$name[0].trim.contigs.fasta, group=$name[0].contigs.groups,maxambig=0,maxhomop=8,maxlength=253,processors=$proc);summary.seqs()\"");
#system("mothur \"#unique.seqs(fasta=$name[0].trim.contigs.good.fasta);summary.seqs(fasta=current,name=current)\"");
#system("mothur \"#count.seqs(name=$name[0].trim.contigs.good.names, group=$name[0].contigs.good.groups);summary.seqs(fasta=$name[0].trim.contigs.good.unique.fasta,count=current)\"");

###### removing chimeras
#system("mothur \"#chimera.uchime(fasta=$name[0].trim.contigs.good.unique.fasta, count=$name[0].trim.contigs.good.count_table, dereplicate=t,processors=$proc)\"");
#system("mothur \"#remove.seqs(fasta=$name[0].trim.contigs.good.unique.fasta, accnos=$name[0].trim.contigs.good.unique.denovo.uchime.accnos)\"");

###### sequence classification and removing lineages other than bacteria
#system("mothur \"#classify.seqs(fasta=$name[0].trim.contigs.good.unique.pick.fasta, count=$name[0].trim.contigs.good.denovo.uchime.pick.count_table,reference=/usr/local/mothur-db/silva/silva.nr_v128.align, taxonomy=/usr/local/mothur-db/silva/silva.nr_v128.tax,cutoff=80,processors=$proc)\"");
#system("mothur \"#remove.lineage(fasta=$name[0].trim.contigs.good.unique.pick.fasta,count=$name[0].trim.contigs.good.denovo.uchime.pick.count_table,taxonomy=$name[0].trim.contigs.good.unique.pick.nr_v128.wang.taxonomy,taxon=Chloroplast-Mitochondria-Archaea-Eukaryota)\"");

###### Mock community and assessing error rate
#system("mothur \"#get.groups(count=$name[0].trim.contigs.good.denovo.uchime.pick.pick.count_table,fasta=$name[0].trim.contigs.good.unique.pick.pick.fasta,groups=Mock)\"");
#system("mothur \"#seq.error(fasta=$name[0].trim.contigs.good.unique.pick.pick.pick.fasta,count=$name[0].trim.contigs.good.denovo.uchime.pick.pick.pick.count_table,reference=/usr/local/mothur-db/HMP_MOCK.v35.fasta,aligned=F)\"");

###### OTU clustering, OTU count files, and OTU taxonomic asignment
#system("mothur \"#cluster(fasta=$name[0].trim.contigs.good.unique.pick.pick.fasta, count=$name[0].trim.contigs.good.denovo.uchime.pick.pick.count_table,method=dgc)\"");
#system("mothur \"#make.shared(list=$name[0].trim.contigs.good.unique.pick.pick.dgc.list, count=$name[0].trim.contigs.good.denovo.uchime.pick.pick.count_table,label=0.03)\"");
#system("mothur \"#classify.otu(list=$name[0].trim.contigs.good.unique.pick.pick.dgc.list,count=$name[0].trim.contigs.good.denovo.uchime.pick.pick.count_table, taxonomy=$name[0].trim.contigs.good.unique.pick.nr_v128.wang.pick.taxonomy,label=0.03)\"");

##### Result directory and files
system("mkdir results");
system("cp $name[0].trim.contigs.good.unique.pick.pick.dgc.shared results/$name[0].shared");
system("cp $name[0].trim.contigs.good.unique.pick.pick.dgc.0.03.cons.taxonomy results/$name[0].0.03.cons.taxonomy");
system("cp $name[0].trim.contigs.good.unique.pick.pick.dgc.0.03.cons.tax.summary results/$name[0].0.03.cons.tax.summary");

##### Recovering the representative sequences per OTU
#system("mothur \"#bin.seqs(list=treat.trim.contigs.good.unique.good.filter.unique.precluster.pick.pick.opti_mcc.list,fasta=treat.trim.contigs.good.unique.good.filter.unique.precluster.pick.fasta,label=0.03)\"");
