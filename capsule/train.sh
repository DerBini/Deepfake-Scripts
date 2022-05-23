# Train
python3 train.py --dataset datase/deepfakes/ --train_set train \
  --val_set val --batchSize 64 --niter 100 \
  --outf checkpoints/deepfakes/ >> deepfakes.log

# Evaluate best Epoch
cat classnseg.log | grep Epoch | cut  -d " " -f2,16 | sort -s -k 2 | tail -n 1

