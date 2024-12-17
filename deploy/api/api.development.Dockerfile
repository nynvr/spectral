# Use an official Python runtime as the base image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
        nginx -y \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY ./apps/api/app/requirements.txt ./
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the current directory contents into the container at /app
COPY ./apps/api/app ./
COPY ./deploy/api/api.development.run.sh /scripts/api.run.sh

RUN chmod +x /scripts/api.run.sh
CMD ["/scripts/api.run.sh"]