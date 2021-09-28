FROM python:3.9-buster

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY fonts/ /usr/share/fonts/truetype/

RUN apt-get update -y\
    && apt-get install -y python3-cffi libcairo2 \
    libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 \
    libffi-dev shared-mime-info \
    fc-cache -f -v \
    && apt-get autoremove -y \
    && apt-get clean

RUN addgroup --system weasy \
    && adduser --system --ingroup weasy weasy

RUN mkdir /app
WORKDIR /code

COPY --chown=weasy:weasy app.py .
COPY --chown=weasy:weasy requirements.txt .

RUN pip3 install -r requirements.txt

EXPOSE 5001

ENV NUM_WORKERS=3
ENV TIMEOUT=120

CMD gunicorn --bind 0.0.0.0:5001 --timeout $TIMEOUT --workers $NUM_WORKERS app:app
