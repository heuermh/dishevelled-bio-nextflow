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

vcfFiles = "${params.dir}/**.vcf.bgz"
vcfs = Channel.fromPath(vcfFiles).map { path -> tuple(path.simpleName, path) }

process remap_phase_set_bgz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.4--hdfd78af_0"

  input:
    set sample, file(vcf) from vcfs
  output:
    set sample, file("${sample}.remapped.ps.vcf.bgz") into remappedVcfs

  """
  dsh-bio remap-phase-set -i $vcf -o ${sample}.remapped.ps.vcf.bgz
  """
}

remappedVcfs.subscribe {
  println "Remapped ${it.get(0)} Type=String PS phase set ids in VCF format to Type=Integer into file ${it.get(1)}"
}
