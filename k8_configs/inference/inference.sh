#!/bin/bash
# A:n C:o G:p T:q
MODELS_BUCKET="bailey-k8s/rrna_experiments/models/inference_models/"
model="round30_alt_canonical_supervised_500_500.model"
OUTPUT_BUCKET_TMP="bailey-k8s/rrna_experiments/inference/round30_alt_canonical_supervised_500_500_with_depletions/"
#ALPHABET="ACGTabcdefghijklm"
#ALPHABET="\"ACGTabcdefghijklmnopq\""

N_TEST_READS=5000

THRESHOLD="0.01"
P_THRESHOLD="0.5"
AMBIG_MODEL="\"/data/reference/alt_canonical_distribution/alt_canonical_mod_variants.model\""
AMBIG_MODEL2="/data/reference/alt_canonical_distribution/alt_canonical_mod_variants.model"

N_IVT_READS=$N_TEST_READS
N_CBF5_GAL_READS=$N_TEST_READS
N_CBF5_GLU_READS=$N_TEST_READS
N_NOP58_GLU_READS=$N_TEST_READS
N_NOP58_GAL_READS=$N_TEST_READS

OUTPUT_BUCKET="${OUTPUT_BUCKET_TMP}${model}/"

main() {
  start=$SECONDS
  download_files
  run_calling "$1"
  duration=$(( SECONDS - start ))
  hours=$(( duration / 3600 ))
  minutes=$(( (duration - (hours*3600) ) / 60 ))
  seconds=$(( ((duration - (hours*3600)) - (minutes*60) ) ))
  echo "Running Time: " $hours " hours " $minutes " minutes " $seconds " seconds "
}

