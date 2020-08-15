#/bin/bash -x
echo "Starting ES data load module: "

echo "es_url=${es_url}"
echo "batch_size=${batch_size}"
echo "index_name=${index_name}"
echo "num_of_shards=${num_of_shards}"
echo "num_of_replicas=${num_of_replicas}"
echo "count=${count}"
echo "username=${username}"
echo "force_init_index=${force_init_index}"

[ -n "${es_url}" ] || { echo "es_url environment variable is not set"; exit 1; }

if [ ! -z "${username}" ]; then
    if [ -z "${password}" ]; then
    echo "ERROR: password cannot be empty"
    exit 1
    fi
fi

cmdopt=" --es_url=${es_url}"

if [ ! -z "${batch_size}" ]; then
   cmdopt="${cmdopt} --batch_size=${batch_size}"
fi
if [ ! -z "${index_name}" ]; then
   cmdopt="${cmdopt} --index_name=${index_name}"
fi
if [ ! -z "${num_of_shards}" ]; then
   cmdopt="${cmdopt} --num_of_shards=${num_of_shards}"
fi
if [ ! -z "${num_of_replicas}" ]; then
   cmdopt="${cmdopt} --num_of_replicas=${num_of_replicas}"
fi
if [ ! -z "${count}" ]; then
   cmdopt="${cmdopt} --count=${count}"
fi
if [ ! -z "${username}" ]; then
   cmdopt="${cmdopt} --username=${username}"
fi
if [ ! -z "${password}" ]; then
   cmdopt="${cmdopt} --password=${password}"
fi
if [ ! -z "${force_init_index}" ]; then
   cmdopt="${cmdopt} --force_init_index=${force_init_index}"
fi

# echo "params : ${cmdopt}"

python es_test_data.py ${cmdopt} 

echo "Finished loading data to ES"