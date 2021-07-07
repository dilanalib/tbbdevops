FROM python:3.6

EXPOSE 5001

WORKDIR /app

COPY requirements.txt /app
RUN apt-get update -y
RUN pip3 install -r requirements.txt

COPY app.py /app
CMD python3 app.py
