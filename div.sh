# Create multiple folders at once
mkdir -p {test,val,train}/{real,fake}

# Copy all sets together
cp --backup=t deepfakes/test/real/* face2face/test/real/* faceshift/test/real/* faceswap/test/real/* neural/test/real/* -t all/test/real/
cp --backup=t deepfakes/test/fake/* face2face/test/fake/* faceshift/test/fake/* faceswap/test/fake/* neural/test/fake/* -t all/test/fake/

# Rename all files in a folder numeric
ls -v | cat -n | while read n f; do mv -n "$f" "$n.jpg"; done