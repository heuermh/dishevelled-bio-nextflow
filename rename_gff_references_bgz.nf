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

gff3Files = "${params.dir}/**.gff3.bgz"
gff3s = Channel.fromPath(gff3Files).map { path -> tuple(path.simpleName, path) }

process remap_dbsnp_bgz {
  tag { sample }

  input:
    set sample, file(gff3) from gff3s
  output:
    set sample, file("${sample}.renamed.refs.gff3.bgz") into remappedGff3s

  """
  dsh-bio rename-gff3-references -i $gff3 -o ${sample}.renamed.refs.gff3.bgz
  """
}

remappedGff3s.subscribe {
  println "Renamed ${it.get(0)} references into file ${it.get(1)}"
}
