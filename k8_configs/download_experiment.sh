set -x
experiment="ivt_and_native_training"
EXPERIMENT_BUCKET="bailey-k8s/rrna_experiments/supervised/$experiment/"
output_dir="/Users/andrewbailey/CLionProjects/rrna_analysis/notebooks/rrna_data/rrna_kube_testing/supervised/$experiment/"
#
mkdir $output_dir
for bucket in $(aws s3 ls s3://"$EXPERIMENT_BUCKET")
do
  if [[ "$bucket" == */ ]]
  then
    mkdir "$output_dir""$bucket"
    aws s3 cp s3://"$EXPERIMENT_BUCKET""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy_csvs.tar.gz "$output_dir""$bucket" && tar -xzf "$output_dir""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy_csvs.tar.gz -C "$output_dir""$bucket"
    aws s3 cp s3://"$EXPERIMENT_BUCKET""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy_csvs.tar.gz "$output_dir""$bucket" && tar -xzf "$output_dir""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy_csvs.tar.gz -C "$output_dir""$bucket"
    aws s3 cp s3://"$EXPERIMENT_BUCKET""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz "$output_dir""$bucket" && tar -xzf "$output_dir""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_distributions.tar.gz -C "$output_dir""$bucket"
    aws s3 cp s3://"$EXPERIMENT_BUCKET""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_models.tar.gz "$output_dir""$bucket" && tar -xzf "$output_dir""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_models.tar.gz -C "$output_dir""$bucket"
#    aws s3 cp s3://"$EXPERIMENT_BUCKET""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy.tar.gz "$output_dir""$bucket" && tar -xzf "$output_dir""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.testing_accuracy.tar.gz -C "$output_dir""$bucket"
#    aws s3 cp s3://"$EXPERIMENT_BUCKET""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy.tar.gz "$output_dir""$bucket" && tar -xzf "$output_dir""$bucket"rna_r94_5mer_ACGTabcdefghijklm.model.training_accuracy.tar.gz -C "$output_dir""$bucket"
  fi
done
# file list as an array



