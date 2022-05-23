# Test single
python3 test_cls.py --dataset datasets/${method}/ --test_set test2 \
  --outf checkpoints/${test} --id ${id} ;
python3 test_seg.py --dataset datasets/${method}/ --test_set test \
  --outf checkpoints/${test} --id ${id} ;

# Test against multiple
id=76
test="google"
out=test_${test}.log
methods=("deepfakes" "face2face" "faceshifter" "faceswap" "neutral" "all" "google_dfd")
for method in ${methods[@]}; do echo ${method}cls >> $out; \
python3 test_cls.py --dataset datasets/${method}/ --test_set test --workers 8 --outf checkpoints/${test} --id ${id} >> $out; \
echo ${method}cls2 >> $out; \
python3 test_cls.py --dataset datasets/${method}/ --test_set test2  --workers 8 --outf checkpoints/${test} --id ${id} >> $out; \
echo ${method}seg >> $out; \
python3 test_seg.py --dataset datasets/${method}/ --test_set test  --workers 8 --outf checkpoints/${test} --id ${id} >> $out ; done
