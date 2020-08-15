FROM python:2.7.18-alpine3.11

RUN apk update && apk upgrade && apk add bash

WORKDIR /usr/src/app
COPY src/scripts/requirements.txt ./
COPY src/scripts/es_test_data.py .
COPY src/scripts/start-data-load.sh .
RUN chmod a+x /usr/src/app/start-data-load.sh

RUN pip install --no-cache-dir -r requirements.txt

ENV force_init_index="False"
ENV batch_size="1000"
ENV index_name="local.test.index"
ENV num_of_shards="1"
ENV num_of_replicas="1"
ENV count="1000"

ENTRYPOINT ["/bin/bash","/usr/src/app/start-data-load.sh"]