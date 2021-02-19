# TAG: dice
FROM python:3.9-alpine

WORKDIR /usr/src/app/

RUN pip3 install flask
COPY app.py /usr/src/app/app.py

ENV FLASK_RUN_HOST=0.0.0.0 \
    FLASK_RUN_PORT=8080
CMD ["flask", "run"]
