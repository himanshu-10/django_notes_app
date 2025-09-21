#base image
FROM python:3.9

#wirking directory inside container 
WORKDIR /app/backend

#copy

COPY requirements.txt /app/backend

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

#install dependecies / requiremts

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/backend

EXPOSE 8000	
