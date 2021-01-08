set -x

main() {
  start=$SECONDS
#  download_experiment
  run="testing/train_2_test_2_prob_0.5_em_iterations_1_gaussian_true_FREQ_THRESHOLD_60_USE_IVT_TRAINING_true_unsupervised_true_all_kmers_true"
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
  general_experiment="alt_canonical"
  experiment="gaussian"
  experiment_bucket="bailey-k8s/rrna_experiments/$general_experiment/$experiment/"
  output_dir="/Users/andrewbailey/CLionProjects/rrna_analysis/notebooks/rrna_data/rrna_kube_testing/$general_experiment/$experiment/"
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
  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklmnopq.model.testing_accuracy_csvs.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklmnopq.model.testing_accuracy_csvs.tar.gz -C "$output_run_dir"
  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklmnopq.model.training_accuracy_csvs.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklmnopq.model.training_accuracy_csvs.tar.gz -C "$output_run_dir"
#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz -C "$output_run_dir"
  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklmnopq.model.training_models.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklmnopq.model.training_models.tar.gz -C "$output_run_dir"

#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy_csvs.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy_csvs.tar.gz -C "$output_run_dir"
#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy_csvs.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy_csvs.tar.gz -C "$output_run_dir"
##  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz -C "$output_run_dir"
#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_models.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_models.tar.gz -C "$output_run_dir"
#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy.tar.gz -C "$output_run_dir"
#  aws s3 cp s3://"$run_bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy.tar.gz "$output_run_dir" && tar -xzf "$output_run_dir"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy.tar.gz -C "$output_run_dir"
}

main