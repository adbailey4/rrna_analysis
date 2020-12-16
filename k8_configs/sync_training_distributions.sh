set -x

main() {
  start=$SECONDS
#  download_experiment
  run="supervised/probability_sweep/train_500_test_500_prob_0.9_em_iterations_30"
  run_bucket="bailey-k8s/rrna_experiments/"$run"/"
  output_run_dir="/Users/andrewbailey/CLionProjects/rrna_analysis/notebooks/rrna_data/rrna_kube_testing/"$run"/"
  update_bucket "$run_bucket" $output_run_dir

  duration=$(( SECONDS - start ))
  hours=$(( duration / 3600 ))
  minutes=$(( (duration - (hours*3600) ) / 60 ))
  seconds=$(( ((duration - (hours*3600)) - (minutes*60) ) ))
  echo "Running Time: " $hours " hours " $minutes " minutes " $seconds " seconds "
}

update_experiment(){
  experiment="ivt_and_native_training"
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
        update_bucket "$run_bucket" "$output_run_dir"
    fi
  done
}

update_bucket() {
  run_bucket="$1"
  output_run_dir="$2"
  mkdir "$output_run_dir"
  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz -C "$output_run_dir"
  aws s3 sync "$output_run_dir"training_distributions s3://"$run_bucket"training_distributions
}

main