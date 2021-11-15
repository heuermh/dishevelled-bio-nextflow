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

fastqFiles = "${params.dir}/**.ifq.bgz"
fastqs = Channel.fromPath(fastqFiles).map { path -> tuple(path.simpleName, path) }

process split_interleaved_fastq_bgz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.0.6--hdfd78af_0"

  input:
    set sample, file(fastq) from fastqs
  output:
    set sample, file("*.ifq.bgz") into splitFastqs

  """
  dsh-bio split-interleaved-fastq -r 100 -p "${sample}." -s ".ifq.bgz" -i $fastq
  """
}

splitFastqs.subscribe {
  println "Split ${it.get(0)} to ${it.get(1).size()} files:"
  println "${it.get(1).toString()}"
}
