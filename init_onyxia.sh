#!/bin/sh

# change the session name and the working directory if necessary
SESSION=onyxia
WORK_DIR=/home/${SESSION}/work

CLONE_DIR=${WORK_DIR}/llm-experiment
ENV_DIR=${WORK_DIR}/llm-env
LLAMA_DIR=${ENV_DIR}/llama
# Clone course repository
REPO_URL=git@github.com:llm-experiment.git

git clone --depth 1 $REPO_URL $CLONE_DIR

# python3 -m venv $ENV_DIR
# Install additional packages if needed
REQUIREMENTS_FILE=${CLONE_DIR}/requirements.txt
python -m pip install -r $REQUIREMENTS_FILE
cd $LLAMA_DIR & python -m pip install -e .

mc cp $TOKENIZER_PATH $WORK_DIR
mkdir ${WORK_DIR}/7B
mc cp --r $MODEL_7_PATH ${WORK_DIR}/7B

# the last line is for onyxia
sudo chown ${SESSION} -R /home/${SESSION}/ # Otherwise onyxia user has no rights on the local repo folder.
chmod +777 ${CLONE_DIR}/run_example.sh
