FROM python:3.8.1-slim-buster

ENV PYTHONUNBUFFERED=1 

EXPOSE 8080

RUN apt-get update --yes --quiet && apt-get install --yes --quiet --no-install-recommends \
    build-essential \
    libpq-dev \
    libmariadbclient-dev \
    libjpeg62-turbo-dev \
    zlib1g-dev \
    libwebp-dev

COPY . /infogami
WORKDIR /infogami
RUN pip install -r requirements.txt
CMD python sample_run.py install ; python sample_run.py
# CMD [ "python", "sample_run.py" ]
# CMD set -xe; python manage.py migrate --noinput; gunicorn alokin.wsgi:application
