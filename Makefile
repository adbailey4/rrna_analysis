psweep:
	aws s3 cp k8_configs/probability_sweep/train_test.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/probability_sweep/train_test.yml | kubectl create -f -

hfhd:
	aws s3 cp k8_configs/high_freq_high_delta/high_freq_high_delta.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/high_freq_high_delta/high_freq_high_delta.yml | kubectl create -f -

allkmers:
	aws s3 cp k8_configs/all_kmers/all_kmers.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/all_kmers/all_kmers.yml | kubectl create -f -

gdt:
	aws s3 cp k8_configs/gaussian_distribution_testing/gaussian_distribution_testing.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/gaussian_distribution_testing/gaussian_distribution_testing.yml | kubectl create -f -

ockt:
	aws s3 cp k8_configs/only_covered_kmers_training/only_covered_kmers_training.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/only_covered_kmers_training/only_covered_kmers_training.yml | kubectl create -f -

iant:
	aws s3 cp k8_configs/ivt_and_native_training/ivt_and_native_training.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/ivt_and_native_training/ivt_and_native_training.yml | kubectl create -f -
