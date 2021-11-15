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

import org.dishevelled.bio.tools.CreateSequenceDictionary

params.dir = "${baseDir}/example"

fastaFiles = "${params.dir}/**.fa.gz"
fastas = Channel.fromPath(fastaFiles).map { path -> tuple(path.simpleName, path) }

process nf_create_sequence_dictionary_gz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.0.6--hdfd78af_0"

  input:
    tuple val(sample), val(fasta) from fastas
  output:
    tuple val(sample), file("*.fa.dict") into sequenceDictionaries

  exec:
  new CreateSequenceDictionary(task.workDir.resolve(fasta).toFile(), task.workDir.resolve("${sample}.fa.dict").toFile()).call()
}

sequenceDictionaries.subscribe {
  println "Created sequence dictionary ${it.get(1).toString()}"
}
