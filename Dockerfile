FROM 793787590926.dkr.ecr.us-east-1.amazonaws.com/node:16.15.0
RUN apt-get update && apt-get install \ 
        python3 \
        python3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_SESSION_TOKEN
ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN
RUN aws --version
RUN aws s3 ls
WORKDIR /app
COPY . ./
RUN ls 
