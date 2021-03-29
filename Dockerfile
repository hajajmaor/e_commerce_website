FROM python:slim-buster

LABEL name="flaskapp"
LABEL maintainer="Maor Meir Hajaj"

COPY . /app
# RUN ls
WORKDIR /app

# ADD requirements.txt .
RUN pip3 install -r ./requirements.txt
HEALTHCHECK --interval=15s --timeout=10s --retries=3 CMD curl -f http://localhost:5000/ || exit 1

EXPOSE 5000
# ENTRYPOINT [ "python", "app.py" ]
CMD gunicorn -b 0.0.0.0:5000 wsgi:app
