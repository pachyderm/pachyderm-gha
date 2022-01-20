FROM pachyderm/pachctl:2.0.5
RUN apt update -y && apt install -y jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
