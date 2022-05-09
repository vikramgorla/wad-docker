FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir /data
WORKDIR /data

ENTRYPOINT ["wad"]

CMD [ "-u","https://www.google.com" ]