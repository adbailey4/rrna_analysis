psweep:
	aws s3 cp k8_configs/old_configs/probability_sweep/train_test.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/old_configs/probability_sweep/train_test.yml | kubectl create -f -

hfhd:
	aws s3 cp k8_configs/old_configs/high_freq_high_delta/high_freq_high_delta.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/old_configs/high_freq_high_delta/high_freq_high_delta.yml | kubectl create -f -

allkmers:
	aws s3 cp k8_configs/old_configs/all_kmers/all_kmers.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/old_configs/all_kmers/all_kmers.yml | kubectl create -f -

gdt:
	aws s3 cp k8_configs/old_configs/gaussian_distribution_testing/gaussian_distribution_testing.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/old_configs/gaussian_distribution_testing/gaussian_distribution_testing.yml | kubectl create -f -

ockt:
	aws s3 cp k8_configs/only_covered_kmers_training/only_covered_kmers_training.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/only_covered_kmers_training/only_covered_kmers_training.yml | kubectl create -f -

iant:
	aws s3 cp k8_configs/ivt_and_native_training/ivt_and_native_training.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/ivt_and_native_training/ivt_and_native_training.yml | kubectl create -f -

testing:
	aws s3 cp k8_configs/testing/testing.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/testing/testing.yml | kubectl create -f -

unsup:
	aws s3 cp k8_configs/unsupervised/unsupervised.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/unsupervised/unsupervised.yml | kubectl create -f -

altc:
	aws s3 cp k8_configs/alt_canonical/alt_canonical.sh s3://bailey-k8s/rrna_yeast_data/scripts/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/alt_canonical/alt_canonical.yml | kubectl create -f -

inference:
	aws s3 cp k8_configs/inference/inference.sh s3://bailey-k8s/rrna_yeast_data/scripts/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/inference/inference.yml | kubectl create -f -

control:
	aws s3 cp k8_configs/control/control.sh s3://bailey-k8s/rrna_yeast_data/scripts/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/control/control.yml | kubectl create -f -

hdp:
	aws s3 cp k8_configs/train_hdp/train_hdp.sh s3://bailey-k8s/rrna_yeast_data/scripts/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/train_hdp/train_hdp.yml | kubectl create -f -

small_model:
	aws s3 cp k8_configs/small_model/small_model.sh s3://bailey-k8s/rrna_yeast_data/scripts/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/small_model/small_model.yml | kubectl create -f -

small_6mer:
	aws s3 cp k8_configs/small_model_6mer/small_model_6mer.sh s3://bailey-k8s/rrna_yeast_data/scripts/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/small_model_6mer/small_model_6mer.yml | kubectl create -f -

