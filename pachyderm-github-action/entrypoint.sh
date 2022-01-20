#!/bin/bash

echo '{"pachd_address": "'${PACHYDERM_CLUSTER_URL}'"}' | pachctl config set context default --overwrite
echo "${PACHYDERM_TOKEN}" | pachctl auth use-auth-token

update_pipeline() {
    # even if the pipeline doesn't exist, this will create it.
    jq --arg tag "${DOCKER_IMAGE_NAME}" --arg version "${GITHUB_SHA}" '.transform.image |= $tag+":"+$version' "$1" | pachctl update pipeline
}

for pipeline in  ${PACHYDERM_PIPELINE_FILES}
do
    if   [ -d "${pipeline}" ]
    then
        echo "${pipeline} is a directory, updating all pipelines in directory.";
        for pipe_file in  ${pipeline}; do update_pipeline "${pipe_file}"; done
    elif [ -f "${pipeline}" ]
    then update_pipeline "${pipeline}"
    else echo "${pipeline} is not valid";
        exit 1
    fi
done

