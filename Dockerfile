FROM python:3.8
LABEL maintainer="anonshubh"

ENV PATH="/scripts:${PATH}"

COPY ./requirements.txt /requirements.txt
RUN apt-get update && apt-get upgrade
RUN pip install -r /requirements.txt

RUN mkdir /app
COPY . /app
WORKDIR /app
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

RUN adduser --disabled-password --gecos '' user
RUN chown -R user /vol
RUN chmod -R 755 /vol/web
USER user   

CMD ["entrypoint.sh"]