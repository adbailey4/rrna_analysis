set -x

main() {
  start=$SECONDS
#  download_experiment
  run="supervised/ivt_and_native_training/train_500_test_500_prob_0.5_em_iterations_30_all_kmers_ivt_and_native_training"
  run_bucket="bailey-k8s/rrna_experiments/"$run"/"
  output_run_dir="/Users/andrewbailey/CLionProjects/rrna_analysis/notebooks/rrna_data/rrna_kube_testing/"$run"/"
#  download_bucket "$run_bucket" $output_run_dir
  download_experiment
  duration=$(( SECONDS - start ))
  hours=$(( duration / 3600 ))
  minutes=$(( (duration - (hours*3600) ) / 60 ))
  seconds=$(( ((duration - (hours*3600)) - (minutes*60) ) ))
  echo "Running Time: " $hours " hours " $minutes " minutes " $seconds " seconds "
}

download_experiment(){
  experiment="probability_sweep/high_freq_high_delta"
  experiment_bucket="bailey-k8s/rrna_experiments/supervised/$experiment/"
  output_dir="/Users/andrewbailey/CLionProjects/rrna_analysis/notebooks/rrna_data/rrna_kube_testing/supervised/$experiment/"
  #
  mkdir $output_dir
  for bucket in $(aws s3 ls s3://"$experiment_bucket")
  do
    if [[ "$bucket" == */ ]]
    then
        run_bucket="$experiment_bucket""$bucket"
        output_run_dir="$output_dir""$bucket"
        download_bucket "$run_bucket" "$output_run_dir"
    fi
  done
}

download_bucket() {
  run_bucket="$1"
  output_run_dir="$2"
  mkdir "$output_run_dir"
  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy_csvs.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy_csvs.tar.gz -C "$output_run_dir"
  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy_csvs.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy_csvs.tar.gz -C "$output_run_dir"
#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz -C "$output_run_dir"
  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_models.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_models.tar.gz -C "$output_run_dir"
#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy.tar.gz -C "$output_run_dir"
#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy.tar.gz -C "$output_run_dir"
}

main