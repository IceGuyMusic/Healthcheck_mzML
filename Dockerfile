#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
FROM python:3.9-slim

RUN apt-get update && apt-get install -y g++ make


RUN apt-get install -y libopenms-dev
COPY main.cpp /app/
RUN g++ -o /app/Healthcheck /app/main.cpp -I/usr/include/OpenMS -lOpenMS

WORKDIR /app

COPY app.py /app/
RUN pip install flask
EXPOSE 5000

CMD ["python", "app.py"]
