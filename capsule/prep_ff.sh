# Generate Dataset
# Due to licensing issues I can not provide the file called in the following code.
# To reproduce: Take the original script from https://github.com/nii-yamagishilab/ClassNSeg/blob/master/create_dataset_Deepfakes.py and delete the segmentation map code (commit id 1d9ed0c code line 123)
python3 create_dataset_Deepfakes-without_mask.py --limit 10 --input_fake ../../df/ff/manipulated_sequences/Face2Face/c23/val --input_real ../../df/ff/original_sequences/youtube/c23/val 
--mask ../../df/ff/manipulated_sequences/FaceSwap/masks/val --output_real ../ff_ori/val --output_fake .

python3 create_dataset_Deepfakes-withou
t_mask.py --limit 10 --input_fake ../google_dfd/train/fake/ --input_real ../goog
le_dfd/train/real/ --mask ../ff/manipulated_sequences/FaceSwap/masks/train --out
put_real ../Capsule-Forensics/dataset/dfd/train/real/ --output_fake .