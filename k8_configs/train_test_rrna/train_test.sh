#!/bin/bash
# $1 model bucket
# $2 job_count
# $3 output bucket

main() {
  # $1 model bucket
  # $2 output bucket
  # $3 job_count
  # $4 embed
  # $5 threshold
  # $6 p_threshold
  # $7 n_files
  start=$SECONDS
  download_files 5
  run_training_routine "$1" "$2" "$3" "$4" "$5" "$6"
  duration=$(( SECONDS - start ))
  hours=$(( duration / 3600 ))
  minutes=$(( (duration - (hours*3600) ) / 60 ))
  seconds=$(( ((duration - (hours*3600)) - (minutes*60) ) ))
  echo "Running Time: " $hours " hours " $minutes " minutes " $seconds " seconds "
}

download_files() {
  cwd=$(pwd)
  echo "$cwd"

  echo "Download IVT"
  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/IVT/ IVT
  tar -xzf IVT/ivt_25S_full_length.tar.gz -C IVT && rm IVT/ivt_25S_full_length.tar.gz
  tar -xzf IVT/ivt_18S_full_length.tar.gz -C IVT && rm IVT/ivt_18S_full_length.tar.gz
  sed -i 's='/data/'='$cwd/'=g' "$cwd"/IVT/kube_ivt_full_length_18S.readdb
  sed -i 's='/data/'='$cwd/'=g' "$cwd"/IVT/kube_ivt_full_length_25S.readdb
  head -"$1"  "$cwd"/IVT/kube_ivt_full_length_18S.readdb > "$cwd"/IVT/run_ivt.readdb
  head -"$1"  "$cwd"/IVT/kube_ivt_full_length_25S.readdb > "$cwd"/IVT/run_ivt.readdb
  echo "ivt Done"

  echo "Download NOP58_GAL"
  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/NOP58_GAL/ NOP58_GAL
  tar -xzf NOP58_GAL/Nop58_GAL_25S_full_length_fast5.tar.gz -C NOP58_GAL && rm NOP58_GAL/Nop58_GAL_25S_full_length_fast5.tar.gz
  tar -xzf NOP58_GAL/Nop58_GAL_18S_full_length_fast5.tar.gz -C NOP58_GAL && rm NOP58_GAL/Nop58_GAL_18S_full_length_fast5.tar.gz
  sed -i 's='/data/'='$cwd/'=g' "$cwd"/NOP58_GAL/kube_NOP58GAL.2308.full_length.18S.readdb
  sed -i 's='/data/'='$cwd/'=g' "$cwd"/NOP58_GAL/kube_NOP58GAL.2308.full_length.25S.readdb
  head -"$1"  "$cwd"/NOP58_GAL/kube_NOP58GAL.2308.full_length.18S.readdb > "$cwd"/NOP58_GAL/run_ngal.readdb
  head -"$1"  "$cwd"/NOP58_GAL/kube_NOP58GAL.2308.full_length.25S.readdb > "$cwd"/NOP58_GAL/run_ngal.readdb
  echo "NOP58_GAL Done"

#  echo "Download NOP58_GLU"
#  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/NOP58_GLU/ NOP58_GLU
#  tar -xzf NOP58_GLU/Nop58_GLU_25S_full_length.tar.gz -C NOP58_GLU && rm NOP58_GLU/Nop58_GLU_25S_full_length.tar.gz
#  tar -xzf NOP58_GLU/Nop58_GLU_18S_full_length.tar.gz -C NOP58_GLU && rm NOP58_GLU/Nop58_GLU_18S_full_length.tar.gz
#  sed -i 's='/data/'='$cwd/'=g' "$cwd"/NOP58_GLU/kube_Nop58GLU_full_length.18S.readdb
#  sed -i 's='/data/'='$cwd/'=g' "$cwd"/NOP58_GLU/kube_Nop58GLU_full_length.25S.readdb
#  head -"$1"  "$cwd"/NOP58_GLU/kube_Nop58GLU_full_length.18S.readdb > "$cwd"/NOP58_GLU/run_nglu.readdb
#  head -"$1"  "$cwd"/NOP58_GLU/kube_Nop58GLU_full_length.25S.readdb > "$cwd"/NOP58_GLU/run_nglu.readdb
#  echo "NOP58_GLU Done"
#
#  echo "Download CBF5_GAL"
#  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/CBF5_GAL/ CBF5_GAL
#  tar -xzf CBF5_GAL/CBF5_GAL_25S_full_length.tar.gz -C CBF5_GAL && rm CBF5_GAL/CBF5_GAL_25S_full_length.tar.gz
#  tar -xzf CBF5_GAL/CBF5_GAL_18S_full_length.tar.gz -C CBF5_GAL && rm CBF5_GAL/CBF5_GAL_18S_full_length.tar.gz
#  sed -i 's='/data/'='$cwd/'=g' "$cwd"/CBF5_GAL/kube_CBF5GAL_full_length.18S.readdb
#  sed -i 's='/data/'='$cwd/'=g' "$cwd"/CBF5_GAL/kube_CBF5GAL_full_length.25S.readdb
#  head -"$1"  "$cwd"/CBF5_GAL/kube_CBF5GAL_full_length.18S.readdb > "$cwd"/CBF5_GAL/run_cgal.readdb
#  head -"$1"  "$cwd"/CBF5_GAL/kube_CBF5GAL_full_length.25S.readdb > "$cwd"/CBF5_GAL/run_cgal.readdb
#  echo "CBF5_GAL Done"
#
#  echo "Download CBF5_GLU"
#  aws s3 sync --no-progress s3://bailey-k8s/rrna_yeast_data/CBF5_GLU/ CBF5_GLU
#  tar -xzf CBF5_GLU/CBF5_GLU_25S_full_length.tar.gz -C CBF5_GLU && rm CBF5_GLU/CBF5_GLU_25S_full_length.tar.gz
#  tar -xzf CBF5_GLU/CBF5_GLU_18S_full_length.tar.gz -C CBF5_GLU && rm CBF5_GLU/CBF5_GLU_18S_full_length.tar.gz
#  sed -i 's='/data/'='$cwd/'=g' "$cwd"/CBF5_GLU/kube_CBF5GLU_full_length.18S.readdb
#  sed -i 's='/data/'='$cwd/'=g' "$cwd"/CBF5_GLU/kube_CBF5GLU_full_length.25S.readdb
#  head -"$1"  "$cwd"/CBF5_GLU/kube_CBF5GLU_full_length.18S.readdb  > "$cwd"/CBF5_GLU/run_cglu.readdb
#  head -"$1"  "$cwd"/CBF5_GLU/kube_CBF5GLU_full_length.25S.readdb  > "$cwd"/CBF5_GLU/run_cglu.readdb
#  echo "CBF5_GLU Done"

}

