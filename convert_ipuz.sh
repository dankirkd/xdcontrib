SRCIPUZ=$1
OUTXD=$2

SRC=$(pwd)
mkdir -p "$OUTXD"
export PYTHONPATH=$SRC:$SRC

# Loop that is safe for processing files names that contain whitespace
find $SRCIPUZ -name "*.ipuz" | while read ipuzpath; do
    ipuz=${ipuzpath##$SRCIPUZ}
    ipuzname=${ipuz%.puz}
    xdfile/ipuz2xd.py "$ipuzpath" > "$OUTXD"/"$ipuzname".xd
done
