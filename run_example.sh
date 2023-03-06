SESSION=onyxia
WORK_DIR=/home/${SESSION}/work
TARGET_FOLDER=${WORK_DIR}/llm-experiment
MODEL_SIZE=7B
LLAMA_FOLDER=${TARGET_FOLDER}/llama
MP=1
cd $LLAMA_FOLDER & pip install -e

torchrun --nproc_per_node $MP ${TARGET_FOLDER}/example.py --ckpt_dir ${WORK_DIR}/${MODEL_SIZE} --tokenizer_path ${WORK_DIR}/tokenizer.model
