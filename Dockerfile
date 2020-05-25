# 基础镜像
FROM rayproject/autoscaler

# 维护者
MAINTAINER dt@gaea.com

# 拷贝requirement
COPY requirement.txt .

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y vim
RUN pip install pip -U
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip --default-timeout=100 install -r requirement.txt
RUN pip install --upgrade ray;

# 环境变量
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64