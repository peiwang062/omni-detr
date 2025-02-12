#!/usr/bin/env bash

set -x

EXP_DIR=results/r50_coco35to80_points_pixels800_ufo_epoch500_burnin10_thres70
PY_ARGS=${@:1}

python -u main.py \
    --output_dir ${EXP_DIR} \
    ${PY_ARGS} \
    --BURN_IN_STEP 10 \
    --TEACHER_UPDATE_ITER 1 \
    --EMA_KEEP_RATE 0.9996 \
    --annotation_json_label 'instances_valminusminival2014_w_indicator.json' \
    --annotation_json_unlabel 'instances_train2014_w_indicator_pointsK.json' \
    --CONFIDENCE_THRESHOLD 0.7 \
    --data_path './coco' \
    --lr 2e-4 \
    --epochs 500 \
    --lr_drop 500 \
    --pixels 800 \
    --dataset_file 'coco_35to80_point' \
    --resume '' \

