#!/usr/bin/env nextflow

/*
 * The authors of this file license it to you under the
 * Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You
 * may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

params.dir = "${baseDir}/example"

fastqFiles = "${params.dir}/**_{1,2}.fq.gz"
fastqs = Channel.fromFilePairs(fastqFiles, size: 2)

process interleave_fastq_gz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.3--hdfd78af_0"

  input:
    set sample, file(fastq) from fastqs
  output:
    set sample, file("*.ifq.gz") into interleavedFastqs

  """
  dsh-bio interleave-fastq -1 ${fastq[0]} -2 ${fastq[1]} -p ${sample}.ifq.gz -u ${sample}.unpaired.fq.gz
  """
}

interleavedFastqs.subscribe {
  println "Created interleaved FASTQ file ${it[1]}"
}
