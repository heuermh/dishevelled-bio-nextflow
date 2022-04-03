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

process remap_dbsnp_bgz {
  tag { sample }
  container "quay.io/biocontainers/dsh-bio:2.0.8--hdfd78af_0"

  input:
    set sample, file(vcf) from vcfs
  output:
    set sample, file("${sample}.remapped.dbsnp.vcf.bgz") into remappedVcfs

  """
  dsh-bio remap-dbsnp -i $vcf -o ${sample}.remapped.dbsnp.vcf.bgz
  """
}

remappedVcfs.subscribe {
  println "Remapped ${it.get(0)} Type=String DB flags to DB Type=Flag and dbsnp Type=String fields into file ${it.get(1)}"
}
