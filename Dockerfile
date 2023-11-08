#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
FROM openms/library

COPY . .

#RUN g++ -o Healthcheck main.cpp `pkg-config --cflags --libs OpenMS`

RUN apt-get install python3-pip && \
    python3 -m pip install flask
EXPOSE 5000

CMD ["python", "app.py"]
