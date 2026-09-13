FROM python:3.11-slim
WORKDIR /app
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*
COPY ti-platform.zip .
RUN unzip -o ti-platform.zip && rm ti-platform.zip
WORKDIR /app/ti-platform
RUN pip install --no-cache-dir -r requirements.txt
RUN mkdir -p /app/ti-platform/data
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
