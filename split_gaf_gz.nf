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

gafFiles = "${params.dir}/**.gaf.gz"
gafs = Channel.fromPath(gafFiles).map { path -> tuple(path.simpleName, path) }

process split_gaf_gz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.3--hdfd78af_0"

  input:
    set sample, file(gaf) from gafs
  output:
    set sample, file("*.gaf.gz") into splitGafs

  """
  dsh-bio split-gaf -r 100 -p "${sample}." -s ".gaf.gz" -i $gaf
  """
}

splitGafs.subscribe {
  println "Split ${it.get(0)} to ${it.get(1).size()} files:"
  println "${it.get(1).toString()}"
}
