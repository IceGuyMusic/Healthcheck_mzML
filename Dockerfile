#### This is the Dockerfile for the Healthcheck Service for mzML Files ####
FROM openms/library

COPY . /app

#RUN g++ -o /app/Healthcheck /app/main.cpp `pkg-config --cflags --libs OpenMS`

#WORKDIR /app

#COPY app.py /app/
#RUN pip install flask
#EXPOSE 5000

#CMD ["python", "app.py"]
