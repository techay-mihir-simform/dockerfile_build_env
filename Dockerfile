FROM 365638482223.dkr.ecr.us-east-1.amazonaws.com/node:16.15.0
RUN apk add --no-cache \ 
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*
RUN aws --version
RUN aws s3 ls
WORKDIR /app
COPY . ./
RUN ls 
