FROM pachyderm/pachctl:1.11.0-461bdac3ce55e61582e571e4414ea7bd7c306c1d
RUN apt update -y && apt install -y jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
