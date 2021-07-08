FROM python:3.6

EXPOSE 5001

WORKDIR /app
ADD . /app

COPY requirements.txt /app
RUN apt-get update -y
RUN pip3 install -r requirements.txt

ENV MYSQL_USERNAME="root"
ENV MYSQL_PASSWORD="12345"
ENV MYSQL_INSTANCE_NAME="myapp"
ENV MYSQL_PORT_3306_TCP_ADDR="mydb"
ENV MYSQL_PORT_3306_TCP_PORT=3306

COPY app.py /app
CMD python3 app.py
