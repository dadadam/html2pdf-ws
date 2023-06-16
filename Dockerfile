FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

ENV NUM_WORKERS=3
ENV TIMEOUT=120

WORKDIR /code

# COPY fonts/ /usr/share/fonts/truetype/

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

COPY --chown=weasy:weasy app.py .
COPY --chown=weasy:weasy requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 5001

CMD gunicorn --bind 0.0.0.0:5001 --timeout $TIMEOUT --workers $NUM_WORKERS app:app
