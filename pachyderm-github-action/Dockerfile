FROM python:3.8.12
RUN pip install python-pachyderm
COPY *.py /

ENTRYPOINT ["/pipeline_update.py"]
