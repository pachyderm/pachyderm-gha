FROM pachyderm/pachctl:1.11.2
RUN apt update -y && apt install -y jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