download_files() {
  cwd=$(pwd)
  echo "$cwd"
  echo "Download REFERENCE"
  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/reference/ reference

  echo "Download NOP58_GAL"
  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/NOP58_GAL/ NOP58_GAL
  tar -xzf NOP58_GAL/Nop58_GAL_25S_full_length_fast5.tar.gz -C NOP58_GAL && rm NOP58_GAL/Nop58_GAL_25S_full_length_fast5.tar.gz
  tar -xzf NOP58_GAL/Nop58_GAL_18S_full_length_fast5.tar.gz -C NOP58_GAL && rm NOP58_GAL/Nop58_GAL_18S_full_length_fast5.tar.gz
  sed -i 's='/data/'='$cwd/'=g' $cwd/NOP58_GAL/kube_NOP58GAL.2308.full_length.18S.readdb
  sed -i 's='/data/'='$cwd/'=g' $cwd/NOP58_GAL/kube_NOP58GAL.2308.full_length.25S.readdb
  head -"$N_NOP58_GAL_READS"  "$cwd"/NOP58_GAL/kube_NOP58GAL.2308.full_length.18S.readdb > "$cwd"/NOP58_GAL/run_ngal.readdb
  head -"$N_NOP58_GAL_READS"  "$cwd"/NOP58_GAL/kube_NOP58GAL.2308.full_length.25S.readdb >> "$cwd"/NOP58_GAL/run_ngal.readdb
  echo "NOP58_GAL Done"

  echo "Download IVT"
  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/IVT/ IVT
  tar -xzf IVT/ivt_25S_full_length.tar.gz -C IVT && rm IVT/ivt_25S_full_length.tar.gz
  tar -xzf IVT/ivt_18S_full_length.tar.gz -C IVT && rm IVT/ivt_18S_full_length.tar.gz
  sed -i 's='/data/'='"$cwd"/'=g' "$cwd"/IVT/kube_ivt_full_length_18S.readdb
  sed -i 's='/data/'='"$cwd"/'=g' "$cwd"/IVT/kube_ivt_full_length_25S.readdb
  head -"$N_IVT_READS"  "$cwd"/IVT/kube_ivt_full_length_18S.readdb > "$cwd"/IVT/run_ivt.readdb
  head -"$N_IVT_READS"  "$cwd"/IVT/kube_ivt_full_length_25S.readdb >> "$cwd"/IVT/run_ivt.readdb
  echo "ivt Done"

  echo "Download CBF5_GAL"
  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/CBF5_GAL/ CBF5_GAL
  tar -xzf CBF5_GAL/CBF5_GAL_25S_full_length.tar.gz -C CBF5_GAL && rm CBF5_GAL/CBF5_GAL_25S_full_length.tar.gz
  tar -xzf CBF5_GAL/CBF5_GAL_18S_full_length.tar.gz -C CBF5_GAL && rm CBF5_GAL/CBF5_GAL_18S_full_length.tar.gz
  sed -i 's='/data/'='"$cwd"/'=g' "$cwd"/CBF5_GAL/kube_CBF5GAL_full_length.18S.readdb
  sed -i 's='/data/'='"$cwd"/'=g' "$cwd"/CBF5_GAL/kube_CBF5GAL_full_length.25S.readdb
  head -"$N_CBF5_GAL_READS"  "$cwd"/CBF5_GAL/kube_CBF5GAL_full_length.18S.readdb > "$cwd"/CBF5_GAL/run_cgal.readdb
  head -"$N_CBF5_GAL_READS"  "$cwd"/CBF5_GAL/kube_CBF5GAL_full_length.25S.readdb >> "$cwd"/CBF5_GAL/run_cgal.readdb
  echo "CBF5_GAL Done"

  echo "Download NOP58_GLU"
  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/NOP58_GLU/ NOP58_GLU
  tar -xzf NOP58_GLU/Nop58_GLU_25S_full_length.tar.gz -C NOP58_GLU && rm NOP58_GLU/Nop58_GLU_25S_full_length.tar.gz
  tar -xzf NOP58_GLU/Nop58_GLU_18S_full_length.tar.gz -C NOP58_GLU && rm NOP58_GLU/Nop58_GLU_18S_full_length.tar.gz
  sed -i 's='/data/Nop58_GLU/'='"$cwd"/NOP58_GLU/'=g' "$cwd"/NOP58_GLU/kube_Nop58GLU_full_length.18S.readdb
  sed -i 's='/data/Nop58_GLU/'='"$cwd"/NOP58_GLU/'=g' "$cwd"/NOP58_GLU/kube_Nop58GLU_full_length.25S.readdb
  head -"$N_NOP58_GLU_READS"  "$cwd"/NOP58_GLU/kube_Nop58GLU_full_length.18S.readdb > "$cwd"/NOP58_GLU/run_nglu.readdb
  head -"$N_NOP58_GLU_READS"  "$cwd"/NOP58_GLU/kube_Nop58GLU_full_length.25S.readdb >> "$cwd"/NOP58_GLU/run_nglu.readdb
  echo "NOP58_GLU Done"

  echo "Download CBF5_GLU"
  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/CBF5_GLU/ CBF5_GLU
  tar -xzf CBF5_GLU/CBF5_GLU_25S_full_length.tar.gz -C CBF5_GLU && rm CBF5_GLU/CBF5_GLU_25S_full_length.tar.gz
  tar -xzf CBF5_GLU/CBF5_GLU_18S_full_length.tar.gz -C CBF5_GLU && rm CBF5_GLU/CBF5_GLU_18S_full_length.tar.gz
  sed -i 's='/data/'='$cwd/'=g' "$cwd"/CBF5_GLU/kube_CBF5GLU_full_length.18S.readdb
  sed -i 's='/data/'='$cwd/'=g' "$cwd"/CBF5_GLU/kube_CBF5GLU_full_length.25S.readdb
  head -"$N_CBF5_GLU_READS"  "$cwd"/CBF5_GLU/kube_CBF5GLU_full_length.18S.readdb  > "$cwd"/CBF5_GLU/run_cglu.readdb
  head -"$N_CBF5_GLU_READS"  "$cwd"/CBF5_GLU/kube_CBF5GLU_full_length.25S.readdb  >> "$cwd"/CBF5_GLU/run_cglu.readdb
  echo "CBF5_GLU Done"

}

run_calling() {

  mkdir models
  mkdir output
  aws s3 cp --no-progress s3://"$MODELS_BUCKET""$model" models

  run_signal_align "$model" "$1"
  #               tar and upload variant calls
  aws s3 cp --no-progress inference.sh s3://"$OUTPUT_BUCKET"
  tar -czf "$model".variant_calls.tar.gz -C output/ variant_calls/
  aws s3 mv --no-progress "$model".variant_calls.tar.gz s3://"$OUTPUT_BUCKET"

}


