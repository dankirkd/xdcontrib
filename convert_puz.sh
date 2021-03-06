SRCPUZ=$1
OUTXD=$2

SRC=$(pwd)
mkdir -p "$OUTXD"
export PYTHONPATH=$SRC:$SRC

# Loop that is safe for processing files names that contain whitespace
find $SRCPUZ -name "*.puz" | while read puzpath; do
    puz=${puzpath##$SRCPUZ}
    puzname=${puz%.puz}
    xdfile/puz2xd.py "$puzpath" > "$OUTXD"/"$puzname".xd
done
