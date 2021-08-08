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

fastaFiles = "${params.dir}/**.fa.gz"
fastas = Channel.fromPath(fastaFiles).map { path -> tuple(path.simpleName, path) }

process create_sequence_dictionary_gz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.0.5--hdfd78af_0"

  input:
    set sample, file(fasta) from fastas
  output:
    set sample, file("*.fa.dict") into sequenceDictionaries

  """
  dsh-bio create-sequence-dictionary -i $fasta -o ${sample}.fa.dict
  """
}

sequenceDictionaries.subscribe {
  println "Created sequence dictionary ${it.get(1).toString()}"
}
