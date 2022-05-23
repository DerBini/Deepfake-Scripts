python3 run_test.py --input_dir ff/manipulated_sequences/Deepfakes/c23/test/ --classifier_path models/deepfake_small.p --save_file .

cat deepfake.log | grep fake_proba | cut -d " " -f2 | tr -d ","   | awk '{total += $1; count ++} END {print total/count}'
