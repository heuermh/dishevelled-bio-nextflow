# dishevelled-bio-nextflow
dsh-bio workflow processes implemented via Nextflow. Apache 2 licensed.


## Summary

[dishevelled.org bio](https://github.com/heuermh/dishevelled-bio) provides a
set of command line tools for BED, FASTA, FASTQ, GAF, GFA1/2, GFF3, PAF, SAM, and VCF files.

Some of those command line tools are wrapped here for use in [Nextflow](https://www.nextflow.io/)
DSL1 workflows.  `dsh-bio` can be installed via [Homebrew](https://github.com/brewsci/homebrew-bio),
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

## nf-core modules

To use [dishevelled.org bio](https://github.com/heuermh/dishevelled-bio) in Nextflow DSL2, please
see [nf-core modules](https://github.com/nf-core/modules).  `dshbio_exportsegments`, `dshbio_filterbed`,
and `dshbio_splitbed` are provided as examples; other DSL2 tool definitions might easily adapted from these.


## In process execution via `exec`

For an example of calling `dsh-bio` in process via the Nextflow process `exec:` block, see [nf_create_sequence_dictionary_gz.nf](https://github.com/heuermh/dishevelled-bio-nextflow/blob/master/nf_create_sequence_dictionary_gz.nf).

To run this workflow, provide `dsh-bio` jar files via the Nextflow `-lib` command line parameter, e.g., when installed via Homebrew on OSX
```bash
$ nextflow run \
  -lib /usr/local/Cellar/dsh-bio/${version}/libexec/lib/ \
  nf_create_sequence_dictionary_gz.nf

N E X T F L O W  ~  version 21.04.1
Launching `nf_create_sequence_dictionary_gz.nf` [hopeful_colden] - revision: 314a8e292d
executor >  local (2)
[5e/35b888] process > nf_create_sequence_dictionary_gz (reference) [100%] 2 of 2 ✔
Created sequence dictionary work/8f/666388eae1c490cc0acca73efe6193/transcript.fa.dict
Created sequence dictionary work/5e/35b888f89752bf6e2d8c0424d5786e/reference.fa.dict
```
