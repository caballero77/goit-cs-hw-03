FROM postgres as db

RUN apt-get update

RUN apt-get install -y python3 python3-venv python3-pip
RUN python3 -m venv /app/venv

COPY ./requirements.txt ./requirements.txt
RUN /app/venv/bin/pip install --upgrade pip
RUN /app/venv/bin/pip install -r requirements.txt

WORKDIR /app
COPY ./scripts/init.sh /docker-entrypoint-initdb.d
COPY ./scripts/schema.sql ./scripts/db/schema.sql
COPY ./scripts/seed.py ./seed.py
COPY ./scripts/seed.sh ./seed.sh