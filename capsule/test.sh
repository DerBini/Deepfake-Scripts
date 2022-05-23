# Test single
python3 test.py --dataset dataset/${method}/ --test_set test \
  --workers 8 --outf checkpoints/deepfakes --id ${id}

#Test against multiple
id=12
out=test_${id}.log
methods=("deepfakes" "face2face" "faceshift" "faceswap" "neural" "all")
for method in ${methods[@]}; do echo ${method}cls >> $out; \
python3 test.py --dataset dataset_small/${method}/ --test_set test --workers 8 --outf checkpoints/deepfakes --id ${id} >> $out; done

id=12
out=test_${id}.log
methods=("deepfakes" "face2face" "faceshift" "faceswap" "neural" "all" "dfd")
for method in ${methods[@]}; do echo ${method}cls >> $out; \
python3 test.py --dataset dataset_small/${method}/ --test_set test --workers 8 --outf checkpoints/dfd --id ${id} >> $out; done