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

pafFiles = "${params.dir}/**.paf.bgz"
pafs = Channel.fromPath(pafFiles).map { path -> tuple(path.simpleName, path) }

process split_paf_bgz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.0.4--hdfd78af_0"

  input:
    set sample, file(paf) from pafs
  output:
    set sample, file("*.paf.bgz") into splitPafs

  """
  dsh-bio split-paf -r 100 -p "${sample}." -s ".paf.bgz" -i $paf
  """
}

splitPafs.subscribe {
  println "Split ${it.get(0)} to ${it.get(1).size()} files:"
  println "${it.get(1).toString()}"
}
