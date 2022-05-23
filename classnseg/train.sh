# Train
for i in {0..100}; do 
    python3 train.py --dataset datasets/deepfakes --train_set train \
      --val_set validation --outf checkpoints/full --workers 6 --batchSize 64 \
      --niter 100 --resume ${i} >> classnseg.log ;
done

# Evaluate best Epoch
cat classnseg.log | grep Epoch | cut  -d " " -f2,27 | sort -s -k 2 | tail -n 1