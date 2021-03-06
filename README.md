# dishevelled-bio-nextflow
dsh-bio workflow processes implemented via Nextflow. Apache 2 licensed.


## Summary

[dishevelled.org bio](https://github.com/heuermh/dishevelled-bio) provides a
set of command line tools for BED, FASTA, FASTQ, GFA1/2, GFF3, SAM, and VCF files.

Some of those command line tools are wrapped here for use in [Nextflow](https://www.nextflow.io/)
workflows.  `dsh-bio` can be installed via [Homebrew](https://github.com/brewsci/homebrew-bio),
[Bioconda](https://bioconda.github.io/), or run via [Docker](https://biocontainers.pro/#/)
or [Singularity](https://biocontainers.pro).

```bash
$ nextflow split_vcf_bgz.nf

N E X T F L O W  ~  version 19.04.1
Launching `split_vcf_bgz.nf` [festering_mestorf] - revision: d764af4c15
[warm up] executor > local
executor >  local (3)

[4f/2752a0] process > split_vcf_bgz [  0%] 0 of 3
Split variant to 10 files:
[work/4f/2752a025a0de2996752c5f491b0dd8/variant.0.vcf.bgz, work/4f/2752a025a0de2996752c5f491b0dd8/variant.1.vcf.bgz, work/4f/2752a025a0de2996752c5f491b0dd8/variant.2.vcf.bgz, work/4f/2752a025a0de2996752c5f491b0dd8/variant.3.vcf.bgz, work/4f/2752a025a0de2996752c5f491b0dd8/variant.4.vcf.bgz, work/4f/2752a025a0de2996752c5f491b0dd8/variant.5.vcf.bgz, work/4f/2752a025a0de2996752c5f4executor >  local (3)

[4f/2752a0] process > split_vcf_bgz [ 33%] 1 of 3
Split gvcf to 10 files:
[work/aa/e8e13f0387161942436173e2bc6415/gvcf.0.vcf.bgz, work/aa/e8e13f0387161942436173e2bc6415/gvcf.1.vcf.bgz, work/aa/e8e13f0387161942436173e2bc6415/gvcf.2.vcf.bgz, work/aa/e8e13f0387161942436173e2bc6415/gvcf.3.vcf.bgz, work/aa/e8e13f0387161942436173e2bc6415/gvcf.4.vcf.bgz, work/aa/e8e13f0387161942436173e2bc6415/gvcf.5.vcf.bgz, work/aa/e8e13f0387161942436173e2bc6415/gvcf.6.vcfexecutor >  local (3)

[aa/e8e13f] process > split_vcf_bgz [ 67%] 2 of 3
Split genotype to 10 files:
[work/eb/ac57d0eed04673f8934967b4498d07/genotype.0.vcf.bgz, work/eb/ac57d0eed04673f8934967b4498d07/genotype.1.vcf.bgz, work/eb/ac57d0eed04673f8934967b4498d07/genotype.2.vcf.bgz, work/eb/ac57d0eed04673f8934967b4498d07/genotype.3.vcf.bgz, work/eb/ac57d0eed04673f8934967b4498d07/genotype.4.vcf.bgz, work/eb/ac57d0eed04673f8934967b4498d07/genotype.5.vcf.bgz, work/eb/ac57d0eed04673f89executor >  local (3)

[eb/ac57d0] process > split_vcf_bgz [100%] 3 of 3 ✔

Duration    : 3.6s
CPU hours   : (a few seconds)
Succeeded   : 3
```
