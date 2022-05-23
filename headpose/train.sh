tests=("deepfake" "face2face" "faceswap" "faceshift" "neural")
for test in ${tests[@]}; do
    python3 train_step1_landmarks.py --real_video_dir train/real --fake_video train/${test}/fake --output_landmark_path out/${test}_small.p ;
    python3 train_step2_headposes.py --landmark_info_path out/${test}_small.p --headpose_save_path out2/${test}_small.p ;
    python3 train_step3_training.py --headpose_path out2/${test}_small.p --model_save_path models/${test}_small.p ;
done