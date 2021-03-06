#! /bin/sh

mkdir job

mc alias set refit $MINIO_HOST $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
mc mirror refit/$MINIO_BUCKET/$SCRIPT_LOCATION ./job

cd ./job

if [ -f "requirements.txt" ]; then
  pip3 install -r requirements.txt
fi

echo "Resources downloaded, begin script execution"
echo "============================================================================================="
python3 $SCRIPT_FILE
echo "============================================================================================="
echo "Script execution finished"