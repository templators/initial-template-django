FROM python:3.11

COPY bashrc /root/.bashrc

EXPOSE 8000

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY src /app

RUN adduser -u 5678 --disabled-password --gecos "" prod && chown -R prod /app
USER prod

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi"]
