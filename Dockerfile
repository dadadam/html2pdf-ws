FROM ubuntu:18.04

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update -y\
    && apt-get install -y build-essential python3-dev python3-pip \
    python3-setuptools python3-wheel python3-cffi libcairo2 \
    libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 \
    libffi-dev shared-mime-info \
    && apt-get autoremove -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /code

COPY app.py .
COPY requirements.txt .

RUN pip3 install -r requirements.txt

EXPOSE 5001

ENV NUM_WORKERS=3
ENV TIMEOUT=120

CMD gunicorn --bind 0.0.0.0:5001 --timeout $TIMEOUT --workers $NUM_WORKERS app:app
