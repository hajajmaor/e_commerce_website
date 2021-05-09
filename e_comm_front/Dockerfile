# FROM cirrusci/flutter:stable as builder
FROM flutter_image:0.1.4 as builder
COPY . /app
WORKDIR /app
# USER user
RUN ["flutter","pub","get"]
RUN ["flutter","build","web"]


FROM python:slim-buster
COPY --from=builder /app/build/web /app
WORKDIR /app
EXPOSE 8000
RUN echo running in http://localhost/
CMD ["python3","-m","http.server"]