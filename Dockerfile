FROM bitnami/python:3.8

RUN apt-get update \
    && /bin/bash

RUN groupadd -g 1001 app && useradd -r -u 1001 -g app app
RUN mkdir /home/app && chown 1001 /home/app
USER 1001
WORKDIR /app

COPY src src/
ADD requirements.txt .
ADD src/manage.py ./manage.py
ENV PATH="/home/app/.local/bin:${PATH}"
RUN pip install --upgrade pip &&  pip install --user -r requirements.txt

EXPOSE 8080
CMD ["python", "src/manage.py", "runserver", "0.0.0.0:8080", "--noreload"]