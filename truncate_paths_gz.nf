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

gfaFiles = "${params.dir}/**.gfa.gz"
gfas = Channel.fromPath(gfaFiles).map { path -> tuple(path.simpleName, path) }

process truncate_paths_gz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.0.8--hdfd78af_0"

  input:
    set sample, file(gfa) from gfas
  output:
    set sample, file("${sample}.truncated.gfa.gz") into truncatedGfas

  """
  dsh-bio truncate-paths -i ${gfa} -o "${sample}.truncated.gfa.gz"
  """
}

truncatedGfas.subscribe {
  println "Truncate paths in GFA 1.0 records into file ${it[1]}"
}
