#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
FROM openms/library

COPY .

RUN g++ -o Healthcheck main.cpp `pkg-config --cflags --libs OpenMS`

RUN pip install flask
EXPOSE 5000

CMD ["python", "app.py"]
