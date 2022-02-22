#!/bin/bash
# 项目主目录
BASE_DIR=/usr/local/flask_demo
cd ${BASE_DIR}

# 自动创建日志日志，防止目录不存在时报错
if [ ! -d "logs" ]
then
    mkdir -p logs
fi

# 清除原来的pyc文件
# find ${BASE_DIR} -type f -name *.pyc|xargs rm -f


# 启动python web容器gunicorn
gunicorn -w 1 -b 0.0.0.0:5000 -t 120 --threads 2 flask_demo:app >> log 1>&1 2>&1  &