run_signal_align() {
#             create output directory
# $1 model name
# $2 n_threads
N_THREADS=${2:-1}
echo "N_THREADS: " "$N_THREADS"

cwd=$(pwd)
MODEL_PATH="\"$cwd/models/$1\""
rm run_config.json
echo "$cwd"

cat << EOF >> run_config.json
{
  "signal_alignment_args": {
    "target_regions": null,
    "track_memory_usage": false,
    "threshold": $THRESHOLD,
    "event_table": null,
    "embed": false,
    "delete_tmp": true,
    "output_format": "full"
  },
  "samples": [
    {
      "positions_file": "/data/reference/alt_canonical_distribution/yeast_18S_25S_variants.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/IVT/run_ivt.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "canonical_ivt",
      "probability_threshold": $P_THRESHOLD,
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/IVT/ivt_20191014_control.2308.full_length.sorted.bam",
      "recursive": false,
      "assignments_dir": null
    },
    {
      "positions_file": "/data/reference/alt_canonical_distribution/yeast_18S_25S_variants.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/NOP58_GAL/run_ngal.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "native_nop58_gal",
      "probability_threshold": $P_THRESHOLD,
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/NOP58_GAL/06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.sorted.bam",
      "recursive": false,
      "assignments_dir": null
    },
    {
      "positions_file": "/data/reference/alt_canonical_distribution/yeast_18S_25S_variants.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/CBF5_GAL/run_cgal.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "native_cbf5_gal",
      "probability_threshold": $P_THRESHOLD,
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/CBF5_GAL/06102019_R941_CBF5GAL_noU.2308.full_length.sorted.bam",
      "recursive": false,
      "assignments_dir": null
    },
    {
      "positions_file": "/data/reference/alt_canonical_distribution/yeast_18S_25S_variants.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/NOP58_GLU/run_nglu.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "depletion_nop58_glu",
      "probability_threshold": $P_THRESHOLD,
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/NOP58_GLU/06_19_19_R941_NOP58GLU_Manny_noU.2308.full_length.sorted.bam",
      "recursive": false,
      "assignments_dir": null
    },
    {
      "positions_file": "/data/reference/alt_canonical_distribution/yeast_18S_25S_variants.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/CBF5_GLU/run_cglu.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "depletion_cbf5_glu",
      "probability_threshold": $P_THRESHOLD,
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/CBF5_GLU/06112019_R941_CBF5GLU_noU.2308.full_length.sorted.bam",
      "recursive": false,
      "assignments_dir": null
    }
  ],
  "hdp_args": {
    "grid_start": 30.0,
    "grid_end": 180.0,
    "grid_length": 1200,

    "base_alpha": 1.0,
    "base_beta": 1.0,
    "base_gamma": 1.0,

    "middle_alpha": 1.0,
    "middle_beta": 1.0,
    "middle_gamma": 1.0,

    "leaf_alpha": 1.0,
    "leaf_beta": 1.0,
    "leaf_gamma": 1.0,

    "thinning": 1000,
    "gibbs_samples": 10000,
    "burnin_multiplier": 32,
    "hdp_type": "singleLevelAll16SrRNA"
  },
  "transitions_args": {
    "training_bases": 30000,
    "iterations": 2,
    "test": false
  },
  "training": {
    "transitions": false,
    "normal_emissions": true,
    "hdp_emissions": false,
    "expectation_maximization": true,
    "em_iterations": 2
  },
  "path_to_bin": "/root/signalAlign/bin",
  "complement_hdp_model": null,
  "template_hdp_model": null,
  "complement_hmm_model": null,
  "template_hmm_model": $MODEL_PATH,
  "job_count": $N_THREADS,
  "debug": false,
  "two_d": false,
  "output_dir": "/data/output",
  "constraint_trim": null,
  "diagonal_expansion": null,
  "traceBackDiagonals": 150,
  "filter_reads": 0,
  "perform_kmer_event_alignment": true,
  "overwrite": true,
  "rna": true,
  "ambig_model": $AMBIG_MODEL,
  "built_alignments": null,
  "delete_alignments": false
}
EOF
#               run signalAlign and variant caller
echo "Running SignalAlign"
runSignalAlign.py run --config run_config.json
mkdir output/variant_calls
echo "Running sa2bed"
embed_main sa2bed -d output/tempFiles_alignment/native_nop58_gal/ -a "$AMBIG_MODEL2" -o output/variant_calls/native_nop58_gal_"$1".bed -t "$2" -c BDEFHIJKLMOPQR --overwrite --rna
embed_main sa2bed -d output/tempFiles_alignment/native_cbf5_gal/ -a "$AMBIG_MODEL2" -o output/variant_calls/native_cbf5_gal_"$1".bed -t "$2" -c BDEFHIJKLMOPQR --overwrite --rna
embed_main sa2bed -d output/tempFiles_alignment/canonical_ivt/ -a "$AMBIG_MODEL2" -o output/variant_calls/canonical_ivt_"$1".bed -t "$2" -c BDEFHIJKLMOPQR --overwrite --rna
embed_main sa2bed -d output/tempFiles_alignment/depletion_nop58_glu/ -a "$AMBIG_MODEL2" -o output/variant_calls/depletion_nop58_glu_"$1".bed -t "$2" -c BDEFHIJKLMOPQR --overwrite --rna
embed_main sa2bed -d output/tempFiles_alignment/depletion_cbf5_glu/ -a "$AMBIG_MODEL2" -o output/variant_calls/depletion_cbf5_glu_"$1".bed -t "$2" -c BDEFHIJKLMOPQR --overwrite --rna
rm config.json
}

main "$1"
