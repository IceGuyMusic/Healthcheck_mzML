#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
FROM openms/library

RUN cp -r /OpenMS/ ~/OpenMS/

COPY main.py main.py
COPY main.cpp main.cpp

RUN g++ main.cpp -o Healthcheck
RUN apt-get update && apt-get install -y python3-pip && python3 -m pip install flask

EXPOSE 5000

CMD ["python3", "main.py"]
