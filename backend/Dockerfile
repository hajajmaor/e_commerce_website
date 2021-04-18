FROM python:alpine

# LABEL name="flaskapp"
# LABEL maintainer="Maor Meir Hajaj"

# COPY . /app
# # RUN ls
# WORKDIR /app

# # ADD requirements.txt .
# RUN pip3 install -r ./requirements.txt
# HEALTHCHECK --interval=15s --timeout=10s --retries=3 CMD curl -f http://localhost:5000/ || exit 1

# EXPOSE 5000
# # ENTRYPOINT [ "python", "app.py" ]
# CMD gunicorn -b 0.0.0.0:5000 wsgi:app
# FROM python:3.8

COPY requirements.txt /app/requirements.txt
WORKDIR /app
ENV FLASK_APP=app
ENV FLASK_DEBUG=1
RUN pip3 install -r ./requirements.txt
#COPY . .


# RUN "python run_one_time.py"
CMD  ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]
