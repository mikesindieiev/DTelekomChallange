FROM python:3.12.0b3-alpine3.18
RUN adduser -s /bin/sh -D getweather
USER getweather
ADD requirements.txt .
ADD geo .
RUN pip install -r requirements.txt
ENTRYPOINT [ "python3", "geo" ]