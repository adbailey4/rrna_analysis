psweep:
	aws s3 cp k8_configs/probability_sweep/train_test.sh s3://bailey-k8s/rrna_yeast_data/
	# Run a kubernetes job with our image, prefix with USERNAME and timestamp
	TS=`date +"%Y%m%d-%H%M%S"` envsubst < k8_configs/probability_sweep/train_test.yml | kubectl create -f -
