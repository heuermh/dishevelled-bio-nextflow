Example data
---

BED feature example

```bash
wget ftp://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/analysis/NIST_union_callsets_06172013/All.simplerepeatsnocov.bed.gz
dsh-bio split-bed -i All.simplerepeatsnocov.bed.gz -r 1000 -p All.simplerepeatsnocov.part -s .bed.gz
mv All.simplerepeatsnocov.part0.bed.gz feature.bed.gz
```

GFF3 feature example

```bash
wget ftp://ftp.ensembl.org/pub/release-97/gff3/homo_sapiens/Homo_sapiens.GRCh38.97.gff3.gz
dsh-bio split-gff3 -i Homo_sapiens.GRCh38.97.gff3.gz -r 1000 -p Homo_sapiens.GRCh38.97.part -s .gff3.gz
mv Homo_sapiens.GRCh38.97.part0.gff3.gz feature.gff3.gz
```

Genome reference example

```bash
wget ftp://ftp.ensembl.org/pub/release-97/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.19.fa.gz
wget ftp://ftp.ensembl.org/pub/release-97/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.20.fa.gz
wget ftp://ftp.ensembl.org/pub/release-97/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.21.fa.gz
wget ftp://ftp.ensembl.org/pub/release-97/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.22.fa.gz
gzcat Homo_sapiens.GRCh38.dna.chromosome.*.fa.gz | dsh-bio truncate-fasta -l 250000 -o reference.fa.gz
```

Transcriptome example

```bash
wget ftp://ftp.ensembl.org/pub/release-97/fasta/homo_sapiens/cds/Homo_sapiens.GRCh38.cds.all.fa.gz
dsh-bio split-fasta -i Homo_sapiens.GRCh38.cds.all.fa.gz -r 1000 -p Homo_sapiens.GRCh38.cds.all.part -s .fa.gz
mv Homo_sapiens.GRCh38.cds.all.part0.fa.gz transcript.fa.gz
```

Translation example, see https://github.com/heuermh/dishevelled-bio/issues/17

```bash
wget ftp://ftp.ensembl.org/pub/release-97/fasta/homo_sapiens/pep/Homo_sapiens.GRCh38.pep.all.fa.gz
dsh-bio split-fasta -i Homo_sapiens.GRCh38.pep.all.fa.gz -r 1000 -p Homo_sapiens.GRCh38.pep.all.part -s .fa.gz
mv Homo_sapiens.GRCh38.pep.all.part0.fa.gz protein.fa.gz
```

Alignment example

```bash
samtools view ftp://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/data/NA12878/NIST_NA12878_HG001_HiSeq_300x/NHGRI_Illumina300X_novoalign_bams/HG001.hs37d5.300x.bam 21:10,000,000-10,100,000 -h > HG001.hs37d5.300x.21.sam
dsh-bio split-sam -i HG001.hs37d5.300x.21.sam -r 1000 -p HG001.hs37d5.300x.21.part -s .sam.gz
mv HG001.hs37d5.300x.21.part0.sam.gz alignment.sam.gz
```

FASTQ example

```bash
samtools fastq alignment.sam.gz -N -1 alignment_1.fq.gz -2 alignment_2.fq.gz
samtools fastq alignment.sam.gz -N -1 alignment_1.fq.bgz -2 alignment_2.fq.bgz
```

Variant example

```bash
wget ftp://ftp.ensembl.org/pub/release-97/variation/vcf/homo_sapiens/homo_sapiens-chr21.vcf.gz
dsh-bio split-vcf -i homo_sapiens-chr21.vcf.gz -r 1000 -p homo_sapiens-chr21.part -s .vcf.gz
mv homo_sapiens-chr21.part0.vcf.gz variant.vcf.gz
```

Genotype example

```bash
wget ftp://ftp-trace.ncbi.nlm.nih.gov/giab/ftp/release/NA12878_HG001/NISTv3.3.2/GRCh38/HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz
dsh-bio split-vcf -i HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz -r 1000 -p HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.part -s .vcf.gz
mv HG001_GRCh38_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.part0.vcf.gz genotype.vcf.gz
```

gVCF genotype example

```bash
wget ftp://ngs.sanger.ac.uk/production/hgdp/hgdp_wgs.20190516/gVCFs/HGDP00125.hgdp_wgs.20190516.vcf.gz
dsh-bio split-vcf -i HGDP00125.hgdp_wgs.20190516.vcf.gz -r 1000 -p HGDP00125.hgdp_wgs.20190516.part -s .vcf.gz
mv HGDP00125.hgdp_wgs.20190516.part0.vcf.gz gvcf.vcf.gz
```

Block-gzipped (BGZF) versions

```bash
dsh-bio compress-vcf -i variant.vcf.gz -o variant.vcf.bzf
```

Bzip2 versions

```bash
dsh-bio compress-vcf -i variant.vcf.gz -o variant.vcf.bz2
```
