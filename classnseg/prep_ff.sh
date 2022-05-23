# Split fake set
jq  -r '.[] | .[0] as $first | .[1]? | $first+"_"+.+".mp4"' train.json | 
  while read file ; do 
    cp videos/${file} train ;
  done


# Split ori set
jq  -r '.[][]+".mp4"' test.json | 
  while read file ; do 
    cp videos/${file} test ;
  done

# Convert mask videos to images
for file in *; do 
    mkdir ${file%%.*} ; 
    ffmpeg -hide_banner -loglevel error \
      -i ${file} -start_number 0 ${file%%.*}/%04d.png ;
done

# Create dataset for ClassNSeg
python3 create_dataset_Deepfakes.py \
  --input_fake FaceForensics/manipulated_sequences/Deepfakes/c23/train \
  --input_real FaceForensics/original_sequences/youtube/c23/train \
  --mask FaceForensics/manipulated_sequences/Deepfakes/masks/train \
  --output_real datasets/deepfakes/train/original \
  --output_fake datasets/deepfakes/train/altered

# Crop Segmentation Mask from images
for file in $(ls test/<altered, original>/ ) ; do
    convert test/<altered, original>/${file} -crop 256x256+0+0 
      test2/<altered, original>/${file} ;
done





for file in $(ls) ; do
    convert ${file} -crop 256x256+0+0 ../../test2/original/${file} ;
done