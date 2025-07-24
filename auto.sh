set -x
while true
do
    cd /workspace/go_attack
    bash kubernetes/victimplay.sh lion0725 /workspace/shared -max-games-total 1000
    bash kubernetes/shuffle-and-export.sh lion0725 /workspace/shared
    bash kubernetes/train.sh lion0725 /workspace/shared 1 -samples-per-epoch 200000 -max-epochs-this-instance 2 -quit-if-no-data -stop-when-train-bucket-limited
    cd /workspace/go_attack/engines/KataGo-custom/python
    bash selfplay/export_model_for_selfplay.sh Kissin /workspace/shared/victimplay/lion0725 0 0
done