run_training_routine() {
  # $1 model bucket
  # $2 output bucket
  # $3 job_count
  # $4 embed
  # $5 threshold
  # $6 p_threshold

  mkdir models
  mkdir output
  for model in $(aws s3 ls s3://"$1")
  do
    if [[ "$model" == *.model ]]
    then
      aws s3 cp --no-progress s3://"$1""$model" models
      train_sa "$model" "$3" "$4" "$5" "$6"
      #               tar and upload variant calls

      tar -czf "$model".testing.tar.gz -C output/ testing/
      aws s3 mv --no-progress "$model".testing.tar.gz s3://"$2"

      tar -czf "$model".testing_accuracy.tar.gz -C output/ testing_accuracy/
      aws s3 mv --no-progress "$model".testing_accuracy.tar.gz s3://"$2"

      tar -czf "$model".testing_accuracy_csvs.tar.gz -C output/ testing_accuracy_csvs/
      aws s3 mv --no-progress "$model".testing_accuracy_csvs.tar.gz s3://"$2"

      tar -czf "$model".training.tar.gz -C output/ training/
      aws s3 mv --no-progress "$model".training.tar.gz s3://"$2"

      tar -czf "$model".training_distributions.tar.gz -C output/ training_distributions/
      aws s3 mv --no-progress "$model".training_distributions.tar.gz s3://"$2"

      tar -czf "$model".training_models.tar.gz -C output/ training_models/
      aws s3 mv --no-progress "$model".training_models.tar.gz s3://"$2"

      rm -r output/*
    fi
  done
  #               tar and upload fast5s
}


train_sa() {
#             create output directory
# $1 model name
# $2 job_count
# $3 embed
# $4 threshold
# $5 p_threshold


cwd=$(pwd)
MODEL_PATH="\"$cwd/models/$1\""
AMBIG_MODEL="\"/data/reference/mod_variants.model\""
rm train_test_config.json
rm train_config.json
rm run_config.json
rm run_embed_plot_wrapper.json
echo "$cwd"

cat << EOF >> run_embed_plot_wrapper.json
{
  "save_fig_dir": null,
  "positions": "/data/reference/yeast_18S_25S_mods.positions",
  "ambig_model": $AMBIG_MODEL,
  "rna": true,
  "num_threads": ${2:-1},
  "debug": false,
  "mod_only": true,
  "force_event": false,
  "force_pos_hist": false,
  "reference": "/data/reference/yeast_25S_18S.fa",
  "alphabet": "ACGTabcdefghijklm",
  "min_prob": ${5:-0.7},
  "iterations": []
}
EOF

cat << EOF >> train_config.json
{
  "signal_alignment_args": {
    "target_regions": null,
    "track_memory_usage": false,
    "threshold": ${4:-0.01},
    "event_table": null,
    "embed": false,
    "delete_tmp": true,
    "output_format": "full"
  },
  "samples": [
    {
      "positions_file": "/data/reference/native_yeast_18S_25S_mods_guess.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/NOP58_GAL/run_ngal.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "native_nop58_gal",
      "probability_threshold": ${5:-0.7},
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/NOP58_GAL/06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.25S.sorted.bam",
      "recursive": false,
      "assignments_dir": null
    },
    {
      "positions_file": "/data/reference/ivt_yeast_18S_25S_mods.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/IVT/run_ivt.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "canonical_ivt",
      "probability_threshold": ${5:-0.7},
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/IVT/ivt_20191014_control.2308.full_length.25S.sorted.bam",
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
  "job_count": ${2:-1},
  "debug": false,
  "two_d": false,
  "output_dir": "/data/output/training",
  "constraint_trim": null,
  "diagonal_expansion": null,
  "traceBackDiagonals": 150,
  "filter_reads": 0,
  "perform_kmer_event_alignment": true,
  "overwrite": true,
  "rna": true,
  "ambig_model": $AMBIG_MODEL,
  "built_alignments": null,
  "mod_only": true,
  "delete_alignments": false
}
EOF

cat << EOF >> run_config.json
{
  "signal_alignment_args": {
    "target_regions": null,
    "track_memory_usage": false,
    "threshold": 0.01,
    "event_table": null,
    "embed": false,
    "delete_tmp": true,
    "output_format": "full"
  },
  "samples": [
    {
      "positions_file": "/data/reference/yeast_18S_25S_mods.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/NOP58_GAL/run_ngal.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "native_nop58_gal",
      "probability_threshold": ${5:-0.7},
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/NOP58_GAL/06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.25S.sorted.bam",
      "recursive": false,
      "assignments_dir": null
    },
    {
      "positions_file": "/data/reference/yeast_18S_25S_mods.positions",
      "fast5_dirs": ["/data/"],
      "bwa_reference": "/data/reference/yeast_25S_18S.fa",
      "fofns": [],
      "readdb": "/data/IVT/run_ivt.readdb",
      "fw_reference": null,
      "bw_reference": null,
      "kmers_from_reference": false,
      "motifs": null,
      "name": "canonical_ivt",
      "probability_threshold": ${5:-0.7},
      "number_of_kmer_assignments": 10000,
      "alignment_file": "/data/IVT/ivt_20191014_control.2308.full_length.25S.sorted.bam",
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
  "job_count": ${2:-1},
  "debug": false,
  "two_d": false,
  "output_dir": "/data/output/training",
  "constraint_trim": null,
  "diagonal_expansion": null,
  "traceBackDiagonals": 150,
  "filter_reads": 0,
  "perform_kmer_event_alignment": true,
  "overwrite": true,
  "rna": true,
  "ambig_model": $AMBIG_MODEL,
  "built_alignments": null,
  "mod_only": true,
  "delete_alignments": false
}
EOF

cat << EOF >> train_test_config.json
{
  "base_directory": "/data/output/",
  "train_model": "/data/train_config.json",
  "test_model": {
    "base_model": "/data/run_config.json",
    "variants": "BDEFHIJKLMOPQR",
    "rna": true
  },
  "plot_accuracies": {
    "positions_files":
    ["/data/reference/native_yeast_18S_25S_mods_guess.positions",
      "/data/reference/ivt_yeast_18S_25S_mods.positions"],
    "names": ["native_nop58_gal", "canonical_ivt"]
  },
  "plot_distributions": "/data/run_embed_plot_wrapper.json",
  "options": {
    "train": true,
    "test": true,
    "plot_accuracies": true,
    "plot_distributions": true
  }
}
EOF
#               run signalAlign and variant caller
/data/rrna_scripts/train_test_accuracy_wrapper.py --config train_test_config.json
}

main "$1" "$2" "$3" "$4" "$5"

