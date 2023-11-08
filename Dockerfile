#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
FROM openms/library

COPY app.py app.py

#RUN g++ -o Healthcheck main.cpp `pkg-config --cflags --libs OpenMS`

RUN apt-get update && apt-get install -y python3-pip && python3 -m pip install flask

EXPOSE 5000

CMD ["python3", "app.py"]
